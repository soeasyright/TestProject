//
//  ViewController.m
//  testPod
//
//  Created by Viscovery on 2015/5/5.
//  Copyright (c) 2015年 watsons. All rights reserved.
//

#import "ViewController.h"
#import "YTPlayerView.h"
#import "AppDelegate.h"
@interface ViewController ()<YTPlayerViewDelegate>

@property(nonatomic, strong) IBOutlet YTPlayerView *playerView;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.playerView.delegate = self;

//    [self.playerView loadWithVideoId:@"M7lc1UVf-VE"];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    static BOOL isfrist=YES;
    if (isfrist) {
        NSDictionary *playerVars = @{
                                     @"playsinline" : @0,
                                     @"autoplay" : @1,
                                     @"fs" : @0
                                     };
        [self.playerView loadWithVideoId:@"M7lc1UVf-VE" playerVars:playerVars];
        
        UIDevice *device = [UIDevice currentDevice];
        
        //Tell it to start monitoring the accelerometer for orientation
        [device beginGeneratingDeviceOrientationNotifications];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification object:device];

        isfrist=NO;
    }

}

- (void)orientationChanged:(NSNotification*)notification
{
    UIDevice *device = [UIDevice currentDevice];
//    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIDeviceOrientationLandscapeLeft] forKey:@"orientation"];
//
//    if(device.orientation == UIDeviceOrientationLandscapeLeft || device.orientation == UIDeviceOrientationLandscapeRight)
//    {
//        CGSize screenRect =[[UIScreen mainScreen] bounds].size ;
//
//        self.playerView.frame = CGRectMake(0, 0, screenRect.height, screenRect.width);
//    }
//    else if(device.orientation == UIDeviceOrientationPortrait)
//    {
////        self.frame = _prevFrame;
//    }
//    else if (device.orientation == UIDeviceOrientationPortraitUpsideDown)
//    {
//
//    }
}
- (void)playerView:(YTPlayerView *)playerView didChangeToState:(YTPlayerState)state {
    switch (state) {
        case kYTPlayerStatePlaying:
            NSLog(@"kYTPlayerStatePlaying playback");
            break;
        case kYTPlayerStatePaused:
            NSLog(@"kYTPlayerStatePaused playback");
            CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI/2);
            [self.playerView.webView setTransform:transform];
            break;
        case kYTPlayerStateBuffering:
            NSLog(@"kYTPlayerStateBuffering playback");
            break;
        case kYTPlayerStateEnded:
            NSLog(@"kYTPlayerStateEnded playback");
            break;
        case kYTPlayerStateQueued:
            NSLog(@"kYTPlayerStateQueued playback");
            break;
        default:
            break;
    }
}
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    
    return UIInterfaceOrientationLandscapeLeft;
    
}
//- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window{
//    if(self.videoIsInFullscreen == YES) {
//        return UIInterfaceOrientationMaskAllButUpsideDown;
//    }
//    else {
//        return UIInterfaceOrientationMaskPortrait;
//    }
//}
-(void)playerViewDidBecomeReady:(YTPlayerView *)playerView{
    [self.playerView playVideo];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
