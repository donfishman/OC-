//
//  main.m
//  AspectProxy
//
//  Created by 唐仁于 on 2018/9/13.
//  Copyright © 2018 唐仁于. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AspectProxy.h"
#import "AuditingInvoker.h"
#import "Calculator.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        //creat calculator
        id calculator = [[Calculator alloc]init];
        NSNumber *number1 = [NSNumber numberWithInteger:-25];
        NSNumber *number2 = [NSNumber numberWithInteger:10];
        NSNumber *number3 = [NSNumber numberWithInteger:15];
        
        //为calculator创建代理
        NSValue *selValue1 = [NSValue valueWithPointer:@selector(sumAddend1:addend2:)];
        NSArray *selValues = @[selValue1];
        AuditingInvoker *invoker = [[AuditingInvoker alloc]init];
        id calcultorProxy = [[AspectProxy alloc]initWithObject:calculator selectors:selValues andInvoker:invoker];
        
        //使用指定的选择器向该代理发送消息
        [calcultorProxy sumAddend1:number1 addend2:number2];
        //使用没有特殊处理需求的t其他选择器，向这个代理发送消息
        [calcultorProxy sumAddend1:number2 :number3];
        
        //为这个代理注册另一个选择器并再次向其发送消息
        [calcultorProxy registerSelector:@selector(sumAddend1::)];
        [calcultorProxy sumAddend1:number1 :number3];

    }
    return 0;
}
