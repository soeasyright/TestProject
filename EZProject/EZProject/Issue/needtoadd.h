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
//https://github.com/MatthewYork/iPhone-IntroductionTutorial
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


//objectiveC method and C function tansform
//objectiveC 的method在編譯時會轉譯成c的function
//一個Objective method 如下
//-(NSString*) addToString:(NSString *)data
//{
//    return [data stringByAppendingString:@"!"];
//}
//會被編譯成像這樣的c function
//NSString* addToString(id self,SEL _cmd,NSString* data)
//{
//    return [data stringByAppendingString:@"!"];
//}

//self表示要執行此function的實體，因此在Objective不需要打，因為就是self
//_cmd 用執行的function,對self而言就是method
//data則是要傳給此function的參數
//
//因此，如果要以c語言執行objective的method的化會像這樣
//------------------------------------------------------------------------------------
////呼叫StokeFunc func;
//typedef float(*StokeFunc) (id,SEL,NSString*,NSDate*);
//
//SEL selector=@selector(valueForStock:onDay:);
//StokeFunc myFucn=(StokeFunc) [self methodForSelector:selector];
//NSLog(@"Stoke Value:%f",myFucn(self,selector,@"ALU",[NSDate date]));
//------------------------------------------------------------------------------------
//
////另外要實作method
//-(float) valueForStock:(NSString *)stock onDay:(NSDate*)day
//{
//    //.......
//}
//
////----------------------------------------------
//NSStringFromSelector(SLE selector) //取得SEL指定的方法名稱
//method_getName(method) //回傳SEL，methoid (方法的指標)，取得SEL格式的指標
//method_getImplementation(method) //回IMP
////imp是一個指標具體指向一個method在runtime時的具體實作


#endif
