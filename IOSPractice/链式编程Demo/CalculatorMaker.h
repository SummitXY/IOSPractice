//
//  CalculatorMaker.h
//  IOSPractice
//
//  Created by quxiangyu on 2020/1/13.
//  Copyright © 2020 quxiangyu. All rights reserved.
//

// 函数式编程
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CalculatorMaker : NSObject

@property (nonatomic, assign) float result;

- (CalculatorMaker *(^)(float))add;
- (CalculatorMaker *(^)(float))minus;

@end

NS_ASSUME_NONNULL_END
