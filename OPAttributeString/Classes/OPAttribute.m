//
//  OPAttribute.m
//  OPAttributeString
//
//  Created by ooops on 2017/12/15.
//  Copyright © 2017年 张强. All rights reserved.
//

#import "OPAttribute.h"


NSString * const kLineSpacing                   = @"lineSpacing";
NSString * const kParagraphSpacing              = @"paragraphSpacing";
NSString * const kAlignment                     = @"alignment";
NSString * const kFirstLineHeadIndent           = @"firstLineHeadIndent";
NSString * const kHeadIndent                    = @"headIndent";
NSString * const kTailIndent                    = @"tailIndent";
NSString * const kLineBreakMode                 = @"lineBreakMode";
NSString * const kMinimumLineHeight             = @"minimumLineHeight";
NSString * const kMaximumLineHeight             = @"maximumLineHeight";
NSString * const kLineHeightMultiple            = @"lineHeightMultiple";
NSString * const kParagraphSpacingBefore        = @"paragraphSpacingBefore";
NSString * const kHyphenationFactor             = @"hyphenationFactor";
NSString * const kDefaultTabInterval            = @"defaultTabInterval";

@interface OPAttribute()

@property(nonatomic, strong) NSMutableArray<NSValue *>      *ranges;
/** 所有属性中的字体大小 */
@property (nonatomic, strong) NSMutableArray<NSNumber *>    *fontSize;
/** 段落样式 */
@property (nonatomic, strong) NSMutableParagraphStyle       *paragraphStyle;

@end

@implementation OPAttribute


- (instancetype)initWithString:(NSString *)string {
    if (self = [super init]) {
        _string = [[NSMutableAttributedString alloc] initWithString:string];
        _ranges = [NSMutableArray arrayWithObject:[NSValue valueWithRange:NSMakeRange(0, string.length)]];
    }
    return self;
}


- (NSMutableArray<NSValue *> *)ranges {
    if (!_ranges) {
        _ranges = [NSMutableArray array];
    }
    return _ranges;
}

- (NSMutableArray<NSNumber *> *)fontSize {
    if(_fontSize) return _fontSize;
    _fontSize = [NSMutableArray array];
    return _fontSize;
}

- (NSMutableParagraphStyle *)paragraphStyle {
    if(_paragraphStyle) return _paragraphStyle;
    _paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    return _paragraphStyle;
}

#pragma mark - Attributes

- (OPAttributeFontBlock)font {
    return ^OPAttribute *(UIFont *font) {
        NSAssert(font, @"font can not be nil");
        [self setValue:font forAttribute:NSFontAttributeName];
        [self.fontSize addObject:[NSNumber numberWithFloat:font.pointSize]];
        return self;
    };
}

- (OPAttributeColorBlock)textColor {
    return ^OPAttribute *(UIColor *textColor) {
        NSAssert(textColor, @"textColor can not be nil");
        [self setValue:textColor forAttribute:NSForegroundColorAttributeName];
        return self;
    };
}

- (OPAttributeColorBlock)backgroundColor {
    return ^OPAttribute *(UIColor *backgroundColor) {
        NSAssert(backgroundColor, @"backgroundColor can not be nil");
        [self setValue:backgroundColor forAttribute:NSBackgroundColorAttributeName];
        return self;
    };
}

- (OPAttributeColorBlock)strokeColor {
    return ^OPAttribute *(UIColor *strokeColor) {
        NSAssert(strokeColor, @"strokeColor can not be nil");
        [self setValue:strokeColor forAttribute:NSStrokeColorAttributeName];
        return self;
    };
}

- (OPAttributeFloatBlock)strokeWidth {
    return ^OPAttribute *(CGFloat width) {
        [self setValue:@(width) forAttribute:NSStrokeWidthAttributeName];
        return self;
    };
}

- (OPAttributeIntBlock)ligature {
    return ^OPAttribute *(NSInteger ligature) {
        [self setValue:@(ligature) forAttribute:NSLigatureAttributeName];
        return self;
    };
}

- (OPAttributeFloatBlock)kern {
    return ^OPAttribute *(CGFloat kern) {
        [self setValue:@(kern) forAttribute:NSKernAttributeName];
        return self;
    };
}

- (OPAttributeIntBlock)strikethroughStyle {
    return ^OPAttribute *(NSUnderlineStyle style) {
        [self setValue:@(style) forAttribute:NSStrikethroughStyleAttributeName];
        return self;
    };
}

