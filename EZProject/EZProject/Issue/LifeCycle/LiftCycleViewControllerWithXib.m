//
//  LiftCycleViewControllerWithXib.m
//  EZProject
//
//  Created by Viscovery on 2015/5/18.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#import "LiftCycleViewControllerWithXib.h"
#import "LifeCycleObject.h"
@interface LiftCycleViewControllerWithXib ()
@property (strong, nonatomic) IBOutlet LifeCycleObject *test;

@end

@implementation LiftCycleViewControllerWithXib

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
//8
//-(id)initWithCoder:(NSCoder *)aDecoder
//{
//        NSLog(@"QQ");
//    if ((self = [super initWithCoder:aDecoder])) {
//        
//    }
//
//    return self; 
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
