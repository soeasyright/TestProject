//
//  Header.h
//  testC++
//
//  Created by Viscovery on 2015/5/11.
//  Copyright (c) 2015年 watsons. All rights reserved.
//

#ifndef testC___Header_h
#define testC___Header_h

#include <iostream>

using namespace std;

class Event
{
public:
    virtual void PrintName()
    {
        cout<<"我是通用事件"<<endl;
    }

    
};

class KeyEvent:public Event
{
public:
    virtual void PrintName()
    {
        cout<<"我是按键事件"<<endl;
    }
};

class ClickEvent:public Event
{
public:
    virtual void PrintName()
    {
        cout<<"我是单击事件"<<endl;
    }
};
class EventRecorder
{
public:
    virtual void RecordEvent(Event* event)
    {
        cout<<"使用EventRecorder记录通用事件"<< endl;
    }
    
    virtual void RecordEvent(KeyEvent* event)
    {
        cout<<"使用EventRecorder记录按键事件"<< endl;
    }
    
    virtual void RecordEvent(ClickEvent* event)
    {
        cout<<"使用EventRecorder记录单击事件"<< endl;
    }
};

class AdvanceEventRecorder:public EventRecorder
{
public:
    virtual void RecordEvent(Event* event)
    {
        cout<<"使用高级EventRecorder记录通用事件"<< endl;
    }
    
    virtual void RecordEvent(KeyEvent* event)
    {
        cout<<"使用高级EventRecorder记录按键事件"<< endl;
    }
    
    virtual void RecordEvent(ClickEvent* event)
    {
        cout<<"使用高级EventRecorder记录单击事件"<< endl;
    }

};



#endif
