//
//  ArrayViewController.m
//  dynamicLayout
//
//  Created by Viscovery on 2015/5/8.
//  Copyright (c) 2015年 watsons. All rights reserved.
//

#import "ArrayViewController.h"

@interface ArrayViewController ()

@end

@implementation ArrayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s",__PRETTY_FUNCTION__);
    NSLog(@"%s", __func__);
    
    //也可以猜開撰寫
    NSLog(@"%@", NSStringFromClass([self class]));
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    //獲得行數
    NSLog(@"%d", __LINE__);
    



    NSNumber *number_A = [NSNumber numberWithInt:0];
    NSNumber *number_B = [NSNumber numberWithInteger:4];
    NSNumber *number_C = [NSNumber numberWithFloat:5.0];
    NSNumber *number_D = [NSNumber numberWithBool:0];
    
    NSArray *array = [[NSArray alloc] initWithObjects:number_A, number_B, number_C, nil];
    
    if ([array containsObject:number_D]) {
        NSLog(@"found");
        
    }
    for(NSNumber *i in array)
    {
        NSLog(@"%@", i);
    }

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
