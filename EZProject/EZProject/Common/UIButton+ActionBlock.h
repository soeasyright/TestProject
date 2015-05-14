//
//  UIButton+ActionBlock.h
//  EZProject
//
//  Created by soeasyright on 2015/5/14.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIControl (UIBlockActions)

- (void) addControlEvent:(UIControlEvents) event
                   withEventBlock:(void (^)(id sender)) block;

@end
