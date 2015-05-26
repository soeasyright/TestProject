//
//  BaseVC.m
//  EZProject
//
//  Created by soeasyright on 2015/5/14.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#import "BaseVC.h"
#import "EZMacro.h"
#import "EfficiencyTableVC.h"
#import "LifeCycleTableVC.h"
#import "FormatterTableVC.h"
#import "GraphicesTableVC.h"
#import "AnimationTableVC.h"
#import "BaseViewTableVC.h"
@interface BaseVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation BaseVC



typedef NS_ENUM(NSInteger,IssueNamePlusTable(IssueType)){
    LifeCycle,
    Efficiency,
    Formatter,
    Graphices,
    Animation,
    BaseView,
//    StandardUserDefaults,
//    TableViewCell,
//    AutoLayout,
    IssueNamePlusTableMax(IssueType)
};


+ (NSDictionary *)typeDisplayNames
{
    return @{
             @(LifeCycle) : EZEnum2String(LifeCycle),
             @(Efficiency) : EZEnum2String(Efficiency),
             @(Formatter) : EZEnum2String(Formatter),
             @(Graphices) : EZEnum2String(Graphices),
             @(Animation) : EZEnum2String(Animation),
             @(BaseView) : EZEnum2String(BaseView),
//             @(StandardUserDefaults) : EZEnum2String(StandardUserDefaults),
//             @(TableViewCell) : EZEnum2String(TableViewCell),
//             @(AutoLayout) : EZEnum2String(AutoLayout),
             };
}


#pragma mark <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc=nil;
    switch (indexPath.row) {
        case LifeCycle:
            vc=[[LifeCycleTableVC alloc]init];
            break;
        case Efficiency:
             vc=[[EfficiencyTableVC alloc]init];
            break;
        case Formatter:
            vc=[[FormatterTableVC alloc]init];
            break;
        case Graphices:
            vc=[[GraphicesTableVC alloc]init];
            break;
        case Animation:
            vc=[[AnimationTableVC alloc]init];
            break;
        case BaseView:
            vc=[[BaseViewTableVC alloc]init];
            break;
        default:
            break;
    }
    if (vc) {
        [self.navigationController setNavigationBarHidden:NO];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

+ (NSString *)typeDisplayName:(IssueNamePlusTable(IssueType)) type{
    return [[self class] typeDisplayNames][@(type)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    load nib view
//    [collectionView registerNib:[UINib nibWithNibName:IssueIdentifier bundle:nil] forCellReuseIdentifier:IssueIdentifier];
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    
//    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:2 inSection:0];
//    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
//    [self.navigationController setNavigationBarHidden:YES]; //ios8
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark <UITableViewDataSource>
static  NSString  *const reuseIdentifier=@"reuseIdentifier";
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return IssueNamePlusTableMax(IssueType);
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];

    UILabel *label = (UILabel *)[cell viewWithTag:100];
    label.text =  [[self class] typeDisplayName:indexPath.row] ;
    return cell;
}




@end
