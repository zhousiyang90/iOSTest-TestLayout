//
//  ZSTableViewCell.m
//  TestLayout
//
//  Created by 周思扬 on 2018/5/16.
//  Copyright © 2018年 周思扬. All rights reserved.
//

#import "ZSTableViewCell.h"

@implementation ZSTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"awakeFromNib");
}

-(void)layoutSubviews
{
    NSLog(@"layoutSubviews");
}
-(void)setName:(NSString *)name
{
    NSLog(@"setName");
    _name=name;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
