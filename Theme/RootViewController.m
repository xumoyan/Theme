
//
//  RootViewController.m
//  Theme
//
//  Created by 张冠清 on 16/2/16.
//  Copyright © 2016年 buyforyou. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 注册更改主题的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(change) name:@"TopicMessage" object:nil];
}
#pragma mark --- 加载主题
-(void)viewWillAppear:(BOOL)animated{
    [self switchTheme];
}
#pragma mark ---  改变主题
-(void)change{
    [self switchTheme];
}
#pragma mark ---  选择主题
- (void)switchTheme {
}
@end
