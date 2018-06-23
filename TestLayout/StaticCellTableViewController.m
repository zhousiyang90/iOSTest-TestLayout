//
//  StaticCellTableViewController.m
//  TestLayout
//
//  Created by 周思扬 on 2018/5/17.
//  Copyright © 2018年 周思扬. All rights reserved.
//

#import "StaticCellTableViewController.h"

@interface StaticCellTableViewController ()

@end

@implementation StaticCellTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIApplication *app=[UIApplication sharedApplication];
    app.statusBarStyle=UIStatusBarStyleDefault;
    app.statusBarHidden=NO;
    
    self.tableView.backgroundColor=[UIColor lightGrayColor];
    self.tableView.allowsMultipleSelectionDuringEditing=YES;
    
    NSLog(@"before kvo:isa:%@",[self valueForKey:@"isa"]);
    
    [self addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    NSLog(@"after kvo:isa:%@",[self valueForKey:@"isa"]);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     //批量删除注意点，删除数组中的模型，而不是直接删除对应index，因为删除一个index的元素时，整体数组index会改变
    [self.tableView setEditing:YES animated:YES];
    NSArray<NSIndexPath*> * selectedRows=self.tableView.indexPathsForSelectedRows;
    for (NSIndexPath *indexPath in selectedRows) {
        NSLog(@"indexPath:%ld",indexPath.row);
    }
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
