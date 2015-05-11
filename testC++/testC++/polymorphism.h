//
//  polymorphism.h
//  testC++
//
//  Created by Viscovery on 2015/5/11.
//  Copyright (c) 2015年 watsons. All rights reserved.
//

#ifndef __testC____polymorphism__
#define __testC____polymorphism__

#include <stdio.h>
class A;

class B;

class A{
public:
    void methodC(A const &a){cout << "Class A -> A"<<endl;};
    void methodC(B const &a){cout << "Class A -> B"<<endl;};
};

class B:public A{
public:
    void methodC(A const &a){cout << "Class B -> A"<<endl;};
    void methodC(B const &a){cout << "Class B -> B"<<endl;};
};
#endif /* defined(__testC____polymorphism__) */
