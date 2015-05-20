//
//  GraphicesTableVC.m
//  EZProject
//
//  Created by Viscovery on 2015/5/20.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#import "GraphicesTableVC.h"


@interface GraphicesTableVC () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation GraphicesTableVC

typedef NS_ENUM(NSInteger,GraphicesTable){
    Efficiency_ForLoop,
    Efficiency_Forin,
    Efficiency_MakeObjectsPerformSelector,
    Efficiency_EnumerateObjectsUsingBlock,
    Efficiency_EnumerateObjectsWithOptions,
    Efficiency_Dispatch_apply,
    EfficiencyTableMax
};


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

        }
            break;
        case Efficiency_Forin:
        {

        }
            break;
        case Efficiency_EnumerateObjectsWithOptions:
        {

            
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
    
    
}
+ (NSString *)typeDisplayName:(GraphicesTable) type
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
