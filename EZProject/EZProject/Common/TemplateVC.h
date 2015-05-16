//
//  TemplateVC.h
//  EZProject
//
//  Created by soeasyright on 2015/5/14.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TemplateVC : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *tableLists;
@end
