//
//  testViewController02.m
//  wqTestAll
//
//  Created by WQ on 2019/3/18.
//  Copyright © 2019年 WQ. All rights reserved.
//

#import "testViewController02.h"
#import <AFNetworking/AFNetworking.h>


#import "AFHTTPSessionManager.h"

@interface testViewController02 ()

@end

@implementation testViewController02

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testArgs:@"aaa",99];
    NSInteger n = [self testArgs1:@"aa",88];
    NSLog(@"n is %ld",n);
    NSLog(@"test");
}


-(void)testArgs:(NSString *)str,...
{
    //固定写法
    va_list ap;    //定义一个va_list型的变量ap,这个变量是指向参数的指针,va_list类型适用于 va_start()、va_arg() 和 va_end() 这三个宏存储信息的类型
    va_start(ap, str);//与 va_arg 和 va_end 宏是一起使用，第一个参数固定，第二个为省略号前的那个参数，即str
    NSInteger j = (NSInteger)va_arg(ap, NSString*);  //检索函数参数列表中类型为 type 的下一个参数，这里表示nsstring类型之后的那个参数，也可以理解为依次获取固定参数之后的每一个可变参数
    NSLog(@"j is %ld",j);
    va_end(ap); //结束可变参数的获取.
}


-(NSInteger)testArgs1:(NSString *)str,...
{
    va_list ap;    //定义一个va_list型的变量ap,这个变量是指向参数的指针,va_list类型适用于 va_start()、va_arg() 和 va_end() 这三个宏存储信息的类型
    va_start(ap, str);//与 va_arg 和 va_end 宏是一起使用，第一个参数固定，第二个为省略号前的那个参数，即str
    NSInteger j = (NSInteger)va_arg(ap, NSString*);  //检索函数参数列表中类型为 type 的下一个参数，这里表示nsstring类型之后的那个参数
    NSLog(@"j is %ld",j);
//    va_end(ap);
    return j;
}

@end

