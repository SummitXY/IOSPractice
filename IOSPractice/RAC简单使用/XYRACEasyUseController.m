//
//  XYRACEasyUseController.m
//  IOSPractice
//
//  Created by quxiangyu on 2020/1/13.
//  Copyright © 2020 quxiangyu. All rights reserved.
//

#import "XYRACEasyUseController.h"
#import <ReactiveObjC.h>

static int count = 0;

@interface XYRACEasyUseController ()

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) BOOL enable;

@property (nonatomic, strong) NSString *day1;
@property (nonatomic, strong) NSString *day2;

@property (nonatomic, strong) UIButton *btn1;

@property (nonatomic, strong) id<RACSubscriber> subscriber;

@end

@implementation XYRACEasyUseController

- (void)viewDidLoad {
    [super viewDidLoad];

    // RAC使用 1
//    [RACObserve(self, name) subscribeNext:^(id  _Nullable newName) {
//        NSLog(@"new name:%@",newName);
//    }];
//    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        self.name = [NSString stringWithFormat:@"%ld",random()%100];
//    }];

    // RAC使用 2
//    [[RACObserve(self, name) filter:^BOOL(id  _Nullable newName) {
//        return [newName hasPrefix:@"1"];
//    }] subscribeNext:^(id  _Nullable newName) {
//        NSLog(@"new name:%@",newName);
//    }];

    // RAC使用3
//    RAC(self,enable) = [RACSignal combineLatest:@[ RACObserve(self, day1), RACObserve(self, day2)] reduce:^id (NSString *day1, NSString *day2){
//        return @([self.day1 isEqualToString:self.day2]);
//    }];
//
//    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        self.day1 = [NSString stringWithFormat:@"%ld",random()%3];
//    }];
//    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        self.day2 = [NSString stringWithFormat:@"%ld",random()%3];
//    }];
//    [RACObserve(self, enable) subscribeNext:^(id  _Nullable enable) {
//        NSLog(@"enable:%@",enable);
//    }];

    // RAC使用4
//    self.btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
//    self.btn1.backgroundColor = [UIColor redColor];
//    [self.view addSubview:self.btn1];
//
//    self.btn1.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
//        NSLog(@"btn1 clicked");
//        return [RACSignal empty];
//    }];

    // RAC使用5
//    RACCommand *btn1_rac_commond = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
//
//        sleep(3);
//        return [RACSignal empty];
//    }];
//
//    [btn1_rac_commond.executionSignals subscribeNext:^(RACSignal *signal) {
//
//        [signal subscribeCompleted:^{
//            NSLog(@"btn1 成功");
//        }];
//    }];
//
//    self.btn1.rac_command = btn1_rac_commond;

    // RAC使用6
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        count += 1;
        [subscriber sendNext:[NSString stringWithFormat:@"%d",count]];
        [subscriber sendCompleted];
        return nil;
    }];

    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"subscribeNext1:%@",x);
    }];

    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"subscribeNext2:%@",x);
    }];

//    [NSTimer scheduledTimerWithTimeInterval:3 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        [signal subscribeNext:^(id  _Nullable x) {
//            NSLog(@"subscribeNext:%@",x);
//        }];
//    }];

    // RAC使用7
//    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        [subscriber sendNext:@1];
//        NSLog(@"sendNext1");
//        [subscriber sendNext:@2];
//        NSLog(@"sendNext2");
//        [subscriber sendNext:@3];
//        NSLog(@"sendNext3");
////        [subscriber sendCompleted];
//        [subscriber sendError:[NSError errorWithDomain:@"signal error" code:666 userInfo:nil]];
//        [subscriber sendNext:@4];
//        [subscriber sendNext:@5];
//        [subscriber sendNext:@6];
//
////        dispatch_async(dispatch_get_global_queue(0, 0), ^{
////            sleep(3);
////                    [subscriber sendNext:@1];
////                    [subscriber sendNext:@2];
////                    [subscriber sendNext:@3];
////                    [subscriber sendCompleted];
////                    [subscriber sendNext:@4];
////                    [subscriber sendNext:@5];
////                    [subscriber sendNext:@6];
////        });
//        return nil;
//    }];

//    [[signal doNext:^(id  _Nullable x) {
//        NSLog(@"AnumberDo:%@",x);
//    }] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"Anumber:%@",x);
//    }];

//    [[signal delay:3] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"delayNumber:%@",x);
//    }];

