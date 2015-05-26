//
//  TableViewController.m
//  EZProject
//
//  Created by Viscovery on 2015/5/26.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic,strong) UITableView *mTableView;
@property (nonatomic,strong) NSMutableArray *sectionA;
@property (nonatomic,strong) NSMutableArray *sectionB;
@property (nonatomic,assign) BOOL isEditing;
@end

@implementation TableViewController
@synthesize sectionA,sectionB;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"TableViewController";
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                                                                 target:self action:@selector(didClickRightBarButtonItemAction:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
    self.mTableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.mTableView.backgroundColor = [UIColor whiteColor];
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    [self.view addSubview:self.mTableView];
    
    //clear 多餘隔線
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    [self.mTableView setTableFooterView:view];
    
    sectionA = [[NSMutableArray alloc]init];
    sectionB = [[NSMutableArray alloc]init];
    for (int i = 0; i < 3; i++) {
        [sectionA addObject:[NSString stringWithFormat:@"A_%d",i]];
    }
    for (int i = 0; i < 20; i++) {
        [sectionB addObject:[NSString stringWithFormat:@"B_%d",i]];
    }
    
}
// 自定义编辑按钮
- (void)didClickRightBarButtonItemAction:(UIBarButtonItem *)rightButton{
    

    rightButton.title = _isEditing ? @"编辑":@"完成";
    _isEditing = !_isEditing;
    [self.mTableView setEditing:_isEditing animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section == 0 ? sectionA.count : sectionB.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"reuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier ];
    

    //reuseCell
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    cell.textLabel.text =  indexPath.section == 0 ?  sectionA[indexPath.row] : sectionB[indexPath.row];
    cell.textLabel.textAlignment=NSTextAlignmentCenter;    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return section == 0 ? @"A區" : @"B區";
    
}


#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //取消hightlight
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

#pragma mark 編輯
//能否使用編輯
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    //A區刪除,B區新增
    return indexPath.section == 0 ? UITableViewCellEditingStyleDelete : UITableViewCellEditingStyleInsert;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    //刪除狀態
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if ( sectionA.count>1) {
            // 先删除数据
            [sectionA removeObjectAtIndex:indexPath.row];
            // 删除cell(指定行)
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
        else {
            [sectionA removeAllObjects];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }

    }
    //添加數據
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        //?=0 新增於上方 1新增於下方
//         NSIndexPath * selfIndexPath = [NSIndexPath indexPathForRow:indexPath.row+? inSection:indexPath.section];
        [sectionB addObject:[NSString stringWithFormat:@"B_%lu",(unsigned long)sectionB.count]];
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }   
}

#pragma mark 移動
//能否使用移動
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
//移動是否成功
- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath{
    
    // 一般,移动都是发生在同区之间,数据在不同区之间移动,那么数据一开始就应该不会编辑到一个区
    if (sourceIndexPath.section == proposedDestinationIndexPath.section) {
        // 允许移动(目的地)
        return proposedDestinationIndexPath;
        
    }else{
        // 不允许移动(源始地)
        return sourceIndexPath;
        
    }
    
}
//移動
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    NSString * moveString = sectionB[fromIndexPath.row];

    if(toIndexPath.row>fromIndexPath.row)
    {
        // 移动到目的地
        [sectionB insertObject:moveString atIndex:toIndexPath.row + 1 ];
        // 删除源始地的数据
        [sectionB removeObjectAtIndex:fromIndexPath.row];
    }
    else{
        // 移动到目的地
        [sectionB insertObject:moveString atIndex: toIndexPath.row];
        // 删除源始地的数据
        [sectionB removeObjectAtIndex:fromIndexPath.row + 1];
    }
}







@end
