//
//  UserData.h
//  dynamicLayout
//
//  Created by Viscovery on 2015/5/11.
//  Copyright (c) 2015年 watsons. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserData : NSObject<NSCoding>
@property (nonatomic,strong) NSString* sid;
@property (nonatomic,strong) NSString* name;
@property (nonatomic,strong) NSString* phone;

- (id) initWithCoder:(NSCoder *)coder;
- (void) encodeWithCoder:(NSCoder *)coder;

@end