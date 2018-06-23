//
//  ZSXibView.m
//  TestLayout
//
//  Created by 周思扬 on 2018/5/11.
//  Copyright © 2018年 周思扬. All rights reserved.
//

#import "ZSXibView.h"
#import "ZSSubUIView.h"

@interface ZSXibView()
@property(nonatomic,weak) UIView * bgview;
@end

@implementation ZSXibView

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if(self=[super initWithCoder:aDecoder])
    {
        NSLog(@"%@:%@",NSStringFromClass(self.class),NSStringFromSelector(_cmd));
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    NSLog(@"%@:%@",NSStringFromClass(self.class),NSStringFromSelector(_cmd));
    ZSSubUIView * view=[[ZSSubUIView alloc]init];
    view.backgroundColor=[UIColor blackColor];
    [self addSubview:view];
    self.bgview=view;
}

-(void)layoutSubviews
{
    NSLog(@"%@:%@",NSStringFromClass(self.class),NSStringFromSelector(_cmd));
    [super layoutSubviews];
    self.bgview.frame=CGRectMake(10, 10, self.frame.size.width/3, self.frame.size.height/3);
}

@end
