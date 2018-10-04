//
//  AuditingInvoker.m
//  AspectProxy
//
//  Created by 唐仁于 on 2018/9/13.
//  Copyright © 2018 唐仁于. All rights reserved.
//

#import "AuditingInvoker.h"

@implementation AuditingInvoker

-(void)preInvoker:(NSInvocation *)inv withTarget:(id)target
{
    NSLog(@"在用选择器发送消息之前创建日志 %@ to %@ object",NSStringFromSelector([inv selector]),[target className]);
}

-(void)postInvoker:(NSInvocation *)inv withTarget:(id)target
{
    NSLog(@"在选择器发送方法之后创建日志 %@ to %@ object",NSStringFromSelector([inv selector]),[target className]);
}

@end
