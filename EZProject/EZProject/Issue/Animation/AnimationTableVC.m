//
//  AnimationTableVC.m
//  EZProject
//
//  Created by soeasyright on 2015/5/26.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#import "AnimationTableVC.h"
#import "EZMacro.h"
#import "CircularLoaderVC.h"
@interface AnimationTableVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIDynamicAnimator *animator;
@property (nonatomic,strong) UIImageView *imageView;
@end

@implementation AnimationTableVC

@synthesize imageView;
typedef NS_ENUM(NSInteger,IssueNamePlusTable(AnimationTableVC)){
    SnapBehavior,
    FlipViewV,
    FlipViewH,
    RotateView,
    RotateViewAndFlipViewV,
    CircularLoader,
    IssueNamePlusTableMax(AnimationTableVC)
};
EZTableCreate(AnimationTableVC);

+ (NSDictionary *)typeDisplayNames
{
    return @{
             @(SnapBehavior) : EZEnum2String(SnapBehavior),
             @(FlipViewV) : EZEnum2String(FlipViewV),
             @(FlipViewH) : EZEnum2String(FlipViewH),
             @(RotateView) : EZEnum2String(RotateView),
             @(RotateViewAndFlipViewV) : EZEnum2String(RotateViewAndFlipViewV),
             @(CircularLoader) : EZEnum2String(CircularLoader),
             };
}

#pragma mark <UITableViewDelegate>
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case SnapBehavior:
        {
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSanpGesture:)];
            [self.view addGestureRecognizer:tap];
        }
            break;
        case FlipViewV:
        {
            CGAffineTransform viewFlipTrans = CGAffineTransformMakeScale(1, -1);
            imageView.transform = CGAffineTransformConcat(imageView.transform, viewFlipTrans);
        }
            break;
        case FlipViewH:
        {
            CGAffineTransform viewFlipTrans = CGAffineTransformMakeScale(-1, 1);
            imageView.transform = CGAffineTransformConcat(imageView.transform, viewFlipTrans);
        }
            break;
        case RotateView:
        {
            CGAffineTransform viewFlipTrans = CGAffineTransformMakeRotation(M_PI/4);
            imageView.transform = CGAffineTransformConcat(imageView.transform, viewFlipTrans);
        }
            break;
        case RotateViewAndFlipViewV:
        {
            CGAffineTransform viewFlipTrans = CGAffineTransformMakeRotation(M_PI/4);
            viewFlipTrans = CGAffineTransformConcat(viewFlipTrans, CGAffineTransformMakeScale(1, -1));
            imageView.transform = CGAffineTransformConcat(imageView.transform, viewFlipTrans);
        }
            break;
        case CircularLoader:
        {
            CircularLoaderVC *vc = [[CircularLoaderVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
    
}



- (void) handleSanpGesture:(UITapGestureRecognizer *)gesture {
    CGPoint point = [gesture locationInView:self.view];
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UISnapBehavior * snapBehavior = [[UISnapBehavior alloc] initWithItem:imageView snapToPoint:point];
    snapBehavior.damping = 0.4;
    [self.animator addBehavior:snapBehavior];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 50.0, 50.0)];
    imageView.image = [UIImage imageNamed:@"Download"];
    imageView.center = self.view.center;
    [self.view addSubview:imageView];
}
@end
