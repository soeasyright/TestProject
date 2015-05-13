//
//  UIButton+ActionBlock.m
//  PractiveProject
//
//  Created by Viscovery on 2015/5/13.
//  Copyright (c) 2015年 watsons. All rights reserved.
//

#import "UIButton+ActionBlock.h"
#import <objc/runtime.h>




@implementation UIControl


static char ConnectionKey;

- (void)addControlEvent:(UIControlEvents)event withEventBlock:(void (^)(void))block{
    NSString *methodName = @"";
    NSMutableDictionary *opreations = (NSMutableDictionary*)objc_getAssociatedObject(self, &OperationKey);
    if(opreations == nil)
    {
        opreations = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, &ConnectionKey, opreations, OBJC_ASSOCIATION_RETAIN);
    }
    [opreations setObject:block forKey:methodName];
    [self addTarget:self action:NSSelectorFromString(methodName) forControlEvents:events];

}

- (void)action:(){
    
}
//- (void)handleControlEvent:(UIControlEvents)event withBlock:(void(^)(id sender))block {
//    NSString *methodName = [UIControl eventName:event];
//    NSMutableDictionary *opreations = (NSMutableDictionary*)objc_getAssociatedObject(self, &OperationKey);
//    if(opreations == nil)
//    {
//        opreations = [[NSMutableDictionary alloc] init];
//        objc_setAssociatedObject(self, &OperationKey, opreations, OBJC_ASSOCIATION_RETAIN);
//    }
//    [opreations setObject:block forKey:methodName];
//    [self addTarget:self action:NSSelectorFromString(methodName) forControlEvents:event];
//}
@end
