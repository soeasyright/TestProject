//
//  BaseVC.m
//  EZProject
//
//  Created by soeasyright on 2015/5/14.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#import "BaseVC.h"
#import "EfficiencyTableVC.h"
#import "LifeCycleTableVC.h"
#import "FormatterTableVC.h"
#import "GraphicesTableVC.h"
@interface BaseVC ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation BaseVC


#define EZEnum2String(_name_) @#_name_

typedef NS_ENUM(NSInteger,IssueType){
    LifeCycle,
    Efficiency,
    Formatter,
    Graphices,
    StandardUserDefaults,
    TableViewCell,
    AutoLayout,
    IssueTypeMax
};


static  NSString  *const reuseIdentifier=@"reuseIdentifier";

+ (NSDictionary *)typeDisplayNames
{
    return @{
             @(LifeCycle) : EZEnum2String(LifeCycle),
             @(Efficiency) : EZEnum2String(Efficiency),
             @(Formatter) : EZEnum2String(Formatter),
             @(Graphices) : EZEnum2String(Graphices),
             @(StandardUserDefaults) : EZEnum2String(StandardUserDefaults),
             @(TableViewCell) : EZEnum2String(TableViewCell),
             @(AutoLayout) : EZEnum2String(AutoLayout),
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

        default:
            break;
    }
    if (vc) {
        [self.navigationController setNavigationBarHidden:NO];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

+ (NSString *)typeDisplayName:(IssueType) type{
    return [[self class] typeDisplayNames][@(type)];
}

- (void)viewDidLoad {
    [super viewDidLoad];

//
//
//    //load nib view
////    [collectionView registerNib:[UINib nibWithNibName:IssueIdentifier bundle:nil] forCellReuseIdentifier:IssueIdentifier];
////    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
//    //set data
//    practiveLists=[[NSMutableArray alloc] init];
//    for (int i = 0; i < IssueTypeMax; i++) {
//        NSMutableDictionary *practiveList = [[NSMutableDictionary alloc] init];
//        [practiveList setObject:[[self class] typeDisplayName:i] forKey:@"title"];
//        [practiveLists addObject:practiveList];
//    }
//
//    [self.collectionView reloadData];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
//    [self.navigationController setNavigationBarHidden:YES]; //ios8
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark <UITableViewDataSource>
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return IssueTypeMax;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];

    UILabel *label = (UILabel *)[cell viewWithTag:100];
//    label.layer.borderColor = [UIColor blackColor].CGColor;
//    label.layer.borderWidth = 2.0;
//    label.layer.cornerRadius = 4.0;

    label.text =  [[self class] typeDisplayName:indexPath.row] ;

    return cell;
}



/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
 }
 */

/*
 // Uncomment this method to specify if the specified item should be selected
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
 }
 
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
 }
 
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
 }
 */



//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    UIViewController *vc=nil;
//    switch (indexPath.row) {
//        case IssueTypeObjectLifeCycle:
//            vc=[[LifeCycle alloc]init];
//            break;
//            
//        default:
//            break;
//    }
//    if (vc) {
//        [self.navigationController pushViewController:vc animated:YES];
//    }
//}

@end
