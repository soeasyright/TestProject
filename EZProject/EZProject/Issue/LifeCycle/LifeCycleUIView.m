//
//  LifeCycleUIView.m
//  EZProject
//
//  Created by Viscovery on 2015/5/24.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#import "LifeCycleUIView.h"

@implementation LifeCycleUIView

-(void)awakeFromNib{
    [super awakeFromNib];
    NSLog(@"%s",__PRETTY_FUNCTION__);
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
     NSLog(@"%s",__PRETTY_FUNCTION__);
    // Drawing code
}


@end
