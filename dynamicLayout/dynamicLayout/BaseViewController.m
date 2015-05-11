//
//  BaseViewController.m
//  dynamicLayout
//
//  Created by Viscovery on 2015/5/8.
//  Copyright (c) 2015年 watsons. All rights reserved.
//

#import "BaseViewController.h"
#import "UserData.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *tmp=[[NSBundle mainBundle] localizedStringForKey:@"format_photos_and_videos" value:@"" table:@"BaseViewController"];
    NSLog(@"%@",tmp);
    NSLog(@"%@",NSLocalizedString(@"format_photos_and_videos", @"note"));
    
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSArray arrayWithObjects:@"de", @"en", @"fr", nil] forKey:@"AppleLanguages"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    
    
    //coder
//    UserData *userData=[[UserData alloc]init];
//    userData.sid=@"123";
//    userData.name=@"456";
//    userData.phone=@"4256";
//    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:userData ]  forKey:@"UserData"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
    //decoder
    NSData *newshopData = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserData"];
    UserData *newshop = [NSKeyedUnarchiver unarchiveObjectWithData:newshopData];
    NSLog(@"%@",newshop);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