- (OPAttributeIntBlock)underlineStyle {
    return ^OPAttribute *(NSUnderlineStyle style) {
        [self setValue:@(style) forAttribute:NSUnderlineStyleAttributeName];
        return self;
    };
}

- (OPAttributeShadowBlock)shadow {
    return ^OPAttribute *(UIColor *shadowColor, CGSize size, CGFloat blurRadius) {
        NSAssert(shadowColor, @"shadowColor can not be nil");
        NSShadow *shadow = [[NSShadow alloc] init];
        shadow.shadowColor = shadowColor;
        shadow.shadowOffset = size;
        shadow.shadowBlurRadius = blurRadius;
        [self setValue:shadow forAttribute:NSShadowAttributeName];
        return self;
    };
}

- (OPAttributeStringBlock)textEffectLetterPress {
    return ^OPAttribute *(NSString *effect) {
        [self setValue:effect forAttribute:NSTextEffectAttributeName];
        return self;
    };
}

- (OPAttributeAttachmentBlock)attachment {
    return ^OPAttribute *(UIImage *image, NSInteger index, CGRect rect, AttachmentAlignment alignment) {
        NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
        attachment.image = image;

        CGFloat deltaY, maxValue = [[self.fontSize valueForKeyPath:@"@max.floatValue"] floatValue];
        NSInteger sign = rect.size.height > maxValue ? -1 : 1;
        switch (alignment) {
            case AttachmentAlignmentTop: {
                deltaY = ABS(rect.size.height - maxValue) * sign;
                deltaY -= 6 ;
            }
                break;
            case AttachmentAlignmentCenter: {
                deltaY = ABS(maxValue - rect.size.height * .5) * sign;
            }
                break;
            case AttachmentAlignmentBottom:
                deltaY = 0.f;
                break;

            default:
                deltaY = 0.f;
                break;
        }

        attachment.bounds = CGRectOffset(rect, 0, deltaY);
        NSAttributedString *attribute = [NSAttributedString attributedStringWithAttachment:attachment];
        [self.string insertAttributedString:attribute atIndex:index];
        return self;
        
    };
}

- (OPAttributeStringBlock)link {
    return ^OPAttribute *(NSString *link) {
        [self setValue:link forAttribute:NSLinkAttributeName];
        return self;
    };
}

- (OPAttributeFloatBlock)offset {
    return ^OPAttribute *(CGFloat offset) {
        [self setValue:@(offset) forAttribute:NSBaselineOffsetAttributeName];
        return self;
    };
}

- (OPAttributeColorBlock)underlineColor {
    return ^OPAttribute *(UIColor *color) {
        NSAssert(color, @"underlineColor can not be nil");
        [self setValue:color forAttribute:NSUnderlineColorAttributeName];
        return self;
    };
}

- (OPAttributeColorBlock)strikethroughColor {
    return ^OPAttribute *(UIColor *color) {
        NSAssert(color, @"strikethroughColor can not be nil");
        [self setValue:color forAttribute:NSStrikethroughColorAttributeName];
        return self;
    };
}

- (OPAttributeFloatBlock)oblique {
    return ^OPAttribute *(CGFloat oblique) {
        [self setValue:@(oblique) forAttribute:NSObliquenessAttributeName];
        return self;
    };
}

- (OPAttributeFloatBlock)expand {
    return ^OPAttribute *(CGFloat expand) {
        [self setValue:@(expand) forAttribute:NSExpansionAttributeName];
        return self;
    };
}

- (OPAttributeIntBlock)writingDirection {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    return ^OPAttribute *(NSTextWritingDirection direction) {
        [self setValue:@[@(direction)] forAttribute:NSWritingDirectionAttributeName];
        return self;
    };
#pragma clang diagnostic pop
}

- (OPAttributeIntBlock)verticalGlyphForm {
    return ^OPAttribute *(NSInteger glyph) {
        [self setValue:@(glyph) forAttribute:NSVerticalGlyphFormAttributeName];
        return self;
    };
}

#pragma mark - Range

- (OPAttributeRangeBlock)range {
    return ^OPAttribute *(NSRange range) {
        [self.ranges removeAllObjects];
        [self.ranges addObject:[NSValue valueWithRange:range]];
        return self;
    };
}

