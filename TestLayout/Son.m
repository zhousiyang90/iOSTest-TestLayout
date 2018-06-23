//
//  Son.m
//  TestLayout
//
//  Created by 周思扬 on 2018/6/4.
//  Copyright © 2018年 周思扬. All rights reserved.
//

#import "Son.h"

@implementation Son

static Son * son;

+(void)load
{
    NSLog(@"%@-%@",NSStringFromClass(self),NSStringFromSelector(_cmd));
}

//+(void)initialize
//{
//    NSLog(@"%@-%@",NSStringFromClass(self),NSStringFromSelector(_cmd));
//}

-(instancetype)init
{
    if(self=[super init])
    {
        NSLog(@"%@-%@",NSStringFromClass(self.class),NSStringFromSelector(_cmd));
    }
    return self;
}

+(instancetype)shareSon
{
    return son=[[Son alloc]init];
}

@end
