//
//  AspectProxy.m
//  AspectProxy
//
//  Created by 唐仁于 on 2018/9/27.
//  Copyright © 2018 唐仁于. All rights reserved.
//

#import "AspectProxy.h"

@implementation AspectProxy

-(id)initWithObject:(id)object
          selectors:(NSArray *)selectors
         andInvoker:(id<Invoker>)invoker
{
    _proxyTarget = object;
    _invoker = invoker;
    _selectors = [selectors mutableCopy];
    
    return self;
}

-(id)initWithObject:(id)object
         andInvoker:(id<Invoker>)invoker
{
    return [self initWithObject:object selectors:nil andInvoker:invoker];
}

-(NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    return [self.proxyTarget methodSignatureForSelector:sel];
}

-(void)forwardInvocation:(NSInvocation *)invocation
{
    //在调用目标方法前执行横切功能
    if ([self.invoker respondsToSelector:@selector(preInvoker:withTarget:)]) {
        if (self.selectors != nil) {
            
            SEL methodSel = [invocation selector];
            
            for (NSValue *selValue in self.selectors) {
                
                if (methodSel == [selValue pointerValue]) {
                    
                    [[self invoker] preInvoker:invocation withTarget:self.proxyTarget] ;
                    break;
                }
            }
        }else{
            [[self invoker] preInvoker:invocation withTarget:self.proxyTarget];
        }
    }
    //调用目标方法
    [invocation invokeWithTarget:self.proxyTarget];
    
    //调用方法后执行横切功能
    if ([self.invoker respondsToSelector:@selector(postInvoker:withTarget:)]) {
        
        if (self.selectors != nil) {
            SEL methodSel = [invocation selector];
            
            for (NSValue *selValue in self.selectors)
            {
                if (methodSel == [selValue pointerValue])
                {
                    [[self invoker] postInvoker:invocation withTarget:self.proxyTarget];
                    break;
                }
            }
        }else{
          
            [[self invoker]postInvoker:invocation withTarget:self.proxyTarget];
        }
    }
}

-(void)registerSelector:(SEL)selector
{
    NSValue *selValue = [NSValue valueWithPointer:selector];
    [self.selectors addObject:selValue];
}

@end
