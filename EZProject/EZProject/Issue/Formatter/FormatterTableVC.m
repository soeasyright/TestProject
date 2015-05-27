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
    UIImage2NSString,
    NSString2UIImage,
    IssueNamePlusTableMax(Formatter)
};
EZTableCreate(Formatter);




+ (NSDictionary *)typeDisplayNames
{
    return @{
             @(NSDate2NSString) : EZEnum2String(NSDate2NSString),
             @(NSData2NSString) : EZEnum2String(Formatter_NSData2NSString),
             @(UIImage2NSString) : EZEnum2String(UIImage2NSString),
             @(NSString2UIImage) : EZEnum2String(NSString2UIImage),
             };
}

#pragma mark <UITableViewDelegate>
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case NSString2UIImage:
        {
            NSString *tmp=@"iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAAAXNSR0IArs4c6QAAAAlwSFlzAAAWJQAAFiUBSVIk8AAAABxpRE9UAAAAAgAAAAAAAAAZAAAAKAAAABkAAAAZAAABE73c2/MAAADfSURBVGgF7JG9bcNgEEM1QkbJBh4t3CijZASPYvMVbNJYCAsqgB9wuOY7/kjH8eb9Bf7NF/hw0tuL4c0lIdiX5+55nBzecnMZKPHjOVvg9ztuL/GHvosSKYXGlE+7J0y70ZohO7cFco/WDNk5QdqN1gzZuS2Qe7RmyM4J0m60ZsjObYHcozVDdk6QdqM1Q3ZuC+QerRmyc4K0G60ZsnNbIPdozZCdE6TdaM2QndsCuUdrhuycIO1Ga4bs3BbIPVozZOcEaTdaM2TntkDu0ZohOydIu9GaITu3BXKP1p95AgAA///0IgbQAAAAw0lEQVTtlNEJwzAQQzNCRuwIGUkjdJSO0A0yQipB76elJE5jnwwWGBvnbN47Q6bpOwu3Vo7NdIhNjLu5scJVIrgOicgUxjJ3AZYELI4OuMwPMs0lElELLrqXcJI5/RIhETO4yHqZyyQyZS6XyJCpJtFSprpEC5lmEjVlmkvUkAEvnePijFkA//6adYdFQIqzMjprFZCmVEZnLANSHZVRrXVAuj0Z1XQRkPKXjL51FZD2U0Z7XWYh9fM9tB4ZHRgdSOrAC+cZaWgO7IKqAAAAAElFTkSuQmCC";
            NSData *imagedata = [[NSData alloc]initWithBase64EncodedString:tmp
                                                                   options:NSDataBase64DecodingIgnoreUnknownCharacters];
            UIImage *image = [[UIImage alloc] initWithData:imagedata];
            UIImageView *imagev = [[UIImageView alloc]initWithImage:image];
            imagev.frame = CGRectMake(100, 100, 100, 100);
            [self.view addSubview:imagev];
            

        }
            break;
        case UIImage2NSString:
        {
            UIImage *image = [UIImage imageNamed:@"Download"];
            NSData *imagedata = UIImagePNGRepresentation(image);
            NSString *stringImage = [imagedata base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
            EZShowValue(stringImage);

            
        }
            break;
        case NSDate2NSString:
        {
            {
            NSDate *date = [NSDate date];
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"YYYY-MM-dd"];
            NSString *correctDate = [formatter stringFromDate:date];
            EZShowValue(correctDate);
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
            EZShowValue(result);
        }

            break;
            //兩點距離
//        {
//            CLLocation *orig=[[CLLocation alloc] initWithLatitude:[mainDelegate.latitude_self doubleValue]  longitude:[mainDelegate.longitude_self doubleValue]];
//            CLLocation* dist=[[CLLocation alloc] initWithLatitude:[tmpNewsModel.latitude doubleValue] longitude:[tmpNewsModel.longitude doubleValue]];
//            
//            CLLocationDistance kilometers=[orig distanceFromLocation:dist]/1000;
//        }
            //16進位轉顏色
//        {
//            if ([[hexString substringToIndex:1] isEqualToString:@"#"]) {
//                hexString = [hexString substringFromIndex:1];
//            }
//            
//            unsigned rgbValue = 0;
//            NSScanner *scanner = [NSScanner scannerWithString:hexString];
//            [scanner scanHexInt:&rgbValue];
//            
//            return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
//        }
            //螢幕截圖
//        {
//            UIGraphicsBeginImageContext(self.view.bounds.size);
//            
//            [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
//            
//            UIImage *image= UIGraphicsGetImageFromCurrentImageContext();
//            
//            UIGraphicsEndImageContext();
//            
//            UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
//        }
        default:
            break;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
