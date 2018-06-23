//
//  RedView.m
//  TestLayout
//
//  Created by 周思扬 on 2018/5/22.
//  Copyright © 2018年 周思扬. All rights reserved.
//

#import "RedView.h"

@interface RedView()
{
    NSTimer * timer;
}
@end
@implementation RedView


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    
    NSLog(@"%@--touches",NSStringFromClass(self.class));
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    return [super hitTest:point withEvent:event];
}




@end
