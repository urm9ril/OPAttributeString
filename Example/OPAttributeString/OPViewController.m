//
//  OPViewController.m
//  OPAttributeString
//
//  Created by url9ril on 09/12/2023.
//  Copyright (c) 2023 url9ril. All rights reserved.
//

#import "OPViewController.h"

#import "OPViewController.h"
#import <OPAttributeString/OPAttributeString.h>
#import "DemoTableViewCell.h"

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
 * 19. NSVerticalGlyphFormAttributeName      设置文字排版方向，取值为 NSNumber 对象(整数)，0 表示横排文本，1 表示竖排文本
 * 20. NSLinkAttributeName                   设置链接属性，点击后调用浏览器打开指定URL地址
 * 21. NSAttachmentAttributeName             设置文本附件,取值为NSTextAttachment对象,常用于文字图片混排
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

NSString *const CellID = @"CellID";

@interface OPViewController () <UITableViewDelegate, UITableViewDataSource>

/**  */
@property(nonatomic, strong) NSArray<NSString *> *titleArray;
/**  */
@property(nonatomic, strong) UITableView *tableView;
/**  */
@property(nonatomic, strong) UILabel *demoLabel;

@end

@implementation OPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titleArray = @[@"Laeebl 中ee插e入e图e片\n\n", @"求心理阴影面积 + 描边"];
    [self.view addSubview:self.tableView];

    [self.view addSubview:self.demoLabel];
}

#pragma mark - =========================================== UITableViewDelegate & UITableViewDataSource ===================================

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
    cell.textLabel.text = _titleArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self selectedDemoAtIndex:indexPath.row];
}

- (void)selectedDemoAtIndex:(NSInteger)index {
    NSString *string_demo = self.titleArray[index];
    switch (index) {
        case 0: {
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"e"];
            [string addAttribute:NSBackgroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 1)];

            self.demoLabel.attributedText = [string_demo make_Attribute:^(OPAttribute *make) {
                make.insert(@"s", 0);
                make.insert(@"i", 0);
                make.insert(@"-m", 0);
                //make.insert(@"\n", 0);
                make.insert([UIImage imageNamed:@"old_sj"], 0, CGRectMake(0, 0, 18, 18), AttachmentAlignmentNormal);
                make.alignment(NSTextAlignmentCenter);
                make.rangeOf(@"中").textColor([UIColor blueColor]).backgroundColor([UIColor greenColor]);
                make.insert(string, 3);

                make.removeE(@[string]);
                make.pattern(@"e").strokeColor([UIColor redColor]).strokeWidth(-5);
                make.removeE(@[@"e",string], NSMakeRange(0, string_demo.length));
                make.from(2).offset(-5);
                make.writingDirection(NSWritingDirectionRightToLeft | NSWritingDirectionOverride);
                make.fromTo(0, 10).strikethroughColor([UIColor blueColor])
                        .strikethroughStyle(NSUnderlineStyleDouble)
                        .underlineStyle(NSUnderlineStyleDouble)
                        .underlineColor([UIColor whiteColor])
                        .kern(7)
                        .shadow([UIColor redColor], CGSizeMake(5, 2), 10)
                        .offset(arc4random_uniform(5));
                make.replaceE(@[@{@"e" : @"😯"},@{@"中" : string}]);
                make.replace(@"e",@"K", NSMakeRange(-1, 8));
                make.insert(@"GG", -10000);
                make.fromTo(3, 4).font([UIFont boldSystemFontOfSize:30]).offset(-5);
                make.fromTo(4, 5).font([UIFont boldSystemFontOfSize:6]).offset(-5);

            }];
            [self setRectWithFontSize:20 offset:CGPointMake(18, 0)];
        }
            break;
        case 1: {
            self.demoLabel.attributedText = [string_demo make_Attribute:^(OPAttribute *make) {
                make.shadow([UIColor greenColor], CGSizeMake(10, 2), 2);
                make.strokeColor([UIColor orangeColor]);
                make.strokeWidth(5);
                make.strikethroughStyle(NSUnderlineStyleSingle);
                make.strikethroughColor([UIColor redColor]);
                make.alignment(NSTextAlignmentCenter);
                make.fromTo(0, 1).offset(5);
            }];
            [self setRectWithFontSize:17];
        }
            break;

        default:
            break;
    }
    
    self.demoLabel.center = CGPointMake(self.view.center.x, 120);
}

- (void)setRectWithFontSize:(CGFloat)fontSize {
    [self setRectWithFontSize:fontSize offset:CGPointZero];
}

- (void)setRectWithFontSize:(CGFloat)fontSize offset:(CGPoint)offset {
    CGSize size = [self sizeWithwidth:[UIScreen mainScreen].bounds.size.width string:self.demoLabel.text fontSize:fontSize];
    self.demoLabel.frame = CGRectMake(0, 50, size.width + offset.x, size.height + offset.y);
}


- (CGSize)sizeWithwidth:(CGFloat)width string:(NSString *)string fontSize:(CGFloat)fontSize {
    CGSize size = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                       options:(NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin)
                                    attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]}
                                       context:nil].size;
    return size;
}


- (UITableView *)tableView {
    if (_tableView) return _tableView;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 300, [UIScreen mainScreen].bounds.size.width, 300)
                                              style:UITableViewStylePlain];
    [_tableView registerClass:[DemoTableViewCell class] forCellReuseIdentifier:CellID];
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, CGFLOAT_MIN)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    return _tableView;
}

- (UILabel *)demoLabel {
    if (_demoLabel) return _demoLabel;
    //_demoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 200)];
    _demoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 0, 0)];
    _demoLabel.backgroundColor = [UIColor lightGrayColor];
    _demoLabel.numberOfLines = 0;
    //_demoLabel.textAlignment = NSTextAlignmentCenter;
    return _demoLabel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

