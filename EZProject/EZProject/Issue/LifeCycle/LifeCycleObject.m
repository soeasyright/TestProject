//
//  LifeCycleObject.m
//  EZProject
//
//  Created by soeasyright on 2015/5/14.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#import "LifeCycleObject.h"
#import <objc/runtime.h>

@interface LifeCycleObject()
@property (readonly, nonatomic, copy) NSString *objectName;
@end

@implementation LifeCycleObject
- (instancetype)initWithName:(NSString *) name{
    self = [super init];
    if (!self) {
        return self;
    }
    _objectName=name;
    NSLog(@"create %@",_objectName);
    return self;
}
- (void)dealloc{
    NSLog(@"dealloc %@",_objectName);
    
}
@end
