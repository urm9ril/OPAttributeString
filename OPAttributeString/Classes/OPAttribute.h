//
//  OPAttribute.h
//  OPAttributeString
//
//  Created by ooops on 2017/12/15.
//  Copyright © 2017年 张强. All rights reserved.

/**
    * API: Character Attributes                 NSAttributedString 共有21个属性
    * 1. NSFontAttributeName                    设置字体属性，默认值：字体：Helvetica(Neue) 字号：12
    * 2. NSParagraphStyleAttributeName          设置文本段落排版格式，取值为 NSParagraphStyle 对象(详情见下面的API说明)
    * 3. NSForegroundColorAttributeName         设置字体颜色，取值为 UIColor对象，默认值为黑色
    * 4. NSBackgroundColorAttributeName         设置字体所在区域背景颜色，取值为 UIColor对象，默认值为nil, 透明色
    * 5. NSLigatureAttributeName                设置连体属性，取值为NSNumber 对象(整数)，0 表示没有连体字符，1 表示使用默认的连体字符
    * 6. NSKernAttributeName                    设置字符间距，取值为 NSNumber 对象（整数），正值间距加宽，负值间距变窄
    * 7. NSStrikethroughStyleAttributeName      设置删除线，取值为 NSNumber 对象（整数）
    * 8. NSStrikethroughColorAttributeName      设置删除线颜色，取值为 UIColor 对象，默认值为黑色
    * 9. NSUnderlineStyleAttributeName          设置下划线，取值为 NSNumber 对象（整数），枚举常量 NSUnderlineStyle中的值，与删除线类似
    * 10. NSUnderlineColorAttributeName         设置下划线颜色，取值为 UIColor 对象，默认值为黑色
    * 11. NSStrokeWidthAttributeName            设置笔画宽度(粗细)，取值为 NSNumber 对象（整数），负值填充效果，正值中空效果
    * 12. NSStrokeColorAttributeName            填充部分颜色，不是字体颜色，取值为 UIColor 对象
    * 13. NSShadowAttributeName                 设置阴影属性，取值为 NSShadow 对象
    * 14. NSTextEffectAttributeName             设置文本特殊效果，取值为 NSString 对象，目前只有图版印刷效果可用
    * 15. NSBaselineOffsetAttributeName         设置基线偏移值，取值为 NSNumber （float）,正值上偏，负值下偏
    * 16. NSObliquenessAttributeName            设置字形倾斜度，取值为 NSNumber （float）,正值右倾，负值左倾
    * 17. NSExpansionAttributeName              设置文本横向拉伸属性，取值为 NSNumber （float）,正值横向拉伸文本，负值横向压缩文本
    * 18. NSWritingDirectionAttributeName       设置文字书写方向，从左向右书写或者从右向左书写
    * 19. NSVerticalGlyphFormAttributeName      设置文字排版方向，取值为 NSNumber 对象(整数)，0 表示横排文本，1 表示竖排文本  iOS中默认为横排 其他未定义
    * 20. NSLinkAttributeName                   设置链接属性，点击后调用浏览器打开指定URL地址
    * 21. NSAttachmentAttributeName             设置文本附件,取值为NSTextAttachment对象,常用于文字图片混排
    *
    * 备注
    *
    * //NSWritingDirectionAttributeName 设置文字书写方向，取值为以下组合
    * iOS9.0以前
    * @[@(NSWritingDirectionLeftToRight | NSTextWritingDirectionEmbedding)]
    * @[@(NSWritingDirectionLeftToRight | NSTextWritingDirectionOverride)]
    * @[@(NSWritingDirectionRightToLeft | NSTextWritingDirectionEmbedding)]
    * @[@(NSWritingDirectionRightToLeft | NSTextWritingDirectionOverride)]
    *
    * iOS9.0以后
    *
    * @[@(NSWritingDirectionLeftToRight | NSWritingDirectionEmbedding)]
    * @[@(NSWritingDirectionLeftToRight | NSWritingDirectionOverride)]
    * @[@(NSWritingDirectionRightToLeft | NSWritingDirectionEmbedding)]
    * @[@(NSWritingDirectionRightToLeft | NSWritingDirectionOverride)]
 */


/**
     * lineSpacing                                  字体的行间距
     * firstLineHeadIndent                          首行缩进
     * alignment                                    两端对齐的）文本对齐方式：（左，中，右，两端对齐，自然）
     * lineBreakMode                                结尾部分的内容以……方式省略 ( "...wxyz" ,"abcd..." ,"ab...yz")
     * headIndent                                   整体缩进(首行除外)
     * tailIndent                                   右缩进
     * minimumLineHeight                            最低行高
     * maximumLineHeight                            最大行高
     * paragraphSpacing                             段与段之间的间距
     * paragraphSpacingBefore                       段首行空白空间
     * Distance between the bottom of the previous paragraph (or the end of its paragraphSpacing, if any) and the top of this paragraph.
     * baseWritingDirection                         从左到右的书写方向（一共三种）
     * Natural line height is multiplied by this factor (if positive) before being constrained by minimum and maximum line height.
     * lineHeightMultiple
     * hyphenationFactor                            连字属性 在iOS，唯一支持的值分别为0和1
 */

