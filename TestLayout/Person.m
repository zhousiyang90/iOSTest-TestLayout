//
//  Person.m
//  TestLayout
//
//  Created by 周思扬 on 2018/5/18.
//  Copyright © 2018年 周思扬. All rights reserved.
//

#import "Person.h"

@implementation Person

static Person * person;

+(void)load
{
    NSLog(@"%@-%@",NSStringFromClass(self),NSStringFromSelector(_cmd));
}

+(void)initialize
{
    NSLog(@"%@-%@",NSStringFromClass(self),NSStringFromSelector(_cmd));
}

-(instancetype)init
{
    if(self=[super init])
    {
        NSLog(@"1%@-%@",NSStringFromClass(self.class),NSStringFromSelector(_cmd));
        NSLog(@"2%@-%@",NSStringFromClass(super.class),NSStringFromSelector(_cmd));
        NSLog(@"3%@-%@",NSStringFromClass(self.superclass),NSStringFromSelector(_cmd));
    }
    return self;
}

+(instancetype)sharePerson
{
    return person=[[Person alloc]init];
}

//+(instancetype)alloc
//{
//    if(person)
//    {
//        NSException * exc=[NSException exceptionWithName:@"不能Init" reason:@"就是不让" userInfo:@{@"属性":@"傻"}];
//        [exc raise];
//    }
//    return [super alloc];
//}

@end
