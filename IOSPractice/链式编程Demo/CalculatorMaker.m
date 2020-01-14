//
//  CalculatorMaker.m
//  IOSPractice
//
//  Created by quxiangyu on 2020/1/13.
//  Copyright © 2020 quxiangyu. All rights reserved.
//

#import "CalculatorMaker.h"

@implementation CalculatorMaker

- (CalculatorMaker *(^)(float))add {

    return ^CalculatorMaker *(float value) {

        self.result += value;
        return self;
    };
}

- (CalculatorMaker * _Nonnull (^)(float))minus {

    return ^CalculatorMaker *(float value) {

        self.result -= value;
        return self;
    };
}

@end
