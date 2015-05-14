//
//  TemplateVC.m
//  PractiveProject
//
//  Created by Viscovery on 2015/5/13.
//  Copyright (c) 2015年 watsons. All rights reserved.
//

#import "TemplateVC.h"

@interface TemplateVC()

@end
@implementation TemplateVC


- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
//    UIButton *backMain = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 40, 40)];
    UIButton *backMain = [[UIButton alloc] init];
    [backMain setTitle:@"←" forState:UIControlStateNormal];
    [backMain setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [backMain addTarget:self action:@selector(clickBackMain:) forControlEvents:UIControlEventTouchUpInside];
    [backMain setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:backMain];
    
//    UIButton *reset = [[UIButton alloc] initWithFrame:CGRectMake(300, 20, 40, 40)];
    UIButton *reset = [[UIButton alloc] init];
    [reset setTitle:@"reset" forState:UIControlStateNormal];
    [reset setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [reset addTarget:self action:@selector(clickReset:) forControlEvents:UIControlEventTouchUpInside];
    [reset setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:reset];
    
    
    NSDictionary *views = NSDictionaryOfVariableBindings(backMain, reset);
    NSMutableArray *myConstraints = [NSMutableArray array];
    
    //從水平方向佈局
    [myConstraints addObjectsFromArray:
     [NSLayoutConstraint constraintsWithVisualFormat:@"|-20-[backMain(100)]-[reset(100)]-20-|"
                                             options:NSLayoutFormatDirectionLeadingToTrailing
                                             metrics:nil
                                               views:views]];
    
    
    //從垂直方向佈局
    [myConstraints addObjectsFromArray:
     [NSLayoutConstraint constraintsWithVisualFormat:@"|-20-[backMain(100)]"
                                             options:NSLayoutFormatDirectionLeadingToTrailing
                                             metrics:nil
                                               views:views]];
    
    //從垂直方向佈局
//    [myConstraints addObjectsFromArray:
//     [NSLayoutConstraint constraintsWithVisualFormat:@"[backMain(==reset)]"
//                                             options:NSLayoutFormatDirectionLeadingToTrailing
//                                             metrics:nil
//                                               views:views]];
    
    [self.view addConstraints:myConstraints];

}

- (void)clickBackMain:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)clickReset:(UIButton *)sender{
    
}
@end
