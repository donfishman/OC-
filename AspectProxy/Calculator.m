//
//  Calculator.m
//  AspectProxy
//
//  Created by 唐仁于 on 2018/9/27.
//  Copyright © 2018 唐仁于. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

-(NSNumber *)sumAddend1:(NSNumber *)adder1 addend2:(NSNumber *)adder2
{
    NSLog(@" %@ 的方法 %@",[self className],NSStringFromSelector(_cmd));
    
    return [NSNumber numberWithInteger:([adder1 integerValue] + [adder2 integerValue])];
}

-(NSNumber *)sumAddend1:(NSNumber *)adder1 :(NSNumber *)adder2
{
    NSLog(@" %@ 的方法 %@",[self className],NSStringFromSelector(_cmd));

    return [NSNumber numberWithInteger:([adder1 integerValue] + [adder2 integerValue])];

}

@end
