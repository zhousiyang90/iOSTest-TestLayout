//
//  GrayView.m
//  TestLayout
//
//  Created by 周思扬 on 2018/5/22.
//  Copyright © 2018年 周思扬. All rights reserved.
//

#import "GrayView.h"
#import "BlueView.h"

@implementation GrayView

-(void)awakeFromNib
{
    [super awakeFromNib];
}

/*Quartz2D是二维绘图引擎，支持ios macos
 绘制图形
 绘制文字
 绘制/生成图片
 读取/生成pdf
 截图/裁剪图片
 自定义UI控件(手势解锁，统计图)
 CGContextRef图形上下文的作用，保存绘制信息，决定输出目标(PDF,Bitmap,显示器窗口)
 
 Quartz2D提供了几种类型的Context
 Bitmap Graphics Context
 PDF Graphics Context
 Window Graphics Context
 Layer Graphics Context
 Printer Graphics Context
 
 ios view drawRect可以直接获取到Context
 
 */

-(void)drawRect:(CGRect)rect
{
    
    [self drawLine];
    //[self drawText];
    //rect->bounds
    //NSLog(@"%@",NSStringFromCGRect(rect));
    
    /*
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    //UIBezierPath是对CGPathRef的面向对象封装
    UIBezierPath * path=[UIBezierPath bezierPath];
    [path moveToPoint:CGPointZero];
    [path addLineToPoint:CGPointMake(20, 20)];
    [path moveToPoint:CGPointMake(30, 30)];
    [path addLineToPoint:CGPointMake(50, 60)];
    [path addLineToPoint:CGPointMake(30, 20)];
    CGContextSetLineWidth(ctx, 3);
    //设置填充颜色或者描边颜色
    //[[UIColor orangeColor]setStroke];
    [[UIColor blackColor]setFill];
    CGContextAddPath(ctx, path.CGPath);
    //填充和描边两种输出方式CGContextFillPath(ctx),CGContextStrokePath(ctx)
    //CGContextStrokePath(ctx);
    CGContextFillPath(ctx);
    */
}

-(void)drawText
{
    NSDictionary * dict=@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor orangeColor],NSStrokeColorAttributeName:[UIColor blueColor],NSStrokeWidthAttributeName:@2};
    [@"绘制文字" drawInRect:CGRectMake(10, 10, 50, 50) withAttributes:dict];
}

-(void)drawLine2
{
    UIBezierPath * path=[UIBezierPath bezierPathWithRect:CGRectMake(10, 10, 30, 30)];
    //内部帮我们实现获取CGContextRef和设置Path的功能
    [path stroke];
}

-(void)drawLine
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置上下文状态
    CGContextSetLineWidth(context, 3);
    [[UIColor blackColor]setStroke];
    //把该上下文状态存储到栈中(栈中1元素，这次状态位于栈顶)
    CGContextSaveGState(context);
    
    //再次设置上下文状态(覆盖当前上下文状态)
    CGContextSetLineWidth(context, 3);
    [[UIColor redColor]setStroke];
    //把该上下文状态存储到栈中(栈中2元素，这次状态位于栈顶)
    CGContextSaveGState(context);
    
    //使用当前上下文状态描绘路径(Red)
    UIBezierPath * path=[UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(50,50)];
    CGContextAddPath(context, path.CGPath);
    CGContextStrokePath(context);
    
    
    UIBezierPath * path2=[UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(80, 80)];
    [path2 addLineToPoint:CGPointMake(80,20)];
    CGContextAddPath(context, path2.CGPath);
    //把(Black)状态从栈取出到栈顶并设置上下文状态
    CGContextRestoreGState(context);
    CGContextRestoreGState(context);
    CGContextStrokePath(context);
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesBegan");
    [self screencapture];
}

-(void)screencapture
{
    /*[UIScreen mainScreen].scale是像素和点的一个桥接，在iOS-UIKit中使用点作为单位，其实内部就是像素*scale的结果
      [UIScreen mainScreen].scale-iphone8-2
      [UIScreen mainScreen].scale-iphone8p-3
      值得注意的是CoreGraphics框架使用的是像素作为单位
    */
     UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, [UIScreen mainScreen].scale);
    //UIGraphicsBeginImageContext(self.bounds.size);
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    //把Layer被渲染到CGContext上
    [self.layer renderInContext:ctx];
    UIImage * newImage=UIGraphicsGetImageFromCurrentImageContext();
    NSData * data=UIImagePNGRepresentation(newImage);
    [data writeToFile:@"/Users/zhousiyang/Downloads/1.png" atomically:YES];
    UIGraphicsEndImageContext();
}

-(void)clipRoundImage2
{
    UIImage * bgimage=[UIImage imageNamed:@"bgimg"];
    CGFloat border=[UIScreen mainScreen].scale*10;
    CGSize contextSize=CGSizeMake(bgimage.size.width+border*2, bgimage.size.height+border*2);
    //设置上下文大小比图片宽度大10
    UIGraphicsBeginImageContext(contextSize);
    //填充一个橙色的圆形
    UIBezierPath * path=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, contextSize.width, contextSize.height)];
    [[UIColor orangeColor]set];
    [path fill];
    //设置裁剪区域
    UIBezierPath * path2=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(border, border, bgimage.size.width, bgimage.size.height)];
    [path2 addClip];
    //绘制图片
    [bgimage drawAtPoint:CGPointMake(border, border)];
    UIImage * newImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageView * imgV=[[UIImageView alloc]initWithFrame:self.bounds];
    [self addSubview:imgV];
    imgV.image=newImage;
}

-(void)clipRoundImage
{
    UIImage * bgimage=[UIImage imageNamed:@"bgimg"];
    UIGraphicsBeginImageContext(bgimage.size);
    //设置裁剪区域
    UIBezierPath * path=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, bgimage.size.width, bgimage.size.height)];
    [path addClip];
    [bgimage drawAtPoint:CGPointZero];
    UIImage * newImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageView * imgV=[[UIImageView alloc]initWithFrame:self.bounds];
    [self addSubview:imgV];
    imgV.image=newImage;
}

-(void)composeImage
{
    //使用BitmapContext上下文
    UIImage * bgimage=[UIImage imageNamed:@"bgimg"];
    UIImage * logo=[UIImage imageNamed:@"logo"];
    //开始上下文
    UIGraphicsBeginImageContext(bgimage.size);
    //把两张图片渲染到上下文中
    [bgimage drawAtPoint:CGPointZero];
    [logo drawAtPoint:CGPointMake(50, 50)];
    //合成图像
    UIImage * newImage=UIGraphicsGetImageFromCurrentImageContext();
    //结束上下文绘制
    UIGraphicsEndImageContext();
    UIImageView * imgV=[[UIImageView alloc]initWithFrame:self.bounds];
    [self addSubview:imgV];
    imgV.image=newImage;
    
    /*更好的方式是进行异步绘制
    UIImageView * imgV=[[UIImageView alloc]initWithFrame:self.bounds];
    [self addSubview:imgV];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        UIImage * bgimage=[UIImage imageNamed:@"bgimg"];
        UIImage * logo=[UIImage imageNamed:@"logo"];
        UIGraphicsBeginImageContext(bgimage.size);
        [bgimage drawAtPoint:CGPointZero];
        [logo drawAtPoint:CGPointMake(50, 50)];
        UIImage * newImage=UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        dispatch_async(dispatch_get_main_queue(), ^{
            imgV.image=newImage;
        });
    });
    */
}
   

@end