//    [signal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"Anumber:%@",x);
//    }];
//
//    [signal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"Bnumber:%@",x);
//    }];


    // RAC使用8
//    RACSignal *signal1 = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        [subscriber sendNext:@"1a"];
//        [subscriber sendNext:@"1b"];
//        [subscriber sendNext:@"1c"];
//        [subscriber sendCompleted];
//        return nil;
//    }];
//
//    RACSignal *signal2 = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        [subscriber sendNext:@"2a"];
//        [subscriber sendNext:@"2b"];
//        [subscriber sendNext:@"2c"];
//        [subscriber sendCompleted];
//        return nil;
//    }];
//
//    RACSignal *signal3 = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        [subscriber sendNext:@"3a"];
//        [subscriber sendNext:@"3b"];
//        [subscriber sendNext:@"3c"];
//        [subscriber sendCompleted];
//        return nil;
//    }];
//
//    RACSignal *mergedSignal = [[RACSignal merge:@[signal1,signal2,signal3]] take:4];
//
//    [mergedSignal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"subscribe:%@",x);
//    }];


    // RAC使用9
//    RACSignal *coldSignal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
////        NSLog(@"subscriber send msg1");
//        [subscriber sendNext:@"msg1"];
//
//        [[RACScheduler mainThreadScheduler] afterDelay:2 schedule:^{
////            NSLog(@"subscriber send msg2");
//            [subscriber sendNext:@"msg2"];
//            [subscriber sendCompleted];
//        }];
//
//        [subscriber sendNext:@"msg3"];
//        return nil;
//    }];
//
//    RACSubject *subject = [RACSubject subject];
//    RACMulticastConnection *connection = [coldSignal multicast:subject];
//    RACSignal *hotSignal = connection.signal;
//    RACSignal *hotSignal = [coldSignal replayLazily];
//
//    [hotSignal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"hotsignal1 msg :%@",x);
//    }];

//    [connection connect];

//    [[RACScheduler mainThreadScheduler] afterDelay:5 schedule:^{
//        [hotSignal subscribeNext:^(id  _Nullable x) {
//            NSLog(@"hotsignal2 msg :%@",x);
//        }];
//    }];

//    [hotSignal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"hotsignal2 msg :%@",x);
//    }];


    //RAC使用10

//    RACMulticastConnection *connection = [[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        count += 1;
//        [subscriber sendNext:[NSString stringWithFormat:@"%d",count]];
//        [subscriber sendCompleted];
//        return nil;
//    }] publish];
//
//    [connection.signal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"sub1:%@",x);
//    }];
//
//    [connection.signal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"sub2:%@",x);
//    }];
//
//    [connection connect];


    //RAC使用11
//    RACSignal *signal = [[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        count += 1;
//        [subscriber sendNext:[NSString stringWithFormat:@"1:%d",count]];
//        [subscriber sendNext:[NSString stringWithFormat:@"2:%d",count]];
//        [subscriber sendNext:[NSString stringWithFormat:@"3:%d",count]];
//        [subscriber sendCompleted];
//        return nil;
//    }] replayLazily];
//
//    [[RACScheduler mainThreadScheduler] afterDelay:3 schedule:^{
//        [signal subscribeNext:^(id  _Nullable x) {
//            NSLog(@"sub1:%@",x);
//        }];
//
//    }];
//
//    [[RACScheduler mainThreadScheduler] afterDelay:6 schedule:^{
//
//        [signal subscribeNext:^(id  _Nullable x) {
//            NSLog(@"sub2:%@",x);
//        }];
//    }];


    // RAC使用12

//    RACSignal *signal = [[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        [subscriber sendNext:[NSString stringWithFormat:@"msg"]];
//        [subscriber sendCompleted];
//        return nil;
//    }] take:1];
//
//    [signal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"Anumber:%@",x);
//    }];
//
//    [signal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"Bnumber:%@",x);
//    }];


    // RAC使用13

//    RACSignal *signal = [[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        [subscriber sendNext:[NSString stringWithFormat:@"1"]];
//        [subscriber sendNext:[NSString stringWithFormat:@"2"]];
//        [subscriber sendNext:[NSString stringWithFormat:@"3"]];
//        [subscriber sendCompleted];
//        return nil;
//    }] skipWhileBlock:^BOOL(id  _Nullable x) {
//        if ([x isEqualToString:@"2"]) {
//            return YES;
//        }
//        return NO;
//    }];
//
//    [signal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"sub:%@",x);
//    }];
}

#pragma mark - Target Action


@end