- (OPAttributeIntIntBlock)fromTo {
    return ^OPAttribute *(NSInteger from, NSInteger to) {
        [self.ranges removeAllObjects];
        [self.ranges addObject:[NSValue valueWithRange:NSMakeRange(from, to - from)]];
        return self;
    };
}

- (OPAttributeIntBlock)from {
    return ^OPAttribute *(NSInteger from) {
        [self.ranges removeAllObjects];
        [self.ranges addObject:[NSValue valueWithRange:NSMakeRange(from, self.string.length - from)]];
        return self;
    };
}

- (OPAttributeIntBlock)to {
    return ^OPAttribute *(NSInteger to) {
        [self.ranges removeAllObjects];
        [self.ranges addObject:[NSValue valueWithRange:NSMakeRange(0, to)]];
        return self;
    };
}

- (OPAttributeStringBlock)rangeOf {
    return ^OPAttribute *(NSString *rangeOf) {
        NSAssert(rangeOf, @"rangeOf can not be nil");
        NSAssert(self.string.string, @"self.string.string can not be nil");
        [self.ranges removeAllObjects];
        
        [self.ranges addObject:[NSValue valueWithRange:[self rangeOfObject:rangeOf]]];
        
        return self;
    };
}

- (OPAttributeStringBlock)pattern {
    return ^OPAttribute *(NSString *pattern) {
        [self.ranges removeAllObjects];
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
        [regex enumerateMatchesInString:self.string.string
                                options:NSMatchingReportProgress
                                  range:NSMakeRange(0, self.string.string.length)
                             usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
            [self.ranges addObject:[NSValue valueWithRange:[result range]]];
        }];
        return self;
    };
}


#pragma mark - NSParagraphStyle

- (OPAttributeFloatBlock)lineSpacing {
    return ^OPAttribute *(CGFloat lineSpacing) {
        [self setValue:@(lineSpacing) forParagraphStyleKey:kLineSpacing];
        return self;
    };
}

- (OPAttributeFloatBlock)paragraphSpacing {
    return ^OPAttribute *(CGFloat paragraphSpacing) {
        [self setValue:@(paragraphSpacing) forParagraphStyleKey:kParagraphSpacing];
        return self;
    };
}

- (OPAttributeTextAlignmentBlock)alignment {
    return ^OPAttribute *(NSTextAlignment alignment) {
        [self setValue:@(alignment) forParagraphStyleKey:kAlignment];
        return self;
    };
}

- (OPAttributeFloatBlock)firstLineHeadIndent {
    return ^OPAttribute *(CGFloat firstLineHeadIndent) {
        [self setValue:@(firstLineHeadIndent) forParagraphStyleKey:kFirstLineHeadIndent];
        return self;
    };
}
- (OPAttributeFloatBlock)headIndent {
    return ^OPAttribute *(CGFloat headIndent) {
        [self setValue:@(headIndent) forParagraphStyleKey:kHeadIndent];
        return self;
    };
}
- (OPAttributeFloatBlock)tailIndent {
    return ^OPAttribute *(CGFloat tailIndent) {
        [self setValue:@(tailIndent) forParagraphStyleKey:kTailIndent];
        return self;
    };
}
- (OPAttributeLineBreakModeBlock)lineBreakMode {
    return ^OPAttribute *(NSLineBreakMode lineBreakMode) {
        [self setValue:@(lineBreakMode) forParagraphStyleKey:kLineBreakMode];
        return self;
    };
}
- (OPAttributeFloatBlock)minimumLineHeight {
    return ^OPAttribute *(CGFloat minimumLineHeight) {
        [self setValue:@(minimumLineHeight) forParagraphStyleKey:kMinimumLineHeight];
        return self;
    };
}
- (OPAttributeFloatBlock)maximumLineHeight {
    return ^OPAttribute *(CGFloat maximumLineHeight) {
        [self setValue:@(maximumLineHeight) forParagraphStyleKey:kMaximumLineHeight];
        return self;
    };
}
- (OPAttributeFloatBlock)lineHeightMultiple {
    return ^OPAttribute *(CGFloat lineHeightMultiple) {
        [self setValue:@(lineHeightMultiple) forParagraphStyleKey:kLineHeightMultiple];
        return self;
    };
}
- (OPAttributeFloatBlock)paragraphSpacingBefore {
    return ^OPAttribute *(CGFloat paragraphSpacingBefore) {
        [self setValue:@(paragraphSpacingBefore) forParagraphStyleKey:kParagraphSpacingBefore];
        return self;
    };
}
- (OPAttributeFloatBlock)hyphenationFactor {
    return ^OPAttribute *(CGFloat hyphenationFactor) {
        [self setValue:@(hyphenationFactor) forParagraphStyleKey:kHyphenationFactor];
        return self;
    };
}
- (OPAttributeFloatBlock)defaultTabInterval {
    return ^OPAttribute *(CGFloat defaultTabInterval) {
        [self setValue:@(defaultTabInterval) forParagraphStyleKey:kDefaultTabInterval];
        return self;
    };
}

