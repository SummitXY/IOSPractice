//
//  ViewController.m
//  IOSPractice
//
//  Created by quxiangyu on 2020/1/13.
//  Copyright © 2020 quxiangyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *list;

@end

@implementation ViewController

// 测试loadView
- (void)loadView {
    static NSUInteger loadView_count = 0;
    loadView_count += 1;
    NSLog(@"loadView_count:%ld",(long)loadView_count);

    // 无限调用样例
//    NSLog(@"load view:%@",self.view);

    // 无限调用样例2
//    self.view = nil;

    // 解决1
//    self.view = [UIView new];

    // 崩溃1
//    self.view = [NSObject new];

    // 解决2
//    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];

    // 解决3
    [super loadView];
}

// tableView 数据
- (void)setupList {

    self.list = @[@{@"show_name":@"App生命周期",@"class_name":@"XYAppLifeCycleController"}];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self setupList];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}



#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.text = [self.list[indexPath.row] objectForKey:@"show_name"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {


    [self.navigationController pushViewController:[NSClassFromString([self.list[indexPath.row] objectForKey:@"class_name"]) new] animated:YES];
}

@end
