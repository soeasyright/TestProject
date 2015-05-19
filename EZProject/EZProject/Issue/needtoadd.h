//
//  needtoadd.h
//  EZProject
//
//  Created by soeasyright on 2015/5/18.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#ifndef EZProject_needtoadd_h
#define EZProject_needtoadd_h

//layoutSubviews在以下情况下会被调用：
//
//1、init初始化不会触发layoutSubviews
//2、addSubview会触发layoutSubviews
//3、设置view的Frame会触发layoutSubviews，当然前提是frame的值设置前后发生了变化
//4、滚动一个UIScrollView会触发layoutSubviews
//5、旋转Screen会触发父UIView上的layoutSubviews事件
//6、改变一个UIView大小的时候也会触发父UIView上的layoutSubviews事件
#endif
