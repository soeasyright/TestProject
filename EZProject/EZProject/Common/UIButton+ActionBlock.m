//
//  UIButton+ActionBlock.m
//  EZProject
//
//  Created by soeasyright on 2015/5/14.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#import "UIButton+ActionBlock.h"
#import <objc/runtime.h>




@implementation UIControl(UIBlockActions)


static char ConnectionKey;
typedef void (^BlockAction)(id sender);

- (void) addControlEvent:(UIControlEvents) event
          withEventBlock:(BlockAction) block{
    //connect opject
    objc_setAssociatedObject(self, &ConnectionKey, block, OBJC_ASSOCIATION_ASSIGN);
    [self addTarget:self action:@selector(invokeBlock:) forControlEvents:event];
}

- (void)invokeBlock:(id)sender {
    BlockAction block=objc_getAssociatedObject(self, &ConnectionKey);
    if (block) {
        block(sender);
    }
}

@end
