//
//  Calculator.m
//  IOSPractice
//
//  Created by quxiangyu on 2020/1/13.
//  Copyright © 2020 quxiangyu. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

+ (float)makeCalculator:(void (^)(CalculatorMaker * _Nonnull))block {
    CalculatorMaker *maker = [CalculatorMaker new];
    block(maker);
    return maker.result;
}

@end
