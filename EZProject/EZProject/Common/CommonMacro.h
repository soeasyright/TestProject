//
//  CommonMacro.h
//  EZProject
//
//  Created by Viscovery on 2015/5/24.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#ifndef EZProject_CommonMacro_h
#define EZProject_CommonMacro_h

//是否iPad
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//是否Retina
#define isRetina ( [[UIScreen mainScreen] scale] == 2)

//block
#define BlockInBackground(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define BlockInMainthread(block) dispatch_async(dispatch_get_main_queue(),block)

//singleton
#define DeclareSingleton(className) \
+ (classname *)shared##classname

#define ImplementSingleton(className) \
+ (classname *)shared##classname { \
static dispatch_once_t onceToken = 0; \
static id sharedInstance = nil; \
dispatch_once(&onceToken, ^{ \
sharedInstance = [[self alloc] init]; \
}); \
return sharedInstance; \
}

#endif
