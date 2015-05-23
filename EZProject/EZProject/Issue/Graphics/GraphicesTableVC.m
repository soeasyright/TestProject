//
//  
//  EZProject
//
//  Created by Viscovery on 2015/5/20.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#import "GraphicesTableVC.h"

#import "EZMacro.h"
@interface GraphicesTableVC () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@end

@implementation GraphicesTableVC
@synthesize imageView,shapeLayer;

typedef NS_ENUM(NSInteger,IssueNamePlusTable(Graphices)){
    AllClear,
    CABasicAnimationMove,
    CABasicAnimationStroke,
    Line,
    Circle,
    Hexagon,

    IssueNamePlusTableMax(Graphices)
};

EZTableCreate(Graphices);
+ (NSDictionary *)typeDisplayNames
{
    return @{
             @(CABasicAnimationStroke) : EZEnum2String(CABasicAnimationStroke),
             @(CABasicAnimationMove) : EZEnum2String(CABasicAnimationMove),
             @(AllClear) : EZEnum2String(AllClear),
             @(Line) : EZEnum2String(Line),
             @(Circle) : EZEnum2String(Circle),
             @(Hexagon) : EZEnum2String(Hexagon),
             };
}

#pragma mark <UITableViewDelegate>
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIGraphicsBeginImageContext(imageView.frame.size);
    //生成畫布
    CGContextRef context = UIGraphicsGetCurrentContext();
    switch (indexPath.row) {
        case CABasicAnimationStroke:
        {
            UIGraphicsEndImageContext();
            shapeLayer = [CAShapeLayer layer];
            self.shapeLayer.fillColor = nil;
            self.shapeLayer.lineWidth = 7;
            self.shapeLayer.strokeColor = [UIColor blackColor].CGColor;
            self.shapeLayer.bounds = CGRectMake(200, 200, 200, 200);
            self.shapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:self.shapeLayer.bounds].CGPath;
            [self.imageView.layer addSublayer:self.shapeLayer];
            




            //move
            CABasicAnimation *strokeStart = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
            strokeStart.toValue = @(0.7);
            CABasicAnimation *strokeEnd = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            strokeEnd.toValue = @(1.0);
            
            CAAnimationGroup *group = [[CAAnimationGroup alloc]init];
            group.animations = @[strokeStart,strokeEnd];
            // 动画选项的设定
            group.duration = 3.0; // 持续时间
            group.repeatCount = HUGE; // forver
            // 起始帧和终了帧的设定
            group.autoreverses = YES;

            // 添加动画
            [shapeLayer addAnimation:group forKey:@"strokeStart"];
            return;
        }
            break;
        case CABasicAnimationMove:
        {
            UIGraphicsEndImageContext();
            NSIndexPath *copyIndex=[NSIndexPath indexPathForRow:Circle inSection:0];
            [self tableView:tableView didSelectRowAtIndexPath:copyIndex];
            
            
            //move
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
            // 动画选项的设定
            animation.duration = 2.5; // 持续时间
            animation.repeatCount = 1; // 重复次数
            // 起始帧和终了帧的设定
            animation.fromValue = [NSValue valueWithCGPoint:imageView.layer.position]; // 起始帧
            animation.toValue = [NSValue valueWithCGPoint:CGPointMake(320, 480)]; // 终了帧
            // 添加动画  
            [imageView.layer addAnimation:animation forKey:@"move-layer"];
            return;
        }
            break;
        case Circle:
        {
            //線的顏色
            CGContextSetStrokeColorWithColor(context,[UIColor blueColor].CGColor);
            //填充顏色
            CGContextSetFillColorWithColor(context,[UIColor redColor].CGColor);
            //線的寬度
            CGContextSetLineWidth(context, 4.0f);
            
            //畫陰影
            //offset,blur,color
            CGContextSetShadow(context, CGSizeMake(10, 10), 0.1);

            //畫圓
            // x,y,stratAngle,endAngle
            CGContextAddArc(context, 150.0, 150.0, 50.0, 0, 2 * M_PI, 1);
            //填滿路徑
            CGContextDrawPath(context, kCGPathFillStroke);
//            CGContextClosePath(context);
//            CGContextStrokePath(context);


        }
            break;
        case Line:
        {
            //線的顏色
            CGContextSetStrokeColorWithColor(context,[UIColor blueColor].CGColor);
            //線的寬度
            CGContextSetLineWidth(context, 4.0f);
            //將筆移動到
            CGContextMoveToPoint(context, 0.0, 0.0);
            //畫線
            CGContextAddLineToPoint(context,300.0,0.0);
            CGContextClosePath(context);
            CGContextStrokePath(context);
        }
            break;
        case AllClear:
        {
//             [imageView removeFromSuperview];
        }
            break;
        case Hexagon:
        {

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
            

        }
            break;

        default:
            break;
    }
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
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
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0, 0.0, 300.0, 300.0)];
    imageView.center = self.view.center;
    [self.view addSubview:imageView];
}
@end
