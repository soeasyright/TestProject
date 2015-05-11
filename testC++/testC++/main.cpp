//
//  main.cpp
//  testC++
//
//  Created by Viscovery on 2015/5/11.
//  Copyright (c) 2015年 watsons. All rights reserved.
//

#include <iostream>
#include "Header.h"
#include "polymorphism.h"
#include "polymorphism_2.h"
int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";

    
    //
    A a;
    B b;
    
    a.methodC(a); // Invoke A::methodC(A const&)
    a.methodC(b); // Invoke A::methodC(B const&)
    b.methodC(a); // Invoke B::methodC(A const&)
    b.methodC(b); // Invoke B::methodC(B const&)
    
    
    A &aa = a;
    A &ba = b;
    printf("/////\n");
    aa.methodC(aa); // Invoke A::interact(A const&)
    aa.methodC(ba); // Invoke A::interact(A const&)
    ba.methodC(aa); // Invoke A::interact(A const&)
    ba.methodC(ba); // Invoke A::interact(A const&)
    
    //
    A2 a2;
    B2 b2;
    
    
    A2 &aa2 = a2;
    A2 &ba2 = b2;
    printf("/////\n");
    aa2.methodC(aa2); // Invoke A::methodC(A const&)
    aa2.methodC(ba2); // Invoke A::methodC(A const&)
    ba2.methodC(aa2); // Invoke B::methodC(A const&)
    ba2.methodC(ba2); // Invoke B::methodC(A const&)
    //
    
    printf("/////\n");
    aa2.apply(aa2);  //A2.apply -> A2.methoc(this(A2))
    ba2.apply(aa2);  //B2.apply -> A2.methoc(this(B2))
    aa2.apply(ba2);  //A2.apply -> B2.methoc(this(A2))
    ba2.apply(ba2);  //B2.apply -> B2.methoc(this(B2))
    
    
//public:
//    virtual void methodC(A2 const &a){cout << "Class A2 -> A2"<<endl;};
//    virtual void methodC(B2 const &a){cout << "Class A2 -> B2"<<endl;};
//    
//    virtual void apply(A2 &obj) { obj.methodC(*this); }
//};
//
//class B2:public A2{
//public:
//    virtual void methodC(A2 const &a){cout << "Class B2 -> A2"<<endl;};
//    virtual void methodC(B2 const &a){cout << "Class B2 -> B2"<<endl;};
//    
//    virtual void apply(A2 &obj) { obj.methodC(*this); }
    return 0;
}
