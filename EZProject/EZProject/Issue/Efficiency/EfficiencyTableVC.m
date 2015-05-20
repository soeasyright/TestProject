//
//  Efficiency.m
//  EZProject
//
//  Created by soeasyright on 2015/5/14.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#import "EfficiencyTableVC.h"

@interface EfficiencyTableVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,copy) NSMutableArray *test;
@end

@implementation EfficiencyTableVC

typedef NS_ENUM(NSInteger,EfficiencyTable){
    Efficiency_ForLoop,
    Efficiency_Forin,
    Efficiency_MakeObjectsPerformSelector,
    Efficiency_EnumerateObjectsUsingBlock,
    Efficiency_EnumerateObjectsWithOptions,
    Efficiency_Dispatch_apply,
    EfficiencyTableMax
};

//for in (NSFastEnumeration)
//makeObjectsPerformSelector
//kvc集合运算符
//enumerateObjectsUsingBlock
//enumerateObjectsWithOptions(NSEnumerationConcurrent)
//dispatch_apply

@synthesize test;
static NSString *const reuseIdentifier=@"reuseIdentifier";
#define EZEnum2String(_name_) @#_name_
+ (NSDictionary *)typeDisplayNames
{
    return @{
             @(Efficiency_ForLoop) : EZEnum2String(Efficiency_ForLoop),
             @(Efficiency_Forin) : EZEnum2String(Efficiency_Forin),
             @(Efficiency_MakeObjectsPerformSelector) : EZEnum2String(Efficiency_MakeObjectsPerformSelector),
             @(Efficiency_EnumerateObjectsUsingBlock) : EZEnum2String(Efficiency_EnumerateObjectsUsingBlock),
             @(Efficiency_EnumerateObjectsWithOptions) : EZEnum2String(Efficiency_EnumerateObjectsWithOptions),
             @(Efficiency_Dispatch_apply) : EZEnum2String(Efficiency_Dispatch_apply),
             };
}

#pragma mark <UITableViewDelegate>
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc=nil;
    switch (indexPath.row) {
        case Efficiency_ForLoop:
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
        case Efficiency_Forin:
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
        case Efficiency_EnumerateObjectsWithOptions:
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
        case Efficiency_MakeObjectsPerformSelector:
            break;
        default:
            break;
    }
    if (vc) {
        [self.navigationController pushViewController:vc animated:YES];
    }
}




- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"LifeCycle";
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
    test = [NSMutableArray array];
    for (int i= 0; i < 10000000; i++) {
        [test addObject:@(i)];
    }

}
+ (NSString *)typeDisplayName:(EfficiencyTable) type
{
    return [[self class] typeDisplayNames][@(type)];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return EfficiencyTableMax;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier ];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    cell.textLabel.text =  [[self class] typeDisplayName:indexPath.row] ;
    cell.textLabel.textAlignment=NSTextAlignmentCenter;
    return cell;
}

@end
