//
//  ZSSubUIView.m
//  TestLayout
//
//  Created by 周思扬 on 2018/5/11.
//  Copyright © 2018年 周思扬. All rights reserved.
//

#import "ZSSubUIView.h"

@implementation ZSSubUIView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGRect viewFrame=self.frame;
    viewFrame.size.width+=10;
    self.frame=viewFrame;
}

-(void)layoutSubviews
{
    NSLog(@"%@:%@",NSStringFromClass(self.class),NSStringFromSelector(_cmd));
    [super layoutSubviews];
    
}

@end