//

#import <UIKit/UIKit.h>
/** 不完美 */
typedef NS_ENUM(NSInteger, AttachmentAlignment) {
    AttachmentAlignmentTop = 1,     // image and text alignment by top
    AttachmentAlignmentCenter,      // image and text alignment by center
    AttachmentAlignmentBottom,      // image and text alignment by bottom
    AttachmentAlignmentNormal = 0   // default
};

@class OPAttribute;

typedef OPAttribute *(^OPAttributeFontBlock)(UIFont *);
typedef OPAttribute *(^OPAttributeColorBlock)(UIColor *);
typedef OPAttribute *(^OPAttributeFloatBlock)(CGFloat);
typedef OPAttribute *(^OPAttributeShadowBlock)(UIColor *, CGSize, CGFloat);
typedef OPAttribute *(^OPAttributeStringBlock)(NSString *);
typedef OPAttribute *(^OPAttributeAttachmentBlock)(UIImage *, NSInteger, CGRect, AttachmentAlignment);
typedef OPAttribute * (^OPAttributeRangeBlock)(NSRange);
typedef OPAttribute *(^OPAttributeIntBlock)(NSInteger);
typedef OPAttribute *(^OPAttributeIntIntBlock)(NSInteger, NSInteger);

typedef OPAttribute *(^OPAttributeTextAlignmentBlock)(NSTextAlignment);
typedef OPAttribute *(^OPAttributeLineBreakModeBlock)(NSLineBreakMode);

typedef OPAttribute *(^OPAttributeOperationBlock)(id,...);
typedef OPAttribute *(^OPAttributeReplaceBlock)(id, id, ...);

@interface OPAttribute : NSObject

- (instancetype)initWithString:(NSString *)string;

@property (nonatomic, strong) NSMutableAttributedString *string;

/** 属性相关 */

- (OPAttributeFontBlock)font;
- (OPAttributeColorBlock)textColor;
- (OPAttributeColorBlock)backgroundColor;
- (OPAttributeColorBlock)strokeColor;
- (OPAttributeFloatBlock)strokeWidth;
- (OPAttributeIntBlock)ligature;
- (OPAttributeFloatBlock)kern;
- (OPAttributeIntBlock)strikethroughStyle;
- (OPAttributeColorBlock)strikethroughColor;
- (OPAttributeIntBlock)underlineStyle;
- (OPAttributeColorBlock)underlineColor;
- (OPAttributeShadowBlock)shadow;
- (OPAttributeStringBlock)textEffectLetterPress;
- (OPAttributeAttachmentBlock)attachment;
- (OPAttributeStringBlock)link;
- (OPAttributeFloatBlock)offset;
- (OPAttributeFloatBlock)oblique;
- (OPAttributeFloatBlock)expand;
- (OPAttributeIntBlock)writingDirection;
- (OPAttributeIntBlock)verticalGlyphForm;
- (OPAttributeRangeBlock)range;
- (OPAttributeIntIntBlock)fromTo;
- (OPAttributeIntBlock)from;
- (OPAttributeIntBlock)to;
- (OPAttributeStringBlock)rangeOf;
- (OPAttributeStringBlock)pattern;

/** 段落样式相关 */

- (OPAttributeFloatBlock)lineSpacing;
- (OPAttributeFloatBlock)paragraphSpacing;
- (OPAttributeTextAlignmentBlock)alignment;
- (OPAttributeFloatBlock)firstLineHeadIndent;
- (OPAttributeFloatBlock)headIndent;
- (OPAttributeFloatBlock)tailIndent;
- (OPAttributeLineBreakModeBlock)lineBreakMode;
- (OPAttributeFloatBlock)minimumLineHeight;
- (OPAttributeFloatBlock)maximumLineHeight;
- (OPAttributeFloatBlock)lineHeightMultiple;
- (OPAttributeFloatBlock)paragraphSpacingBefore;
- (OPAttributeFloatBlock)hyphenationFactor;
- (OPAttributeFloatBlock)defaultTabInterval;

/** 编辑相关 */
- (OPAttributeOperationBlock)insert;
/*
 * 多参数正则匹配删除字符串
 * param 默认整个全匹配
 *
 * 1. NSString @"S"
 *
 * 2. NSAttributeString
 *
 * NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"属性字符串"];
 * [string addAttribute:NSBackgroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 1)];
 *
 * 3. array @[@"S",@"string"];
 *
 * 4. 指定范围匹配 默认全匹配
 * NSString *str = @"every where";
 * [str make_Attribute:^(OPAttribute *make) {
 *     make.removeE(@[@"e",string], NSMakeRange(0, 5));
 * }];
 *
 * result : @"vry where";
 *
 * */
- (OPAttributeOperationBlock)removeE;
- (OPAttributeReplaceBlock)replace;
- (OPAttributeOperationBlock)replaceE;

@end
