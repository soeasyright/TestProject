//
//  GradientProgressView.m
//  EZProject
//
//  Created by Viscovery on 2015/5/30.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#import "GradientProgressView.h"

@implementation GradientProgressView
//override UIView backgroundlayer
+ (Class)layerClass {
    return [CAGradientLayer class];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        CAGradientLayer *layer = (CAGradientLayer *)[self layer];
        //gradient vector
        [layer setStartPoint:CGPointMake(0.0, 0.5)];
        [layer setEndPoint:CGPointMake(1.0, 0.5)];

        NSMutableArray *colors = [NSMutableArray array];
        //colorful~
        for (NSInteger deg = 0; deg <= 360; deg += 5) {
            
            UIColor *color= [UIColor colorWithHue:1.0  * deg / 360.0
                                       saturation:1.0
                                       brightness:1.0
                                            alpha:1.0 //*deg / 360.0
                             ];
            [colors addObject:(id)[color CGColor]];
        }
        [layer setColors:[NSArray arrayWithArray:colors]];
        //Gradinet alpha
//        UIColor *lightColor = [UIColor clearColor];
//        UIColor *middleColor = [UIColor colorWithWhite:0 alpha:0.35];
//        UIColor *anotherColor = [UIColor colorWithWhite:0 alpha:0.65];
//        UIColor *darkColor = [UIColor colorWithWhite:0 alpha:0.8];
//        layer.colors = @[(id)lightColor.CGColor, (id)middleColor.CGColor, (id)anotherColor.CGColor, (id)darkColor.CGColor];
//        layer.locations = @[@(0), @(0.2), @(0.65), @(1)];
        
        [self performAnimation];
    }
    return self;
}

- (NSArray *) shiftColors:(NSArray *) colors{
    NSMutableArray *muteble = [colors mutableCopy];
    [muteble insertObject:[muteble lastObject] atIndex:0];
    [muteble removeLastObject];
    return [NSArray arrayWithArray:muteble];
}

- (void)performAnimation {
    CAGradientLayer *layer = (CAGradientLayer *)[self layer];
    NSArray *formColors = [layer colors];
    NSArray *toColors = [self shiftColors:formColors];
    [layer setColors:toColors];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"colors"];
    animation.fromValue = formColors;
    animation.toValue = toColors;
    animation.duration = 0.08;
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeBackwards;
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    [animation setDelegate:self];
    
    [layer addAnimation:animation forKey:@"animateGradient"];
}


- (void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self performAnimation];
}

@end
