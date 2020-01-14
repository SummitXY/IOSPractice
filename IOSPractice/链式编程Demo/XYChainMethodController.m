//
//  XYChainMethodController.m
//  IOSPractice
//
//  Created by quxiangyu on 2020/1/13.
//  Copyright © 2020 quxiangyu. All rights reserved.
//
//https://www.jianshu.com/p/87ef6720a096
#import "XYChainMethodController.h"
#import "Calculator.h"
@interface XYChainMethodController ()

@end

@implementation XYChainMethodController

- (void)viewDidLoad {
    [super viewDidLoad];

    float res1 = [Calculator makeCalculator:^(CalculatorMaker * _Nonnull maker) {
        maker.add(2).minus(1).add(3);
    } ];
    NSLog(@"res:%f",res1);
}



@end
