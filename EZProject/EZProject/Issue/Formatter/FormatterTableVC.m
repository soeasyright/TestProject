//
//  DataFormatter.m
//  EZProject
//
//  Created by soeasyright on 2015/5/20.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#import "FormatterTableVC.h"

@interface FormatterTableVC () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation FormatterTableVC

typedef NS_ENUM(NSInteger,FormatterTable){
    Formatter_NSDate2NSString,
    Formatter_NSData2NSString,
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
             @(Formatter_NSDate2NSString) : EZEnum2String(Formatter_NSDate2NSString),
             @(Formatter_NSData2NSString) : EZEnum2String(Formatter_NSData2NSString),
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
        case Formatter_NSDateFormatter:
        {
            {
            NSDate *date = [NSDate date];
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"YYYY-MM-dd"];
            NSString *correctDate = [formatter stringFromDate:date];
            NSLog(@"correctDate %@",correctDate);
//            a        AM/PM (上午/下午)
//            K        0~11 有0時的12小時制
//            h        1~12 12小時制
//            H        0~23 有0時的24小时制
//            k        1~24 24小時制
//            m        0~59 分鐘
//            s        0~59 秒數
//            s        秒數的個位數
//            A        0~86399999 一天當中的第幾微秒
//            
//            v~vvv    一般的GMT時區縮寫
//            vvvv     一般的GMT時區名稱
//            z~zzz    具體的GMT時區縮寫
//            zzzz     具體的GMT時區名稱
            }
            {
            //取得目前已知的所有地裡名稱
            NSArray *timeZoneNames = [NSTimeZone knownTimeZoneNames];
            
            //取得本地目前時間
            NSDate *date = [NSDate date];
            
            for(NSString *name in timeZoneNames) {
                NSTimeZone *timezone = [[NSTimeZone alloc] initWithName:name];
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                
                //設定時間格式
                [formatter setDateFormat:@"YYYY-MM-d HH:mm:ss"];
                
                //設定時區
                [formatter setTimeZone:timezone];
                
                //時間格式正規化並做時區校正
                NSString *correctDate = [formatter stringFromDate:date];
                
                NSLog(@"地點：%@   當地時間：%@",[timezone name], correctDate); 
                

            }
            }


        }
            break;
        case Formatter_NSData2NSString:
        {
            NSData* nsData = [@"testdata" dataUsingEncoding:NSUTF8StringEncoding];
            NSString *result = [[NSString alloc] initWithData:nsData  encoding:NSUTF8StringEncoding]; 
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
+ (NSString *)typeDisplayName:(FormatterTable) type
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
