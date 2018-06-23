//
//  ZSUIView.m
//  TestLayout
//
//  Created by 周思扬 on 2018/5/11.
//  Copyright © 2018年 周思扬. All rights reserved.
//

#import "ZSUIView.h"
#import "ZSSubUIView.h"

@interface ZSUIView()
@property(nonatomic,weak) UIView * bgview;
@end

@implementation ZSUIView


-(instancetype)initWithFrame:(CGRect)frame
{
    if(self=[super initWithFrame:frame])
    {
        NSLog(@"%@:%@",NSStringFromClass(self.class),NSStringFromSelector(_cmd));
        ZSSubUIView * view=[[ZSSubUIView alloc]init];
        view.backgroundColor=[UIColor blackColor];
        [self addSubview:view];
        self.bgview=view;
    }
    return self;
}


-(instancetype)initWithData:(NSString *)data
{
    if(self=[super init])
    {
        
    }
    return self;
}

-(void)layoutSubviews
{
    NSLog(@"%@:%@",NSStringFromClass(self.class),NSStringFromSelector(_cmd));
    [super layoutSubviews];
    self.bgview.frame=CGRectMake(10, 10, self.frame.size.width/3, self.frame.size.height/3);
}

//只有继承UIResponder的类才能处理事件，AppDelegate,UIViewController,UIView都是继承它
//事件包含触摸事件，设备移动事件，远程控制事件
//一个触摸点(一根手指)对应一个UITouch对象,每一个UITouch会产生一个UIEvent的对象，包含事件类型等信息

//触摸事件的传递是从父控件传递到子控件的过程，如果父控件不接受事件，所以子控件都不能接受事件
//UIApplication->UIWindow->UIView
//不接受事件三种情景，设置不可交互；隐藏；透明度<0.01,UIImageView默认不接受事件，因为设置不可交互

//如何找到最合适的控件处理事件呢？
//1.是否可以接受触摸事件
//2.是否在自己身上
//3.重复往前遍历子控件，重复12
//4.如果没有符合条件的子控件，就自己处理
    
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    //NSLog(@"%s",__func__);
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch * touch=[touches anyObject];
    CGPoint point=[touch locationInView:self];
    CGPoint prepoint=[touch previousLocationInView:self];
    NSLog(@"%@-%@",NSStringFromCGPoint(point),NSStringFromCGPoint(prepoint));
    CGFloat offsentx=point.x-prepoint.x;
    CGFloat offsenty=point.y-prepoint.y;
    [self setTransform:CGAffineTransformTranslate(self.transform, offsentx, offsenty)];
    
    
    //如果传nil,返回相对于当前window的CGPoint
//    CGPoint point2=[touch locationInView:nil];
//    CGPoint prepoint2=[touch previousLocationInView:nil];
//    NSLog(@"2:%@-%@",NSStringFromCGPoint(point2),NSStringFromCGPoint(prepoint2));
    //NSLog(@"%s",__func__);
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //NSLog(@"%s",__func__);
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //NSLog(@"%s",__func__);
}

//当前事件传递给当前View，当前View的hitTest方法会被调用，去寻找最合适的UIView,返回值就是最合适的UIView,然后调用该UIView的touches方法
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    //1.是否可以接受触摸事件
    //2.是否在自己身上
    //3.重复往前遍历子控件，重复12
    //4.如果没有符合条件的子控件，就自己处理
    return [super hitTest:point withEvent:event];
}

//判断点击点在不在当前View身上，在hitTest内部调用(第2步)
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    //point表示当前触摸点
    return NO;
}

@end
