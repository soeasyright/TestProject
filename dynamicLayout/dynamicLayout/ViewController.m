//
//  ViewController.m
//  dynamicLayout
//
//  Created by Viscovery on 2015/5/8.
//  Copyright (c) 2015年 watsons. All rights reserved.
//

#import "ViewController.h"
#import <CoreImage/CoreImage.h>

#import <objc/runtime.h>

static const char _bundle=0;
@interface BundleEx : NSBundle
@end

@implementation BundleEx
-(NSString*)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName
{
    NSBundle* bundle=objc_getAssociatedObject(self, &_bundle);
    return bundle ? [bundle localizedStringForKey:key value:value table:tableName] : [super localizedStringForKey:key value:value table:tableName];
}
@end
@implementation NSBundle (Language)
+(void)setLanguage:(NSString*)language
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
                  {
                      object_setClass([NSBundle mainBundle],[BundleEx class]);
                  });
    objc_setAssociatedObject([NSBundle mainBundle], &_bundle, language ? [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:language ofType:@"lproj"]] : nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end

@interface ViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextView *text;
@property (weak, nonatomic) IBOutlet UIImageView *back;
@property (weak, nonatomic) IBOutlet UIImageView *front;
- (IBAction)action:(id)sender;
- (IBAction)onSliderChaged:(UISlider *)sender;


- (IBAction)changeColor:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", NSStringFromClass([self.back class]));
    NSLog(@"%@", NSStringFromClass([[self.back class] superclass]));
    NSLog(@"%@", NSStringFromClass([[[self.back class] superclass] superclass]));
    NSLog(@"%@", NSStringFromClass([[[[self.back class] superclass] superclass] superclass]));
    NSLog(@"////////////");
    NSLog(@"%@", [self.front isKindOfClass:[UIImageView class]] ? @"YES" : @"NO");
    NSLog(@"%@", [self.front isKindOfClass:[UIView class]] ? @"YES" : @"NO");
    NSLog(@"%@", [self.front isKindOfClass:[UIResponder class]] ? @"YES" : @"NO");
    NSLog(@"%@", [self.front isKindOfClass:[NSObject class]] ? @"YES" : @"NO");
    NSLog(@"////////////");
    NSLog(@"%@", [self.back isMemberOfClass:[UIImageView class]] ? @"YES" : @"NO");
    NSLog(@"%@", [self.back isMemberOfClass:[UIView class]] ? @"YES" : @"NO");
    NSLog(@"%@", [self.back isMemberOfClass:[UIResponder class]] ? @"YES" : @"NO");
    NSLog(@"%@", [self.back isMemberOfClass:[NSObject class]] ? @"YES" : @"NO");

    for (UIImageView *view in [super.view subviews]) {
        if (view.tag == 10) {
            [view setBackgroundColor:[UIColor orangeColor]];
            [view setAlpha:0.3];
        }
        
        if (view.tag == 20) {
            [view setBackgroundColor:[UIColor brownColor]];
            [view setAlpha:0.3];
        }
    }

    
    for ( id object in [self.view subviews]) {
        if ([object isKindOfClass:[UIImageView class]]) {
            NSLog(@"%@",NSStringFromClass([object class]));
        }
    }
    [NSBundle setLanguage:@"en"];
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults]  objectForKey:@"lproj"]);
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults]  objectForKey:@"AppleLanguages"]);
//     NSString *path = [[ NSBundle mainBundle ] pathForResource:@"en" ofType:@"lproj" ];
//    [NSBundle bundleWithPath:path];
//    [[NSUserDefaults standardUserDefaults] setObject:[NSArray arrayWithObjects:@"en", nil] forKey:@"AppleLanguages"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//    NSLocalizedString();
//    [[NSUserDefaults standardUserDefaults] setObject:[NSArray arrayWithObjects:langCode, nil] forKey:@"AppleLanguages"];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(echoNotification:) name:@"showSomething" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(myNotification:) name:nil object:nil];


}
-(void)myNotification:(NSNotification*) notification {
    NSLog(@"收到由 %@ 傳來的通知 %@",([[notification object] class]), [notification name]);
}
- (void)echoNotification:(NSNotification *)notification {
    
    //取得由NSNotificationCenter送來的訊息
    NSArray *anyArray = [notification object];
    
    NSLog(@"%@", [anyArray componentsJoinedByString:@"\n"]);
}

