//
//  needtoadd.h
//  EZProject
//
//  Created by soeasyright on 2015/5/18.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#ifndef EZProject_needtoadd_h
#define EZProject_needtoadd_h


//intriduce page
// https://github.com/MatthewYork/iPhone-IntroductionTutorial
//https://github.com/ealeksandrov/EAIntroView
//https://github.com/GnosisHub/GHWalkThrough
//https://github.com/icepat/ICETutorial
//https://github.com/Appsido/AOTutorial

//layoutSubviews在以下情况下会被调用：
//
//1、init初始化不会触发layoutSubviews
//2、addSubview会触发layoutSubviews
//3、设置view的Frame会触发layoutSubviews，当然前提是frame的值设置前后发生了变化
//4、滚动一个UIScrollView会触发layoutSubviews
//5、旋转Screen会触发父UIView上的layoutSubviews事件
//6、改变一个UIView大小的时候也会触发父UIView上的layoutSubviews事件

//keyboard
//NSDictionary *info = [notification userInfo];
//CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
//NSLog(@"%f",kbSize.height); // 鍵盤高度
//keyboardWillChange DidChange


//status Bar
//http://stackoverflow.com/questions/22927047/ios-status-bar-touch-to-return-to-app

//藍芽  BLE 控制的函數庫
//https://www.facebook.com/groups/iostw/permalink/1053831467977535/
//https://www.facebook.com/groups/iostw/permalink/1052026604824688/

//applewatchkit
//https://www.facebook.com/groups/iostw/permalink/1053609947999687/

//https://www.facebook.com/groups/iostw/permalink/1043222699038412/
//QRcode
//https://www.facebook.com/groups/iostw/permalink/1052230571470958/

//collectionView
//https://www.facebook.com/groups/iostw/permalink/1052158088144873/

//ReactiveCocoa
//https://www.facebook.com/groups/iostw/permalink/1051912831502732/

//請問下在2個Navigation 第二個 Navigation Top Bar 會看不見，請問在storyboard 要如何排列？如附件
//https://www.facebook.com/groups/iostw/1048262758534406/

//autolayout with Tabke view cell
//http://www.raywenderlich.com/73602/dynamic-table-view-cell-height-auto-layout

//consolelog colorful
//https://github.com/xareelee/XLTestLog

//app admob vpon 廣告
//https://www.facebook.com/groups/iostw/permalink/1036136239747058/

//plugins
//https://www.facebook.com/groups/iostw/permalink/1032129846814364/
#endif
