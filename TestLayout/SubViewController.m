//
//  SubViewController.m
//  TestLayout
//
//  Created by 周思扬 on 2018/6/4.
//  Copyright © 2018年 周思扬. All rights reserved.
//

#import "SubViewController.h"

@interface SubViewController ()
{
    //NSTimer * timer;
    dispatch_source_t timer;
}
@end

@implementation SubViewController

-(void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor lightGrayColor];
    
    timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 1 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        NSLog(@"timer");
    });
    dispatch_resume(timer);
    
//    timer=[NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"timer");
//    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)dealloc
{
    NSLog(@"dealloc");
}

@end
