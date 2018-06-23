//
//  TestViewController.m
//  TestLayout
//
//  Created by 周思扬 on 2018/5/21.
//  Copyright © 2018年 周思扬. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()
{
    UIView * maskView;
    CGPoint startP;
}
@property (weak, nonatomic) IBOutlet UIImageView *bgImgV;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPanGestureRecognizer * pan=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [self.bgImgV addGestureRecognizer:pan];
}

-(void)pan:(UIPanGestureRecognizer*)pan
{
    
    if(pan.state==UIGestureRecognizerStateBegan)
    {
        startP=[pan locationInView:self.bgImgV];
    }
    if(pan.state==UIGestureRecognizerStateChanged)
    {
        CGPoint panP=[pan translationInView:self.bgImgV];
        CGFloat x=startP.x;
        CGFloat y=startP.y;
        CGFloat w=panP.x;
        CGFloat h=panP.y;
        if(maskView==nil)
        {
            maskView=[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
            maskView.backgroundColor=[UIColor colorWithWhite:0.5 alpha:0.5];
            [self.bgImgV addSubview:maskView];
        }else
        {
            maskView.frame=CGRectMake(x, y, w, h);
        }
    }
    if(pan.state==UIGestureRecognizerStateEnded)
    {
        [self screencapture];
        [maskView removeFromSuperview];
        maskView=nil;
        
    }
}


-(void)screencapture
{
    //1.开启图片上下文(大小就是被截图View大小)
    UIGraphicsBeginImageContextWithOptions(self.bgImgV.bounds.size, YES, 0.0);
    NSLog(@"1%@",NSStringFromCGSize(self.bgImgV.bounds.size));
    //2.设置Clip区域
    UIBezierPath * path=[UIBezierPath bezierPathWithRect:CGRectMake(maskView.frame.origin.x, maskView.frame.origin.y, maskView.frame.size.width, maskView.frame.size.height)];
    [path addClip];
    //或者UIRectClip(maskView.frame);
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    //3.把图片渲染到上下文中
    [self.bgImgV.layer renderInContext:ctx];
    //4.获取上下文中的图片(大小图片上下文大小-被截图View大小)
    UIImage * newImage=UIGraphicsGetImageFromCurrentImageContext();
    NSLog(@"2%@",NSStringFromCGSize(newImage.size));
    UIGraphicsEndImageContext();
    self.bgImgV.image=newImage;
}

@end