#pragma mark - Operation AttributeString
- (OPAttributeOperationBlock)insert {
    return ^OPAttribute *(id insert, ...) {
        // e.g Mansory MASUtilities.h Start From Line 67
        va_list v;
        va_start(v, insert);
        int index = va_arg(v, int);

        index = (index < 0 || index > self.string.string.length) ? self.string.length : index;

        if([insert isKindOfClass:[NSString class]]) {
            [self.string insertAttributedString:[[NSAttributedString alloc] initWithString:insert] atIndex:index];
        }
        else if([insert isKindOfClass:[NSAttributedString class]]) {
            [self.string insertAttributedString:insert atIndex:index];
        }
        else if([insert isKindOfClass:[UIImage class]]) {
            self.attachment(insert, index, va_arg(v, CGRect), va_arg(v, unsigned int));
        }
        va_end(v);
        return self;
    };
}

- (OPAttributeOperationBlock)removeE {
    return ^OPAttribute *(id remove, ...) {
        va_list v;
        va_start(v, remove);
        NSRange range = va_arg(v, NSRange);
        NSArray *array;
        range = rangeCheck(allRange(self.string), range) ? range : allRange(self.string);
        if([remove isKindOfClass:[NSArray class]]) {
            if([remove count] <= 0) return self;

            for (int i = 0; i < [remove count]; i++) {
                id pattern = remove[i];
                if([pattern isKindOfClass:[NSString class]]) {
                    array = [self regularWithPattern:pattern inRange:range];
                }else if([pattern isKindOfClass:[NSAttributedString class]]) {
                    array = [self regularWithPattern:[pattern string] inRange:range];
                }
            }

        }else if([remove isKindOfClass:[NSString class]]) {
            array = [self regularWithPattern:remove inRange:range];
        }else if([remove isKindOfClass:[NSAttributedString class]]) {
            array = [self regularWithPattern:[remove string] inRange:range];
        }

        [self removeObjectWithArray:array];

        va_end(v);
        return self;
    };
}

- (OPAttributeReplaceBlock)replace {
    return ^OPAttribute *(id replace, id beReplace, ...) {
        va_list v;
        va_start(v, replace);

        NSAssert(replace, @"replace can not be nil");
        NSAssert(beReplace, @"beReplace can not be nil");
        NSRange range = va_arg(v, NSRange);
        range = rangeCheck(allRange(self.string), range) ? range : allRange(self.string);
        NSArray *result = [self regularWithPattern:replace inRange:range];
        if(result.count <= 0)
            return  self;
        [self replacePatternResultArray:result withObject:beReplace];
        va_end(v);
        return self;
    };
}

- (OPAttributeOperationBlock)replaceE {
    return ^OPAttribute *(id replace, ...) {
        va_list v;
        va_start(v, replace);
        NSRange range = va_arg(v, NSRange);
        range = rangeCheck(allRange(self.string), range) ? range : allRange(self.string);

        if([replace isKindOfClass:[NSArray class]]) {
            if([replace count] <= 0) return self;

            for (int i = 0; i < [replace count]; i++) {
                id pattern = replace[i];
                if([pattern isKindOfClass:[NSDictionary class]]) {
                    [self replaceWithDictionary:pattern inRange:range];
                }
            }
        }else if([replace isKindOfClass:[NSDictionary class]]) {
            [self replaceWithDictionary:replace inRange:range];
        }else {
            NSArray *result = [self regularWithPattern:replace inRange:range];
            [self replacePatternResultArray:result withObject:@""];
        }

        va_end(v);
        return self;
    };
}

#pragma mark - replace / remove  and so on

