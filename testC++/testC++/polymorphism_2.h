//
//  polymorphism_2.h
//  testC++
//
//  Created by Viscovery on 2015/5/11.
//  Copyright (c) 2015年 watsons. All rights reserved.
//

#ifndef testC___polymorphism_2_h
#define testC___polymorphism_2_h

class A2;

class B2;

class A2{
public:
   virtual void methodC(A2 const &a){cout << "Class A2 -> A2"<<endl;};
   virtual void methodC(B2 const &a){cout << "Class A2 -> B2"<<endl;};
    
   virtual void apply(A2 &obj) { obj.methodC(*this); }
};

class B2:public A2{
public:
   virtual void methodC(A2 const &a){cout << "Class B2 -> A2"<<endl;};
   virtual void methodC(B2 const &a){cout << "Class B2 -> B2"<<endl;};
    
   virtual void apply(A2 &obj) { obj.methodC(*this); }
};

#endif
