//
//  ViewControllerWithStroyBoard.m
//  EZProject
//
//  Created by soeasyright on 2015/5/19.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#import "LiftCycleViewControllerWithStroyBoard.h"

@interface LiftCycleViewControllerWithStroyBoard ()

@end

@implementation LiftCycleViewControllerWithStroyBoard

#define EZShowFunctionAndViewFrame     \
NSLog(@"%s",__PRETTY_FUNCTION__); \
NSLog(@"%@",[NSNumber valueWithCGRect:self.view.frame]);\
UIView* t=(UIView*)[self.view viewWithTag:1];\
NSLog(@"%@",[NSNumber valueWithCGRect:t.frame]);
//1
- (void)viewDidLoad{
    [super viewDidLoad];
    EZShowFunctionAndViewFrame;
    
    //    NSLog(@"%@",[NSNumber valueWithCGRect:self.view.bounds]);
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
