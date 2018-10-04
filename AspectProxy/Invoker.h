//
//  Invoker.h
//  AspectProxy
//
//  Created by 唐仁于 on 2018/9/13.
//  Copyright © 2018 唐仁于. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Invoker <NSObject>

@required
//必须实现
-(void)preInvoker:(NSInvocation *)inv withTarget:(id)target;

@optional
//可选方法
-(void)postInvoker:(NSInvocation *)inv withTarget:(id)target;

@end
