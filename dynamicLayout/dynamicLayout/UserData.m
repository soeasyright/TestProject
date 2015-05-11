//
//  UserData.m
//  dynamicLayout
//
//  Created by Viscovery on 2015/5/11.
//  Copyright (c) 2015年 watsons. All rights reserved.
//

#import "UserData.h"
#define decodeObject(_name_) self._name_ = [coder decodeObjectForKey:@#_name_]
#define encodeObject(_name_) [coder encodeObject:self._name_ forKey:@#_name_];
@implementation UserData

- (id) initWithCoder:(NSCoder *)coder{
    self = [super self];
    if (!self) {
        return self;
    }
    decodeObject(sid);
    decodeObject(name);
    decodeObject(phone);
    return self;
}

- (void) encodeWithCoder:(NSCoder *)coder
{
    encodeObject(sid);
    encodeObject(name);
    encodeObject(phone);
}
@end
