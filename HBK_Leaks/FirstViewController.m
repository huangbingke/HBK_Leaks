//
//  FirstViewController.m
//  HBK_Leaks
//
//  Created by 黄冰珂 on 2018/5/24.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //target:self
    //target:self---对控制器强引用
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeRefresh:) userInfo:nil repeats:YES];
}
- (void)timeRefresh:(NSTimer*)timer {
    NSLog(@"TimeRefresh...");
}
- (void)cleanTimer {
    [self.timer invalidate];
    self.timer = nil;
}
- (void)dealloc {
    NSLog(@"销毁");
    [self cleanTimer];
}

//定时器销毁要写在viewWillDisappear
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    [self cleanTimer];
//}

/*
 内存泄露原因总结
 ARC工程是可以重写dealloc方法，而且当对象被释放时会被调用，但不需要手动调用父类的dealloc，当调用[super dealloc]方法时会报错，因为系统会自动帮我们调用父类的dealloc方法，不需要重写；
 但有些时候会发现控制器出栈的时候不会调用dealloc方法，归根结底，是因为当前控制器被某些对象 强引用 了，控制器的引用计数不为0，系统无法自动释放这部分内存，导致控制器也不能主动释放。
 
 控制器被强引用的原因：
 
 1、block块使用不当，导致循环引用。因为block会对方法中的变量自动retain一次。
 引用外部变量需要使用 __block
 调用self 需要 __weak
 
 2、NSTimer没有销毁。在viewWillDisappear之前需要把控制器用到的NSTimer销毁
 因为 target:self ，也就是引用了当前viewController，导致控制器的引用计数加1，如果没有将这个NSTimer 销毁，它将一直保留该viewController，无法释放，也就不会调用dealloc方法。所以，需要在viewWillDisappear之前需要把控制器用到的NSTimer销毁。
  */


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