- (void)textViewDidChange:(UITextView *)textView
{

    
    CGFloat fixedWidth = textView.frame.size.width;
    CGSize newSize = [textView sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    CGRect newFrame = textView.frame;
    newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
    textView.frame = newFrame;

}
- (BOOL)prefersStatusBarHidden
{
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    self.text.text=[self.text.text stringByAppendingString:textField.text];
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)action:(id)sender {
    CGPoint hpOrbPoint = self.front.frame.origin;
    CGSize hpOrbSize = self.front.frame.size;
    
    if (hpOrbSize.height > 50) {
        
        //動畫設定
        [UIView beginAnimations:@"FirstAid" context:nil];
        [UIView setAnimationDuration:0.6];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(showHpLabel)];
        [UIView setAnimationBeginsFromCurrentState:YES];
        
        //每次減少50個單位（frame縮小50單位）
        [self.front setFrame:CGRectMake(hpOrbPoint.x, hpOrbPoint.y + 50, hpOrbSize.width, hpOrbSize.height - 50)];
        
        //開始動畫
        [UIView commitAnimations];
    }
    NSArray *anyArray=[[NSArray alloc]init];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"showSomething" object:anyArray];
}

- (IBAction)onSliderChaged:(UISlider *)sender {
    NSInteger angle = [sender value];
    
    //角度與徑度之間的轉換
    CGFloat radian = angle * (M_PI / 180);
    
    //自定的方法函式改變影像的Hue數值
    [self imagEffectWithHue:radian];

}

- (IBAction)changeColor:(id)sender {
    UIImage *iconImage = [UIImage imageNamed:@"orb_filling.png"];
    
    UIGraphicsBeginImageContext(iconImage.size);
    
    //設定參考範圍
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(context, 1, -1);
    
    CGRect region = CGRectMake(0, 0, iconImage.size.width, iconImage.size.height);
    CGContextTranslateCTM(context, 0, -region.size.height);
    CGContextSaveGState(context);
    
    //可以有保留透明背景的效果
    CGContextClipToMask(context, region, iconImage.CGImage);
    
    //設定純色遮罩顏色
    [[UIColor colorWithRed:0.1 green:1.0 blue:0.1 alpha:1.0] set];
    
    //將顏色與原影像混和
    CGContextFillRect(context, region);
    CGContextRestoreGState(context);
    CGContextSetBlendMode(context, kCGBlendModeMultiply);
    CGContextDrawImage(context, region, iconImage.CGImage);
    
    //將UIImage影像指定給UIImageView
     self.front.image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();

}
- (void)imagEffectWithHue:(CGFloat)h {
    
    //製作CoreImage的CIImage存放待處理的影像資料
    CIImage *coreImage = [[CIImage alloc] initWithImage:[UIImage imageNamed:@"orb_filling.png"]];
    
    //製作CoreImage的CIFilter定義使用的影像濾鏡
    CIFilter *hueFilter = [CIFilter filterWithName:@"CIHueAdjust"];
    
    //將濾鏡套用至影像上
    [hueFilter setValue:coreImage forKey:kCIInputImageKey];
    [hueFilter setValue:[NSNumber numberWithFloat:h] forKey:@"inputAngle"];
    
    //取得處理結果並且將CIImage轉換成UIImage
    coreImage = [hueFilter outputImage];
    CIContext *context = [CIContext contextWithOptions:nil];
    self.front.image = [UIImage imageWithCGImage:[context createCGImage:coreImage fromRect:coreImage.extent]];
}

- (void)showHpLabel {
    
    //計算百分比
//    double p = (hpOrb.frame.size.height / 256.0) * 100;
//    [hpLabel setText:[NSString stringWithFormat:@"%.f%%", p]];
}

@end
