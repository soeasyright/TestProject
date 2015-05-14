//
//  Efficiency.m
//  EZProject
//
//  Created by soeasyright on 2015/5/14.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#import "Efficiency.h"

@interface Efficiency ()

@end

@implementation Efficiency

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *issue1 = [[UIButton alloc] initWithFrame:CGRectMake(160, 100, 40, 40)];
    [issue1 setTitle:@"strong&weak" forState:UIControlStateNormal];
    [issue1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [issue1 addTarget:self action:@selector(issue1:) forControlEvents:UIControlEventTouchUpInside];
    [issue1 sizeToFit];
    [issue1 setCenter:CGPointMake(375/2.0, 100)];
    [self.view addSubview:issue1];
    UIButton *issue2 = [[UIButton alloc] initWithFrame:CGRectMake(160, 150, 40, 40)];
    [issue2 setTitle:@"objc_runtime_associate" forState:UIControlStateNormal];
    [issue2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [issue2 addTarget:self action:@selector(issue2:) forControlEvents:UIControlEventTouchUpInside];
    [issue2 sizeToFit];
    [issue2 setCenter:CGPointMake(375/2.0, 150)];
    [self.view addSubview:issue2];

}
- (void)issue1:(id)sender{
}
- (void)issue2:(id)sender{
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
