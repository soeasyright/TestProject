//
//  LifeCycleTableVC.m
//  EZProject
//
//  Created by soeasyright on 2015/5/16.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#import "EZMacro.h"
#import "LifeCycleTableVC.h"
#import "LifeCycle.h"
#import "LifeCycleViewController.h"
#import "LiftCycleViewControllerWithXib.h"
#import "LiftCycleViewControllerWithStroyBoard.h"
@interface LifeCycleTableVC () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation LifeCycleTableVC
typedef NS_ENUM(NSInteger,IssueNamePlusTable(LifeCycle)){
    ViewController,
    ViewController_WithXib,
    ViewController_WithStroyBoard,
    Object_WithRunTime,
    IssueNamePlusTableMax(LifeCycle)
};
EZTableCreate(LifeCycle);
+ (NSDictionary *)typeDisplayNames
{
    return @{
             @(ViewController) : EZEnum2String(ViewController),
             @(ViewController_WithXib) : EZEnum2String(ViewController_WithXib),
             @(ViewController_WithStroyBoard) : EZEnum2String(ViewController_WithStroyBoard),
             @(Object_WithRunTime) : EZEnum2String(Object_WithRunTime),
             };
}
#pragma mark <UITableViewDelegate>
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc=nil;
    switch (indexPath.row) {
        case ViewController:
            vc = [[LifeCycleViewController alloc]init];
            break;
        case ViewController_WithXib:
            vc = [[LiftCycleViewControllerWithXib alloc] initWithNibName:@"LiftCycleViewControllerWithXib" bundle:nil];
            break;
        case ViewController_WithStroyBoard:
        {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LiftCycleViewControllerWithStroyBoard" bundle:nil];
            //             vc = [storyboard instantiateInitialViewController];
            vc = [storyboard instantiateViewControllerWithIdentifier:@"LiftCycleViewControllerWithStroyBoard"];
        }
            
            break;
        case Object_WithRunTime:
        {
            vc = [[LifeCycle alloc] initWithNibName:@"LifeCycle" bundle:nil];
        }
            break;
        default:
            break;
    }
    if (vc) {
        [self.navigationController pushViewController:vc animated:YES];
    }
}



@end
