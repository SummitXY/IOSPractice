//
//  XYFPSController.m
//  IOSPractice
//
//  Created by quxiangyu on 2020/1/14.
//  Copyright © 2020 quxiangyu. All rights reserved.
//

#import "XYFPSController.h"

#import "XYFPSCell.h"

@interface XYFPSController () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, assign) CFTimeInterval lastTime;
@property (nonatomic, assign) NSUInteger ticks;
@property (nonatomic, assign) double curFps;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray<NSDictionary *> *dataSource;

@end

@implementation XYFPSController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    [self startFPS];
}

- (NSArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
        for (int i=0; i<500; i++) {
            NSMutableDictionary *prop = [NSMutableDictionary dictionary];
            [prop setValue:@(i) forKey:@"label"];
            CGFloat r = random() % 255 / 255.0;
            CGFloat g = random() % 255 / 255.0;
            CGFloat b = random() % 255 / 255.0;
            [prop setValue:[UIColor colorWithRed:r green:g blue:b alpha:1] forKey:@"color"];
            [_dataSource addObject:prop];
        }
    }
    return _dataSource;
}

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {

        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        CGFloat SCREEN_WIDTH = [UIScreen mainScreen].bounds.size.width;
        CGFloat itemW = (SCREEN_WIDTH - 20) / 2;
        CGFloat itemH = itemW * 3;
        layout.itemSize = CGSizeMake(itemW, itemH);
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumLineSpacing = 20;
        layout.minimumInteritemSpacing = 10;

        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor grayColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[XYFPSCell class] forCellWithReuseIdentifier:@"XYFPSCell"];
    }
    return _collectionView;
}

#pragma mark - Delegate

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {


}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {

    
}

#pragma mark - DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XYFPSCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"XYFPSCell" forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"%@",[self.dataSource[indexPath.row] objectForKey:@"label"]];
    cell.colorView.backgroundColor = [self.dataSource[indexPath.row] objectForKey:@"color"];
    return cell;
}

- (void)startFPS {

    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(linkTicks:)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)linkTicks:(CADisplayLink *)link {
    self.ticks += 1;
    if (!self.lastTime) {
        self.lastTime = link.timestamp;
    } else {
        CFTimeInterval duration = link.timestamp - self.lastTime;
        if (duration > 1.0f) {
            self.curFps = self.ticks / duration;
            NSLog(@"fps:%.1f duration:%f",self.curFps,duration);
            self.lastTime = link.timestamp;
            self.ticks = 0;
        }
    }

}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"viewWillLayoutSubviews");
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear");
}

- (void)dealloc
{
    NSLog(@"dealloc");
}


@end
