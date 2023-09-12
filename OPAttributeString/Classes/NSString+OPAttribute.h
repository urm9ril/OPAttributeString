//
//  NSString+OPAttribute.h
//  OPAttributeString
//
//  Created by ooops on 2017/12/15.
//  Copyright © 2017年 张强. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "OPAttribute.h"

@interface NSString (OPAttribute)

- (NSMutableAttributedString *)make_Attribute:(void(^)(OPAttribute *make))make;
+ (NSMutableAttributedString *)string:(NSString *)string make_Attribute:(void(^)(OPAttribute *make))make;

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


- (OPAttributeOperationBlock)insert;
- (OPAttributeOperationBlock)removeE;
- (OPAttributeReplaceBlock)replace;
- (OPAttributeOperationBlock)replaceE;

@end
