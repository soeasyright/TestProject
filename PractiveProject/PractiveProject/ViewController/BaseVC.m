//
//  BaseVC.m
//  PractiveProject
//
//  Created by Viscovery on 2015/5/12.
//  Copyright (c) 2015年 watsons. All rights reserved.
//

#import "BaseVC.h"
#import "IssueCell.h"
#import "IssueHeader.h"
@interface BaseVC ()<UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *practiveLists;
@end

@implementation BaseVC
@synthesize practiveLists;

#define EZEnum2String(_name_) (@""#_name_)

typedef NS_ENUM(NSInteger,IssueType){
    IssueTypeTableViewCell,
    IssueTypeAutoLayout,
    IssueTypeMax
};


static NSString *IssueIdentifier=@"IssueCell";

+ (NSDictionary *)typeDisplayNames
{
    return @{@(IssueTypeTableViewCell) : EZEnum2String(IssueTypeTableViewCell),
             @(IssueTypeAutoLayout) : EZEnum2String(IssueTypeAutoLayout)};
}
- (NSString *)typeDisplayName:(IssueType) type
{
    return [[self class] typeDisplayNames][@(type)];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [_tableView registerNib:[UINib nibWithNibName:IssueIdentifier bundle:nil] forCellReuseIdentifier:IssueIdentifier];
    practiveLists=[[NSMutableArray alloc] init];
    for (int i=0; i<IssueTypeMax; i++) {
        NSMutableDictionary *practiveList = [[NSMutableDictionary alloc] init];
        [practiveList setObject:[self typeDisplayName:i] forKey:@"title"];
        [practiveLists addObject:practiveList];
    }

    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.practiveLists count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    IssueCell *cell = [tableView dequeueReusableCellWithIdentifier:IssueIdentifier forIndexPath:indexPath];
    cell.issueTitle.text=[[self.practiveLists objectAtIndex:indexPath.row] objectForKey:@"title"];
    return cell;


}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
