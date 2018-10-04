//
//  Calculator.h
//  AspectProxy
//
//  Created by 唐仁于 on 2018/9/27.
//  Copyright © 2018 唐仁于. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Calculator : NSObject

-(NSNumber *)sumAddend1:(NSNumber *)adder1 addend2:(NSNumber *)adder2;

-(NSNumber *)sumAddend1:(NSNumber *)adder1 :(NSNumber *)adder2;

@end

NS_ASSUME_NONNULL_END
