//
//  LifeCycleViewController.m
//  EZProject
//
//  Created by soeasyright on 2015/5/18.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#import "LifeCycleViewController.h"

@interface LifeCycleViewController ()

@end

@implementation LifeCycleViewController

#define EZShowFunctionAndViewFrame     \
NSLog(@"%s",__PRETTY_FUNCTION__); \
NSLog(@"%@",[NSNumber valueWithCGRect:self.view.frame]);

//1
- (void)viewDidLoad{
    [super viewDidLoad];
    EZShowFunctionAndViewFrame;
}
//2
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    EZShowFunctionAndViewFrame;
}
//3
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    EZShowFunctionAndViewFrame;
}
//4
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    EZShowFunctionAndViewFrame;
}
//5
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    EZShowFunctionAndViewFrame;
}
//6
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    EZShowFunctionAndViewFrame;
}
//7
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    EZShowFunctionAndViewFrame;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
