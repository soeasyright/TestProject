//
//  TemplateVC.m
//  PractiveProject
//
//  Created by Viscovery on 2015/5/13.
//  Copyright (c) 2015年 watsons. All rights reserved.
//

#import "TemplateVC.h"

@implementation TemplateVC


- (void) viewDidLoad{
    [super viewDidLoad];
//    CGRect window = [[UIScreen mainScreen] bounds];
    UIButton *backMain = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 40, 40)];
    [backMain addTarget:self action:@selector(clickBackMain:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:backMain];
}

- (void) clickBackMain:(id)sn{
    
}

@end
