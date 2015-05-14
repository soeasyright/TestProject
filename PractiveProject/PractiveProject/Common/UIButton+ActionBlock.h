//
//  UIButton+ActionBlock.h
//  PractiveProject
//
//  Created by Viscovery on 2015/5/13.
//  Copyright (c) 2015年 watsons. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIControl (UIBlockActions)

- (void) addControlEvent:(UIControlEvents) event
                   withEventBlock:(void (^)(id sender)) block;

@end
