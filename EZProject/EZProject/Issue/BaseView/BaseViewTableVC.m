//
//  BaseViewTableVC.m
//  EZProject
//
//  Created by soeasyright on 2015/5/26.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#import "BaseViewTableVC.h"
#import "TableViewController.h"
#import "EZMacro.h"

@interface BaseViewTableVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation BaseViewTableVC

typedef NS_ENUM(NSInteger,IssueNamePlusTable(BaseViewTableVC)){
    TableView,
    IssueNamePlusTableMax(BaseViewTableVC)
};
EZTableCreate(BaseViewTableVC);

+ (NSDictionary *)typeDisplayNames
{
    return @{
             @(TableView) : EZEnum2String(TableView),
             };
}

#pragma mark <UITableViewDelegate>
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *vc=nil;
    switch (indexPath.row) {
        case TableView:
            vc=[[TableViewController alloc]init];
            break;
        default:
            break;
    }
    if (vc) {
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}


@end
