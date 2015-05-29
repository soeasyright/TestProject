//
//  CircularLoaderVC.m
//  EZProject
//
//  Created by Viscovery on 2015/5/27.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#import "CircularLoaderVC.h"

@interface CircularLoaderVC ()
@property (nonatomic , strong)CAShapeLayer *circle;
@end

@implementation CircularLoaderVC
@synthesize circle;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"CircularLoaderVC" ;
    self.view.backgroundColor = [UIColor whiteColor];
    
//    CGRect screen = [[UIScreen mainScreen] bounds];
    circle = [[CAShapeLayer alloc] init];
    circle.frame = self.view.frame;
    circle.lineWidth = 2;
    circle.fillColor = [UIColor clearColor].CGColor;
    circle.strokeColor = [UIColor redColor].CGColor;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
//    circle.path =
    [self.view.layer addSublayer:circle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
