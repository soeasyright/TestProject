//
//  CircularLoaderVC.m
//  EZProject
//
//  Created by Viscovery on 2015/5/27.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#import "CircularLoaderVC.h"

@interface CircularLoaderVC ()
@property (nonatomic, strong)CAShapeLayer *circlePathLayer;
@property (nonatomic, strong)UIView *progressView;
@property (nonatomic, strong)UIImageView *imageView;
@end

@implementation CircularLoaderVC
@synthesize circlePathLayer,progressView,imageView;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"CircularLoaderVC" ;
    self.view.backgroundColor = [UIColor whiteColor];
    
//    CGRect screen = [[UIScreen mainScreen] bounds];
    
    
    
    imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"SampleView"]];

    [self.view addSubview:imageView];
 
    progressView = [[UIView alloc]initWithFrame:self.view.frame];
    
    circlePathLayer = [[CAShapeLayer alloc] init];
    circlePathLayer.frame = progressView.frame;
    circlePathLayer.lineWidth = 10;
    circlePathLayer.fillColor = [UIColor clearColor].CGColor;
    circlePathLayer.strokeColor = [UIColor redColor].CGColor;
    [progressView.layer addSublayer:circlePathLayer];
    progressView.backgroundColor = [UIColor whiteColor];
    [self setProgress:0];
    [self reSetSubview];
    

    
    progressView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [imageView addSubview:progressView];

}

-(void)reSetSubview{

    NSLog(@"%s",__PRETTY_FUNCTION__);
    CGFloat circlePathLayerRadius = 20.0f;
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(CGRectGetMidX(self.view.frame)-circlePathLayerRadius, CGRectGetMidY(self.view.frame)-circlePathLayerRadius,  2 *circlePathLayerRadius , 2 *circlePathLayerRadius)];
    circlePathLayer.path = path.CGPath;
    circlePathLayer.frame = self.view.frame;
}


- (CGFloat)getProgress{
    return circlePathLayer.strokeEnd;
}
- (void)setProgress:(CGFloat)newProgress
{
    if (newProgress > 1) {
        circlePathLayer.strokeEnd = 1;
    }
    else if (newProgress <0){
        circlePathLayer.strokeEnd = 0;
    }
    else{
        circlePathLayer.strokeEnd = newProgress;
    }
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setProgress:1];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];


    progressView.backgroundColor = [UIColor clearColor];
    [self setProgress:1];
    [circlePathLayer removeAnimationForKey:@"strokeEnd"];
    [circlePathLayer removeFromSuperlayer];

    imageView.layer.mask = circlePathLayer;
    [self reSetSubview];
    
    
//    let center = CGPoint(x: CGRectGetMidX(bounds), y: CGRectGetMidY(bounds))
//    let finalRadius = sqrt((center.x*center.x) + (center.y*center.y))
//    let radiusInset = finalRadius - circleRadius
//    let outerRect = CGRectInset(circleFrame(), -radiusInset, -radiusInset)
//    let toPath = UIBezierPath(ovalInRect: outerRect).CGPath
    CGPoint center = CGPointMake(CGRectGetMinX(self.view.frame), CGRectGetMinY(self.view.frame));
    CGFloat finalRadius = sqrt(center.x*center.x+center.y*center.y);
    CGFloat radiusInset = finalRadius - 20.f;

    CGRect outerRect = CGRectInset(circlePathLayer.frame, -radiusInset, -radiusInset);
    UIBezierPath *toPath = [UIBezierPath bezierPathWithOvalInRect:outerRect];
    
    
    CGPathRef fromPath = circlePathLayer.path;
    CGFloat fromLineWidth = circlePathLayer.lineWidth;
    [CATransaction begin];

//    [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
//    circlePathLayer.lineWidth = 2*finalRadius;
//    circlePathLayer.path = toPath.CGPath;
//    [CATransaction commit];
    
    CABasicAnimation *lineWidthAnimation = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
    lineWidthAnimation.fromValue = @(fromLineWidth);
    lineWidthAnimation.toValue = @(2*finalRadius);
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    pathAnimation.fromValue = (__bridge id)(circlePathLayer.path);
    pathAnimation.toValue = (__bridge id)(toPath.CGPath);
    CAAnimationGroup *groupAnimation = [[CAAnimationGroup alloc]init];
    groupAnimation.duration = 10;
//    groupAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    groupAnimation.animations = @[pathAnimation, lineWidthAnimation];
    groupAnimation.delegate = self;
    [circlePathLayer addAnimation:groupAnimation forKey:@"strokeWidth"];

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
