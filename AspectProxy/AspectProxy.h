//
//  AspectProxy.h
//  AspectProxy
//
//  Created by 唐仁于 on 2018/9/27.
//  Copyright © 2018 唐仁于. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Invoker.h"

NS_ASSUME_NONNULL_BEGIN

@interface AspectProxy : NSProxy

@property (strong) id proxyTarget;
@property (strong) id<Invoker> invoker;
@property (readonly) NSMutableArray *selectors;


-(id)initWithObject:(id)object andInvoker:(id<Invoker>)invoker;
-(id)initWithObject:(id)object selectors:(NSArray *)selectors andInvoker:(id<Invoker>)invoker;

-(void)registerSelector:(SEL)selector;



@end

NS_ASSUME_NONNULL_END