- (void)removeObjectWithArray:(NSArray *)array {
    if(!array || array.count == 0) return;
    NSMutableArray *strArray = [NSMutableArray array];
    for (NSTextCheckingResult * match in array) {
        NSString * textStr = [self.string.string substringWithRange:match.range];
        [strArray addObject:textStr];
    }

    [strArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [self.string deleteCharactersInRange:[self rangeOfObject:obj]];
    }];
}

- (OPAttribute *)replaceWithDictionary:(NSDictionary *)dictionary inRange:(NSRange)range {
    // @{key : value};
    /*
     * 其中 key   为要查找的(属性)字符串
     *     value  为要替换的(属性)字符串
     * */
    if([dictionary allKeys].count <= 0)
        return self;
    id key = [dictionary allKeys].firstObject;
    if([key length] <= 0)
        return self;
    id value = [dictionary valueForKey:key];
    // 正则匹配key
    NSArray *result = [self regularWithPattern:key inRange:range];

    if(result.count <= 0)
        return  self;
    [self replacePatternResultArray:result withObject:value];

    return self;
}

- (void)replacePatternResultArray:(NSArray *)array withObject:(id)object {
    if([object isKindOfClass:[NSString class]]) {
        [array enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(NSTextCheckingResult * _Nullable result, NSUInteger idx, BOOL *stop) {
            [self.string replaceCharactersInRange:result.range withString:object];
        }];
    }else if([object isKindOfClass:[NSAttributedString class]]) {
        [array enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(NSTextCheckingResult * _Nullable result, NSUInteger idx, BOOL *stop) {
            [self.string replaceCharactersInRange:result.range withAttributedString:object];
        }];
    }
}

#pragma mark - 正则匹配
- (NSArray *)regularWithPattern:(id)pattern inRange:(NSRange)range {
    NSString *p = pattern;
    if([pattern isKindOfClass:[NSAttributedString class]]) {
        p = [pattern string];
    }

    NSRegularExpression * regular = [[NSRegularExpression alloc]initWithPattern:p
                                                                        options: NSRegularExpressionDotMatchesLineSeparators
                                                                          error:nil];

    NSArray *matches = [regular matchesInString:self.string.string
                                        options:NSMatchingReportProgress
                                          range:range];

    return matches;
}


#pragma mark - Helper
// 范围检查相关
/*
 * range.location < rangeContainer.location && range.length >= rangeContainer.length
 *
 * 视为range 包含rangeContainer
 *
 * range.location < 0 || rangeContainer.location < 0 || rangeContainer.location > range.length; 不包含
 *
 * */
NS_INLINE BOOL rangeCheck(NSRange range, NSRange rangeContainer) {
    if(range.location < 0 || rangeContainer.location < 0 || rangeContainer.location > range.length) return false;
    return range.location <= rangeContainer.location && range.length >= rangeContainer.length;
}

inline static NSRange allRange(NSAttributedString *attr) {
    return NSMakeRange(0, attr.length);
}

- (NSRange)rangeOfObject:(id)object {
    NSRange range;
    if([object isKindOfClass:[NSString class]]) {
        range = [self containsString:object];
    }else if([object isKindOfClass:[NSAttributedString class]]){
        range = [self containsString:((NSAttributedString *)object).string];
    }
    return range;
}

- (NSRange)containsString:(NSString *)string {
    NSRange range;
    if([self.string.string containsString:string]) {
        range = [self.string.string rangeOfString:string];
    }else {
        range = NSMakeRange(0, 0);
    }
    return range;
}

- (NSRange)_allRange {
    return NSMakeRange(0, self.string.length);
}

#pragma mark - 设置属性相关

- (void)setValue:(id)value forAttribute:(NSString *)attributeName ranges:(NSArray <NSValue *> *)ranges {
    BOOL noValue = value == nil;
    BOOL noAttributeName = !attributeName || attributeName.length == 0;
    BOOL noRanges = !ranges || ranges.count == 0;
    if (noValue || noAttributeName || noRanges) {
        return;
    }

    for (NSValue *rangeValue in ranges) {
        NSRange range = rangeValue.rangeValue;
        [self.string addAttribute:attributeName value:value range:range];
    }
}

- (void)setValue:(id)value forAttribute:(NSString *)attributeName {
    [self setValue:value forAttribute:attributeName ranges:self.ranges];
}


- (void)setValue:(id)value forParagraphStyleKey:(NSString *)key {
    [self.paragraphStyle setValue:value forKey:key];
    [self setValue:self.paragraphStyle forAttribute:NSParagraphStyleAttributeName];
}



@end
