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
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) NSTimer *pressingTimer;
@property (nonatomic, assign) float fillPercent;
@end

@implementation GraphicesTableVC
@synthesize imageView,shapeLayer,btn;

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

    switch (indexPath.row) {
        case CABasicAnimationStroke:
        {

            shapeLayer = [CAShapeLayer layer];
            self.shapeLayer.fillColor = nil;
            self.shapeLayer.lineWidth = 7;
            self.shapeLayer.strokeColor = [UIColor blackColor].CGColor;
            self.shapeLayer.frame = CGRectMake(50, 50, 200, 200);
            self.shapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:self.shapeLayer.bounds].CGPath;
            [self.imageView.layer addSublayer:self.shapeLayer];
            
            NSLog(@"strokeStart %f",self.shapeLayer.strokeStart);
            NSLog(@"strokeEnd %f",self.shapeLayer.strokeEnd);



            //move
            CABasicAnimation *strokeStart = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
            strokeStart.toValue = @(0.7);
            CABasicAnimation *strokeEnd = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            strokeEnd.toValue = @(0.9);
            
            CAAnimationGroup *group = [[CAAnimationGroup alloc]init];
            group.animations = @[strokeStart,strokeEnd];
            // 动画选项的设定
            group.duration = 1.5; // 持续时间
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
            UIGraphicsBeginImageContext(imageView.frame.size);
            //生成畫布
            CGContextRef context = UIGraphicsGetCurrentContext();
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
            imageView.image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();

        }
            break;
        case Line:
        {
            UIGraphicsBeginImageContext(imageView.frame.size);
            //生成畫布
            CGContextRef context = UIGraphicsGetCurrentContext();
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
            imageView.image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
        }
            break;
        case AllClear:
        {

        }
            break;
        case Hexagon:
        {
            UIGraphicsBeginImageContext(imageView.frame.size);
            //生成畫布
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

        }
            break;


        default:
            break;
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
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0, 0.0, 300.0, 300.0)];
    imageView.center = self.view.center;
    [self.view addSubview:imageView];
    
    btn = [[UIButton alloc] initWithFrame:CGRectMake(0.0,500.0,50.0,50.0)];
    btn.titleLabel.text =@"hihihihi";
    [btn setImage:[UIImage imageNamed:@"Download"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(touchON:) forControlEvents:UIControlEventTouchDown];
    
    shapeLayer = [[CAShapeLayer alloc] init];
    CGPathRef path = CGPathCreateWithRect(CGRectMake(0.0,0.0,50.0,50.0), NULL);
    shapeLayer.path = path;
    CGPathRelease(path);
    
    btn.imageView.layer.mask = shapeLayer;


    [self.view addSubview:btn];
}
- (void)touchON:(UIButton *)sender{
    NSLog(@"ON");
    
    [UIView animateWithDuration:1.0 animations:^{
        [shapeLayer setFrame:CGRectMake(0,
                                            0,
                                            50,
                                            10)];
        
    }];
//    [self createTimer:YES];
}
- (void) createTimer: (BOOL) timer
{

    if(timer){
        if(!self.pressingTimer){
            self.pressingTimer = [NSTimer scheduledTimerWithTimeInterval:4/(1/0.01)
                                                                  target:self
                                                                selector:@selector(emptyButton)
                                                                userInfo:nil repeats:YES];
        }
    }else{
        if(self.pressingTimer){
            [self.pressingTimer invalidate];
            self.pressingTimer = nil;
        }
        
    }
    
}
- (void) emptyButton
{

    [self setFillPercent:_fillPercent-0.01];
    
    if(self.fillPercent<0.0){
            [self createTimer:NO];
    }
}
@end
