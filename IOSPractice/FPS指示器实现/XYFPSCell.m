//
//  XYFPSCell.m
//  IOSPractice
//
//  Created by quxiangyu on 2020/1/14.
//  Copyright © 2020 quxiangyu. All rights reserved.
//

#import "XYFPSCell.h"

static int reuseId = 0;

@implementation XYFPSCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)prepareForReuse {

    
}

- (void)setup {

    self.label = [UILabel new];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.label];
    self.colorView = [UIView new];
    [self.contentView addSubview:self.colorView];
    self.reuseLabel = [UILabel new];
    self.reuseLabel.textAlignment = NSTextAlignmentCenter;
    self.reuseLabel.text = [NSString stringWithFormat:@"%d",reuseId];
    reuseId += 1;
    [self.contentView addSubview:self.reuseLabel];

    self.backgroundView = [[UIView alloc] initWithFrame:self.bounds];
    self.backgroundView.backgroundColor = [UIColor whiteColor];
}

- (void)layoutSubviews {

    self.label.frame = CGRectMake(0, 0, self.contentView.bounds.size.width,  self.contentView.bounds.size.height/4);
    self.reuseLabel.frame = CGRectMake(0, self.contentView.bounds.size.height/4, self.contentView.bounds.size.width, self.contentView.bounds.size.height/4);
    self.colorView.frame = CGRectMake(0, self.contentView.bounds.size.height/2, self.contentView.bounds.size.width,  self.contentView.bounds.size.height/2);
}

@end
