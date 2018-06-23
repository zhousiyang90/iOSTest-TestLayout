//
//  BaseViewController.m
//  TestLayout
//
//  Created by 周思扬 on 2018/6/4.
//  Copyright © 2018年 周思扬. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * btn=[[UIButton alloc]initWithFrame:CGRectMake(10, 10, 200, 200)];
    [btn setTitle:@"大萨达撒大所" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
}


@end
