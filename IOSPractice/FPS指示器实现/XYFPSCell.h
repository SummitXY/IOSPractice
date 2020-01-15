//
//  XYFPSCell.h
//  IOSPractice
//
//  Created by quxiangyu on 2020/1/14.
//  Copyright © 2020 quxiangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XYFPSCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIView *colorView;
@property (nonatomic, strong) UILabel *reuseLabel;

@end

NS_ASSUME_NONNULL_END
