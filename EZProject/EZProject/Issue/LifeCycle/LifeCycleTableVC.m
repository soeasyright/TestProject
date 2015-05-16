//
//  LifeCycleTableVC.m
//  EZProject
//
//  Created by soeasyright on 2015/5/16.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#import "LifeCycleTableVC.h"

@interface LifeCycleTableVC () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation LifeCycleTableVC

static NSString *const reuseIdentifer=@"NormalCell";
#define EZEnum2String(_name_) @#_name_

typedef NS_ENUM(NSInteger,LifeCycleTable){
    ViewControllerLifeCycle,
    ViewController_With_StroyBoard,
    Object,
    RunTime_Object,
    LifeCycleTableMax
};


static  NSString  *const reuseIdentifier=@"reuseIdentifier2";

+ (NSDictionary *)typeDisplayNames
{
    return @{
             @(ViewControllerLifeCycle) : EZEnum2String(ViewControllerLifeCycle),
             @(ViewController_With_StroyBoard) : EZEnum2String(ViewController_With_StroyBoard),
             @(Object) : EZEnum2String(Object),
             @(RunTime_Object) : EZEnum2String(RunTime_Object),
             };
}

+ (NSString *)typeDisplayName:(LifeCycleTable) type
{
    return [[self class] typeDisplayNames][@(type)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return LifeCycleTableMax;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifer ];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    cell.textLabel.text =  [[self class] typeDisplayName:indexPath.row] ;
    cell.textLabel.textAlignment=NSTextAlignmentCenter;
    return cell;
}

#pragma mark <UITableViewDelegate>
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc=nil;
    switch (indexPath.row) {
        case ViewController:
            vc=[[LifeCycleTableVC alloc]init];
            break;
            
        default:
            break;
    }
    if (vc) {
        [self.navigationController setNavigationBarHidden:NO];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end