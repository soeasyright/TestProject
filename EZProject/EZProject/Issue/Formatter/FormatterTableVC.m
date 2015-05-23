//
//  DataFormatter.m
//  EZProject
//
//  Created by soeasyright on 2015/5/20.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#import "FormatterTableVC.h"
#import "EZMacro.h"



@interface FormatterTableVC () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation FormatterTableVC

typedef NS_ENUM(NSInteger, IssueNamePlusTable(Formatter) ){
    NSDate2NSString,
    NSData2NSString,
    IssueNamePlusTableMax(Formatter)
};
EZTableCreate(Formatter);




+ (NSDictionary *)typeDisplayNames
{
    return @{
             @(NSDate2NSString) : EZEnum2String(NSDate2NSString),
             @(NSData2NSString) : EZEnum2String(Formatter_NSData2NSString),
             };
}

#pragma mark <UITableViewDelegate>
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case NSDate2NSString:
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
        case NSData2NSString:
        {
            NSData* nsData = [@"testdata" dataUsingEncoding:NSUTF8StringEncoding];
            NSString *result = [[NSString alloc] initWithData:nsData  encoding:NSUTF8StringEncoding];
            
        }

            break;
        default:
            break;
    }
}

@end
