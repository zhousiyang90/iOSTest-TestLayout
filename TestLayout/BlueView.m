//
//  BlueView.m
//  TestLayout
//
//  Created by 周思扬 on 2018/5/22.
//  Copyright © 2018年 周思扬. All rights reserved.
//

#import "BlueView.h"

@implementation BlueView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@--touches",NSStringFromClass(self.class));
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    return [super hitTest:point withEvent:event];
}

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    NSArray *subViews = self.subviews;
    if ([subViews count] > 0)
    {
        UIView *subview = [subViews objectAtIndex:0];
        if ([subview pointInside:[self convertPoint:point toView:subview] withEvent:event])
        {
            return YES;
        }
    }
    if (point.x > 0 && point.x < self.frame.size.width && point.y > 0 && point.y < self.frame.size.height)
    {
        return YES;
    }
    return NO;
}

@end
