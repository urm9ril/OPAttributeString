//
//  NSString+OPAttribute.m
//  OPAttributeString
//
//  Created by ooops on 2017/12/15.
//  Copyright © 2017年 张强. All rights reserved.
//

#import <objc/runtime.h>
#import "OPAttribute.h"

@implementation NSString (OPAttribute)

- (OPAttribute *)attribute {
    OPAttribute *attribute = objc_getAssociatedObject(self, _cmd);
    if (!attribute) {
        attribute = [[OPAttribute alloc] initWithString:self];
        objc_setAssociatedObject(self, _cmd, attribute, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return attribute;
}

- (NSMutableAttributedString *)make_Attribute:(void(^)(OPAttribute *make))make {
    OPAttribute *attribute = [self attributeWithString:self];
    make(attribute);
    return attribute.string;
}

+ (NSMutableAttributedString *)string:(NSString *)string make_Attribute:(void(^)(OPAttribute *make))make {
    OPAttribute *attribute = [self attributeWithString:string];
    make(attribute);
    return attribute.string;
}

- (OPAttribute *)attributeWithString:(NSString *)string {
    OPAttribute *attribute = objc_getAssociatedObject(self, _cmd);
    attribute = [[OPAttribute alloc] initWithString:string];
    objc_setAssociatedObject(self, _cmd, attribute, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return attribute;
}

+ (OPAttribute *)attributeWithString:(NSString *)string {
    OPAttribute *attribute = objc_getAssociatedObject(self, _cmd);
    attribute = [[OPAttribute alloc] initWithString:string];
    objc_setAssociatedObject(self, _cmd, attribute, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return attribute;
}

- (OPAttributeFontBlock)font {
    return self.attribute.font;
}

- (OPAttributeColorBlock)textColor {
    return self.attribute.textColor;
}

- (OPAttributeColorBlock)backgroundColor {
    return self.attribute.backgroundColor;
}

- (OPAttributeColorBlock)strokeColor {
    return self.attribute.strokeColor;
}

- (OPAttributeFloatBlock)strokeWidth {
    return self.attribute.strokeWidth;
}

- (OPAttributeIntBlock)ligature {
    return self.attribute.ligature;
}

- (OPAttributeFloatBlock)kern {
    return self.attribute.kern;
}

- (OPAttributeIntBlock)strikethroughStyle {
    return self.attribute.strikethroughStyle;
}

- (OPAttributeIntBlock)underlineStyle {
    return self.attribute.underlineStyle;
}

- (OPAttributeShadowBlock)shadow {
    return self.attribute.shadow;
}

- (OPAttributeStringBlock)textEffectLetterPress {
    return self.attribute.textEffectLetterPress;
}

- (OPAttributeAttachmentBlock)attachment {
    return self.attribute.attachment;
}

- (OPAttributeStringBlock)link {
    return self.attribute.link;
}

- (OPAttributeFloatBlock)offset {
    return self.attribute.offset;
}

- (OPAttributeColorBlock)underlineColor {
    return self.attribute.underlineColor;
}

- (OPAttributeColorBlock)strikethroughColor {
    return self.attribute.strikethroughColor;
}

- (OPAttributeFloatBlock)oblique {
    return self.attribute.oblique;
}

- (OPAttributeFloatBlock)expand {
    return self.attribute.expand;
}

- (OPAttributeIntBlock)writingDirection {
    return self.attribute.writingDirection;
}

- (OPAttributeIntBlock)verticalGlyphForm {
    return self.attribute.verticalGlyphForm;
}

- (OPAttributeRangeBlock)range {
    return self.attribute.range;
}
/// 和range作用相同
- (OPAttributeIntIntBlock)fromTo {
    return self.attribute.fromTo;
}

- (OPAttributeIntBlock)from {
    return self.attribute.from;
}

- (OPAttributeIntBlock)to {
    return self.attribute.to;
}

- (OPAttributeStringBlock)rangeOf {
    return self.attribute.rangeOf;
}

- (OPAttributeStringBlock)pattern {
    return self.attribute.pattern;
}


- (OPAttributeFloatBlock)lineSpacing {
    return self.attribute.lineSpacing;
}

- (OPAttributeFloatBlock)paragraphSpacing {
    return self.attribute.paragraphSpacing;
}

- (OPAttributeTextAlignmentBlock)alignment {
    return self.attribute.alignment;
}

- (OPAttributeFloatBlock)firstLineHeadIndent {
    return self.attribute.firstLineHeadIndent;
}

- (OPAttributeFloatBlock)headIndent {
    return self.attribute.headIndent;
}

- (OPAttributeFloatBlock)tailIndent {
    return self.attribute.tailIndent;
}

- (OPAttributeLineBreakModeBlock)lineBreakMode {
    return self.attribute.lineBreakMode;
}

- (OPAttributeFloatBlock)minimumLineHeight {
    return self.attribute.minimumLineHeight;
}

- (OPAttributeFloatBlock)maximumLineHeight {
    return self.attribute.maximumLineHeight;
}

- (OPAttributeFloatBlock)lineHeightMultiple {
    return self.attribute.lineHeightMultiple;
}

- (OPAttributeFloatBlock)paragraphSpacingBefore {
    return self.attribute.paragraphSpacingBefore;
}

- (OPAttributeFloatBlock)hyphenationFactor {
    return self.attribute.hyphenationFactor;
}

- (OPAttributeFloatBlock)defaultTabInterval {
    return self.attribute.defaultTabInterval;
}

- (OPAttributeOperationBlock)insert {
    return self.attribute.insert;
}



- (OPAttributeOperationBlock)removeE {
    return self.attribute.removeE;
}

- (OPAttributeReplaceBlock)replace {
    return self.attribute.replace;
}

- (OPAttributeOperationBlock)replaceE {
    return self.attribute.replaceE;
}

@end
