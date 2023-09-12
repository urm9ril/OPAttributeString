//
//  DemoTableViewCell.m
//  OPAttributeString
//
//  Created by ooops on 2017/12/17.
//  Copyright © 2017年 张强. All rights reserved.
//

#import "DemoTableViewCell.h"

@implementation DemoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
