//
//  Calculator.h
//  IOSPractice
//
//  Created by quxiangyu on 2020/1/13.
//  Copyright © 2020 quxiangyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalculatorMaker.h"
NS_ASSUME_NONNULL_BEGIN

@interface Calculator : NSObject

+ (float)makeCalculator:(void(^)(CalculatorMaker *maker))block;

@end

NS_ASSUME_NONNULL_END
