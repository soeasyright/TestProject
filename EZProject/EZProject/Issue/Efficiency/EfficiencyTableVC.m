//
//  Efficiency.m
//  EZProject
//
//  Created by soeasyright on 2015/5/14.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#import "EfficiencyTableVC.h"
#import "EZMacro.h"

@interface EfficiencyTableVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,copy) NSMutableArray *test;
@end

@implementation EfficiencyTableVC

typedef NS_ENUM(NSInteger,IssueNamePlusTable(Efficiency)){
    ForLoop,
    Forin,
    MakeObjectsPerformSelector,
    EnumerateObjectsUsingBlock,
    EnumerateObjectsWithOptions,
    Dispatch_apply,
    IssueNamePlusTableMax(Efficiency)
};
EZTableCreate(Efficiency);
//for in (NSFastEnumeration)
//makeObjectsPerformSelector
//kvc集合运算符
//enumerateObjectsUsingBlock
//enumerateObjectsWithOptions(NSEnumerationConcurrent)
//dispatch_apply

@synthesize test;


+ (NSDictionary *)typeDisplayNames
{
    return @{
             @(ForLoop) : EZEnum2String(ForLoop),
             @(Forin) : EZEnum2String(Forin),
             @(MakeObjectsPerformSelector) : EZEnum2String(MakeObjectsPerformSelector),
             @(EnumerateObjectsUsingBlock) : EZEnum2String(EnumerateObjectsUsingBlock),
             @(EnumerateObjectsWithOptions) : EZEnum2String(EnumerateObjectsWithOptions),
             @(Dispatch_apply) : EZEnum2String(Dispatch_apply),
             };
}

#pragma mark <UITableViewDelegate>
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    switch (indexPath.row) {
        case ForLoop:
        {
            int sum = 0;
            NSUInteger count = test.count;
            double date_s = CFAbsoluteTimeGetCurrent();
            for (int i = 0;i < count; i++) {
                sum += 1;
            }
            NSLog(@"ForLoop Time: %f", CFAbsoluteTimeGetCurrent() - date_s);
        }
            break;
        case Forin:
        {
            int sum = 0;
            double date_s =  CFAbsoluteTimeGetCurrent();
            for (id obj in test) {
                sum += 1;
            }
            NSLog(@"ForLoop Time: %f", CFAbsoluteTimeGetCurrent() - date_s);
            
            sum = 0;
            date_s =  CFAbsoluteTimeGetCurrent();
            for (id obj in [test reverseObjectEnumerator]) {
                sum += 1;
            }
            NSLog(@"ForLoop Time reverse: %f", CFAbsoluteTimeGetCurrent() - date_s);
        }
            break;
        case EnumerateObjectsWithOptions:
        {
            __block int sum = 0;
            double date_s = CFAbsoluteTimeGetCurrent();
            [test enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                sum += 1;
            }];
            NSLog(@"EnumerateObjectsWithOptions Time: %f", CFAbsoluteTimeGetCurrent() - date_s);
            sum = 0;
            date_s =  CFAbsoluteTimeGetCurrent();
            [test enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                sum += 1;
            }];
            NSLog(@"EnumerateObjectsWithOptions Time reverse: %f", CFAbsoluteTimeGetCurrent() - date_s);

        }
            break;
        case MakeObjectsPerformSelector:
            break;
        default:
            break;
    }
}




- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    test = [NSMutableArray array];
    for (int i= 0; i < 10000000; i++) {
        [test addObject:@(i)];
    }
}

@end
