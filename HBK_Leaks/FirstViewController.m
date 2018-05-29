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
    
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeRefresh:) userInfo:nil repeats:YES];
    

}


- (void)timeRefresh:(NSTimer*)timer {
    
    NSLog(@"TimeRefresh...");
    
}



- (void)cleanTimer {
    
    [_timer invalidate];
    
    _timer = nil;
    
}



- (void)dealloc {
    
    NSLog(@"销毁");
    
    [self cleanTimer];
    
}

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
