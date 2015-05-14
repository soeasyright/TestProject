//
//  LifeCycle.m
//  PractiveProject
//
//  Created by Viscovery on 2015/5/14.
//  Copyright (c) 2015年 watsons. All rights reserved.
//

#import "LifeCycle.h"
#import "LifeCycleObject.h"
#import <objc/runtime.h>

@interface LifeCycle()
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
#pragma mark - issue 1
    _strongObj = [[LifeCycleObject alloc] initWithName:@"strongObj"];
    _strongObj2 = _strongObj;
    _weakObj = _strongObj;

    NSLog(@"**** release strong2->weak->strong ****");
    NSLog(@"ready release <strongObj2>");
    _strongObj2 =nil;
    NSLog(@"//_strongObj2 = %@ _weakObj = %@//", _strongObj2==nil? @"YES":@" NO",_weakObj==nil? @"YES":@" NO");
    
    NSLog(@"ready release <weakObj>");
    _weakObj =nil;
    NSLog(@"//_strongObj2 = %@ _weakObj = %@//", _strongObj2==nil? @"YES":@" NO",_weakObj==nil? @"YES":@" NO");

    NSLog(@"ready release <strongObj>");
    _strongObj =nil;
    NSLog(@"//_strongObj2 = %@ _weakObj = %@//", _strongObj2==nil? @"YES":@" NO",_weakObj==nil? @"YES":@" NO");
    
    _strongObj = [[LifeCycleObject alloc] initWithName:@"strongObj"];
    _strongObj2 = _strongObj;
    _weakObj = _strongObj;
    
    
    NSLog(@"**** release strong->strong2->weak ****");
    NSLog(@"ready release <strongObj>");
    _strongObj =nil;
    NSLog(@"//_strongObj2 = %@ _weakObj = %@//", _strongObj2==nil? @"YES":@" NO",_weakObj==nil? @"YES":@" NO");
    
    NSLog(@"ready release <strongObj2>");
    _strongObj2 =nil;
    NSLog(@"//_strongObj2 = %@ _weakObj = %@//", _strongObj2==nil? @"YES":@" NO",_weakObj==nil? @"YES":@" NO");
    
    NSLog(@"ready release <weakObj>");
    _weakObj =nil;
    NSLog(@"//_strongObj2 = %@ _weakObj = %@//", _strongObj2==nil? @"YES":@" NO",_weakObj==nil? @"YES":@" NO");
    
    _strongObj = [[LifeCycleObject alloc] initWithName:@"strongObj"];
    _strongObj2 = _strongObj;
    _weakObj = _strongObj;
    
    NSLog(@"**** release weak->strong->strong2 ****");
    NSLog(@"ready release <weakObj>");
    _weakObj =nil;
    NSLog(@"//_strongObj2 = %@ _weakObj = %@//", _strongObj2==nil? @"YES":@" NO",_weakObj==nil? @"YES":@" NO");

    NSLog(@"ready release <strongObj>");
    _strongObj =nil;
    NSLog(@"//_strongObj2 = %@ _weakObj = %@//", _strongObj2==nil? @"YES":@" NO",_weakObj==nil? @"YES":@" NO");

    NSLog(@"ready release <strongObj2>");
    _strongObj2 =nil;
    NSLog(@"//_strongObj2 = %@ _weakObj = %@//", _strongObj2==nil? @"YES":@" NO",_weakObj==nil? @"YES":@" NO");

    

    
    
    
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
- (void)viewDidAppear:(BOOL)animated{
    
    
}
@end
