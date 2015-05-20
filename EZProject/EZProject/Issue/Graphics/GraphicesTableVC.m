//
//  GraphicesTableVC.m
//  EZProject
//
//  Created by Viscovery on 2015/5/20.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#import "GraphicesTableVC.h"


@interface GraphicesTableVC () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation GraphicesTableVC

typedef NS_ENUM(NSInteger,GraphicesTable){
    Efficiency_ForLoop,
    Efficiency_Forin,
    Efficiency_MakeObjectsPerformSelector,
    Efficiency_EnumerateObjectsUsingBlock,
    Efficiency_EnumerateObjectsWithOptions,
    Efficiency_Dispatch_apply,
    EfficiencyTableMax
};

@synthesize imageView;
static NSString *const reuseIdentifier=@"reuseIdentifier";
#define EZEnum2String(_name_) @#_name_
+ (NSDictionary *)typeDisplayNames
{
    return @{
             @(Efficiency_ForLoop) : EZEnum2String(Efficiency_ForLoop),
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
        case Efficiency_ForLoop:
        {
            imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0, 0.0, 300.0, 200.0)];
            imageView.center = self.view.center;
            
            UIGraphicsBeginImageContext(imageView.frame.size);
            CGContextRef context = UIGraphicsGetCurrentContext();
            
            CGContextBeginPath(context);
            CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 1.0);
            
            //六角形區域的路徑
            CGContextMoveToPoint(context, 100.0, 0.0);
            CGContextAddLineToPoint(context, 200.0, 0.0);
            CGContextAddLineToPoint(context, 250.0, 100.0);
            CGContextAddLineToPoint(context, 200.0, 200.0);
            CGContextAddLineToPoint(context, 100.0, 200.0);
            CGContextAddLineToPoint(context, 50.0, 100.0);
            
            CGContextClosePath(context);
            CGContextDrawPath(context, kCGPathFill);
            
            imageView.image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            [self.view addSubview:imageView];

        }
            break;
        case Efficiency_Forin:
        {

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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    //取得相對應的點擊位置
    CGPoint point;
    UITouch *touchs = [[event allTouches]anyObject];
    point = [touchs locationInView:imageView];
    
    //設定一虛擬路徑
    CGMutablePathRef myPath = CGPathCreateMutable();
    CGPathMoveToPoint(myPath, NULL, 100.0, 0.0);
    CGPathAddLineToPoint(myPath, NULL, 200.0, 0.0);
    CGPathAddLineToPoint(myPath, NULL, 250.0, 100.0);
    CGPathAddLineToPoint(myPath, NULL, 200.0, 200.0);
    CGPathAddLineToPoint(myPath, NULL, 100.0, 200.0);
    CGPathAddLineToPoint(myPath, NULL, 50.0, 100.0);
    
    CGPathCloseSubpath(myPath);
    
    NSLog(@"點擊區域在圖形之外");
    
    //判斷是否在虛擬路徑所繪製的區域內
    if (CGPathContainsPoint(myPath, NULL, point, YES)) {
        NSLog(@"點擊區域在圖形之內");
    }
    
    CGPathRelease(myPath);
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
+ (NSString *)typeDisplayName:(GraphicesTable) type
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
