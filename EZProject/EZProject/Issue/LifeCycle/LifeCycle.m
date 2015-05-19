//
//  LifeCycle.m
//  EZProject
//
//  Created by soeasyright on 2015/5/14.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#import "LifeCycle.h"
#import "LifeCycleObject.h"
#import <objc/runtime.h>



@interface LifeCycle()

- (IBAction)createALL:(id)sender;
- (IBAction)releaseALL:(id)sender;
- (IBAction)releaseStrongObj:(id)sender;
- (IBAction)releaseStrongObj2:(id)sender;
- (IBAction)releaseWeakObj:(id)sender;
- (IBAction)runtimeObj:(id)sender;

#pragma mark issue 1
@property (nonatomic,strong) LifeCycleObject *strongObj;
@property (nonatomic,strong) LifeCycleObject *strongObj2;
@property (nonatomic,weak) LifeCycleObject *weakObj;

#pragma mark issue 2
@property (nonatomic,strong) LifeCycleObject *target;

@end

@implementation LifeCycle

//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Wgnu"
//    NSLog(@"%lu ",(unsigned long)[_strongObj retainCount]);
//#pragma clang diagnostic pop

@synthesize target;
static char key;//connect with unique address

- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)createALL:(id)sender {
    _strongObj = [[LifeCycleObject alloc] initWithName:@"strongObj"];
    _strongObj2 = _strongObj;
    _weakObj = _strongObj;
}

- (IBAction)releaseALL:(id)sender {
    _strongObj = nil;
    _strongObj2 = nil;
    _weakObj = nil;

}

- (IBAction)releaseStrongObj:(id)sender {
    _strongObj =nil;
    [self showStatus];
}

- (IBAction)releaseStrongObj2:(id)sender {
    _strongObj2 =nil;
    [self showStatus];
}

- (IBAction)releaseWeakObj:(id)sender {
    _weakObj =nil;
    [self showStatus];
}
- (void)showStatus{
    NSLog(@"_strongObj = %@ _strongObj2 = %@ _weakObj = %@", _strongObj!=nil? @"YES":@" NO", _strongObj2!=nil? @"YES":@" NO",_weakObj!=nil? @"YES":@" NO");
}
- (IBAction)runtimeObj:(id)sender {
#pragma mark - issue 2
    target=[[LifeCycleObject alloc] initWithName:@"target"];
    LifeCycleObject *assign=[[LifeCycleObject alloc] initWithName:@"assign"];
    LifeCycleObject *assignAgain=[[LifeCycleObject alloc] initWithName:@"assignAgain"];
    objc_setAssociatedObject(target, &key, assign, OBJC_ASSOCIATION_ASSIGN);
    objc_setAssociatedObject(target, &key, assignAgain, OBJC_ASSOCIATION_ASSIGN);
    
    LifeCycleObject *retainNonatomic=[[LifeCycleObject alloc] initWithName:@"retainNonatomic"];
    LifeCycleObject *retainNonatomicAgain=[[LifeCycleObject alloc] initWithName:@"retainNonatomicAgain"];
    objc_setAssociatedObject(target, &key, retainNonatomic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(target, &key, retainNonatomicAgain, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    LifeCycleObject *retainAtomic=[[LifeCycleObject alloc] initWithName:@"retainAtomic"];
    LifeCycleObject *retainAtomicAgain=[[LifeCycleObject alloc] initWithName:@"retainAtomicAgain"];
    objc_setAssociatedObject(target, &key, retainAtomic, OBJC_ASSOCIATION_RETAIN);
    objc_setAssociatedObject(target, &key, retainAtomicAgain, OBJC_ASSOCIATION_RETAIN);
    
    //    error
    //    LifeCycleObject *copyNonatomic=[[LifeCycleObject alloc] initWithName:@"copyNonatomic"];
    //    LifeCycleObject *copyNonatomicAgain=[[LifeCycleObject alloc] initWithName:@"copyNonatomicAgain"];
    //    objc_setAssociatedObject(target, &key, copyNonatomic, OBJC_ASSOCIATION_COPY_NONATOMIC);
    //    objc_setAssociatedObject(target, &key, copyNonatomicAgain, OBJC_ASSOCIATION_COPY_NONATOMIC);
    //    error
    //    LifeCycleObject *copyAtomic=[[LifeCycleObject alloc] initWithName:@"copyAtomic"];
    //    LifeCycleObject *copyAtomicAgain=[[LifeCycleObject alloc] initWithName:@"copyAtomicAgain"];
    //    objc_setAssociatedObject(target, &key, copyAtomic, OBJC_ASSOCIATION_COPY);
    //    objc_setAssociatedObject(target, &key, copyAtomicAgain, OBJC_ASSOCIATION_COPY);
}

@end
