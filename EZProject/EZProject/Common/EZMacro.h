//
//  EZMacro.h
//  EZProject
//
//  Created by soeasyright on 2015/5/23.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#ifndef EZProject_EZMacro_h
#define EZProject_EZMacro_h

#define EZEnum2String(_name_) @#_name_



#define IssueNamePlusTable(_name_) _name_##Table
#define IssueNamePlusTableMax(_name_) _name_##TableMax

#define EZTableCreate(_name_) \
- (void)viewDidLoad {\
[super viewDidLoad];\
self.navigationItem.title=@#_name_;\
_tableView = [[UITableView alloc] initWithFrame:self.view.frame];\
_tableView.backgroundColor = [UIColor whiteColor];\
_tableView.delegate=self;\
_tableView.dataSource=self;\
[self.view addSubview:_tableView];\
UIView *view = [[UIView alloc] init];\
view.backgroundColor = [UIColor clearColor];\
[_tableView setTableFooterView:view];\
}\
+ (NSString *)typeDisplayName:(IssueNamePlusTable(_name_)) type{\
    return [[self class] typeDisplayNames][@(type)];\
}\
- (void)didReceiveMemoryWarning {\
    [super didReceiveMemoryWarning];\
}\
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {\
    return 1;\
}\
\
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {\
    return IssueNamePlusTableMax(_name_);\
}\
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {\
    static NSString *const reuseIdentifier=@"reuseIdentifier";\
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier ];\
    if (!cell) {\
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];\
    }\
    cell.textLabel.text =  [[self class] typeDisplayName:indexPath.row] ;\
    cell.textLabel.textAlignment=NSTextAlignmentCenter;\
    return cell;\
}

#endif
