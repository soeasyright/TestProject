//
//  AnimationTableVC.m
//  EZProject
//
//  Created by Viscovery on 2015/5/26.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#import "AnimationTableVC.h"

#import "EZMacro.h"

@interface AnimationTableVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation AnimationTableVC

typedef NS_ENUM(NSInteger,IssueNamePlusTable(AnimationTableVC)){
    ForLoop,
    IssueNamePlusTableMax(AnimationTableVC)
};
EZTableCreate(AnimationTableVC);

+ (NSDictionary *)typeDisplayNames
{
    return @{
             @(ForLoop) : EZEnum2String(ForLoop),
             };
}

#pragma mark <UITableViewDelegate>
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case ForLoop:
            break;
        default:
            break;
    }
}





@end
