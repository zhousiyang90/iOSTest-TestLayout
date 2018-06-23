//
//  LockView.m
//  TestLayout
//
//  Created by 周思扬 on 2018/5/25.
//  Copyright © 2018年 周思扬. All rights reserved.
//

#import "LockView.h"

@interface LockView()
{
    BOOL isEnd;
    CGPoint curP;
    NSMutableArray * btnArr;
}
@end

@implementation LockView

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    
    
    btnArr=[NSMutableArray array];
    
    for (int i=0; i<9; i++) {
        UIButton * btn=[[UIButton alloc]init];
        [btn setUserInteractionEnabled:NO];
        btn.tag=i;
        btn.backgroundColor=[UIColor colorWithWhite:0.5 alpha:0.5];
        btn.titleLabel.font=[UIFont systemFontOfSize:13];
        [btn setTitle:[NSString stringWithFormat:@"%d未选中",i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitle:[NSString stringWithFormat:@"%d选中",i] forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
        [self addSubview:btn];
    }
}


-(void)layoutSubviews
{
    float border=(self.frame.size.width-150)/4;
    for (int i=0; i<9; i++) {
        float x=border+(border+50)*(i%3);
        float y=border+(border+50)*(i/3);
        float w=50;
        float h=50;
        UIButton * btn=self.subviews[i];
        btn.frame=CGRectMake(x, y, w, h);
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //点击在按钮范围，按钮被选中
    UITouch * touch=[touches anyObject];
    CGPoint startP=[touch locationInView:self];
    for (UIButton * btn in self.subviews) {
        if(CGRectContainsPoint(btn.frame, startP))
        {
            [btnArr addObject:btn];
            btn.selected=YES;
            break;
        }
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //滑动在按钮范围，按钮被选中
    UITouch * touch=[touches anyObject];
    curP=[touch locationInView:self];
    for (UIButton * btn in self.subviews) {
        if(CGRectContainsPoint(btn.frame,curP)&&btn.selected==NO)
        {
            [btnArr addObject:btn];
            btn.selected=YES;
            break;
        }
    }
    //调用drawRect绘制线条
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    isEnd=YES;
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect
{
    if(btnArr.count>0)
    {
        //CGContextRef ctx=UIGraphicsGetCurrentContext();
        [[UIColor redColor]set];
        //CGContextSetLineJoin(ctx, kCGLineJoinRound);
        //CGContextSetLineWidth(ctx, 10);
        UIBezierPath * path=[UIBezierPath bezierPath];
        path.lineWidth=10;
        path.lineJoinStyle=kCGLineJoinRound;
        for (int i=0; i<btnArr.count; i++) {
            UIButton * btn=btnArr[i];
            if(i==0)
            {
                [path moveToPoint:btn.center];
            }else
            {
                [path addLineToPoint:btn.center];
            }
        }
        if(!isEnd)
        {
            [path addLineToPoint:curP];
        }
        
        [path stroke];
        //CGContextAddPath(ctx, path.CGPath);
        //CGContextStrokePath(ctx);
    }
}

@end
