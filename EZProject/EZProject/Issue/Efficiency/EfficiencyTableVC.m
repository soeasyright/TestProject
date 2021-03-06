//
//  Efficiency.m
//  EZProject
//
//  Created by soeasyright on 2015/5/14.
//  Copyright (c) 2015年 soeasyright. All rights reserved.
//

#import "EfficiencyTableVC.h"
#import "EZMacro.h"
#import "EZTestFunction.h"
#define LOOP_NUM 10000000
@interface EfficiencyTableVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,assign) NSUInteger nsui;
@property (atomic,assign) NSUInteger nsuiAtom;
@property (nonatomic,assign) NSNumber *numNonAtom;
@property (atomic,assign) NSNumber *numAtom;
@end

@implementation EfficiencyTableVC


typedef NS_ENUM(NSInteger,IssueNamePlusTable(Efficiency)){
    ForLoop,
    BaseTest,
    CallFuntion,
    IssueNamePlusTableMax(Efficiency)
};
EZTableCreate(Efficiency);
//for in (NSFastEnumeration)
//makeObjectsPerformSelector
//kvc集合运算符
//enumerateObjectsUsingBlock
//enumerateObjectsWithOptions(NSEnumerationConcurrent)
//dispatch_apply

+ (NSDictionary *)typeDisplayNames
{
    return @{
             @(ForLoop) : EZEnum2String(ForLoop),
             @(BaseTest) : EZEnum2String(BaseTest),
             @(CallFuntion) : EZEnum2String(CallFuntion),
             };
}

#pragma mark <UITableViewDelegate>
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    switch (indexPath.row) {
        case BaseTest:
        {
            _nsui = 0;
            double date_s = CFAbsoluteTimeGetCurrent();
            for (int i = 0; i < LOOP_NUM; i++) {
                _nsui = _nsui + 1;
            }
            NSLog(@"%f base Time", CFAbsoluteTimeGetCurrent() - date_s);
            _nsui = 0;
            date_s = CFAbsoluteTimeGetCurrent();
            for (int i = 0; i < LOOP_NUM; i++) {
                self.nsui = self.nsui + 1;
            }
            NSLog(@"%f Get & Set Time %lu", CFAbsoluteTimeGetCurrent() - date_s,(unsigned long)_nsui);
            
         
            
            _nsui = 0;
            date_s = CFAbsoluteTimeGetCurrent();
            for (int i = 0; i < LOOP_NUM; i++) {
                [self setValue:@(_nsui+1) forKey:@"nsui"];
            }
            NSLog(@"%f setValueByKey Time %lu", CFAbsoluteTimeGetCurrent() - date_s,(unsigned long)_nsui);
            _nsui = 0;
            date_s = CFAbsoluteTimeGetCurrent();
            for (int i = 0; i < LOOP_NUM; i++) {
                _nsui = [[self valueForKey:@"nsui"] longValue]+1;
            }
            NSLog(@"%f getValueByKey Time %lu", CFAbsoluteTimeGetCurrent() - date_s,(unsigned long)_nsui);

            _nsui = 0;
            date_s = CFAbsoluteTimeGetCurrent();
            for (int i = 0; i < LOOP_NUM; i++) {
                [self setValue:[NSNumber numberWithLong:[[self valueForKey:@"nsui"] longValue]+1] forKey:@"nsui"];
             }
            NSLog(@"%f Get&SetByKey Time %lu", CFAbsoluteTimeGetCurrent() - date_s,(unsigned long)_nsui);
            
            
            _nsuiAtom = 0;
            date_s = CFAbsoluteTimeGetCurrent();
            for (int i = 0; i < LOOP_NUM; i++) {
                _nsuiAtom = _nsuiAtom + 1;
            }
            NSLog(@"%f nsuiAtom Time", CFAbsoluteTimeGetCurrent() - date_s);
            _nsuiAtom = 0;
            date_s = CFAbsoluteTimeGetCurrent();
            for (int i = 0; i < LOOP_NUM; i++) {
                self.nsuiAtom = self.nsuiAtom + 1;
            }
            NSLog(@"%f nsuiAtom Get & Set Time", CFAbsoluteTimeGetCurrent() - date_s);
            
            _numNonAtom = @0;
            date_s = CFAbsoluteTimeGetCurrent();
            for (int i = 0; i < LOOP_NUM; i++) {
                _numNonAtom = @([_numNonAtom integerValue]+1);
            }
            NSLog(@"%f numNonAtom Time %@", CFAbsoluteTimeGetCurrent() - date_s,_numNonAtom);
            

            _numNonAtom = @0;
            date_s = CFAbsoluteTimeGetCurrent();
            for (int i = 0; i < LOOP_NUM; i++) {
                self.numNonAtom = @([_numNonAtom integerValue]+1);
            }
            NSLog(@"%f numNonAtom by set Time %@", CFAbsoluteTimeGetCurrent() - date_s,_numNonAtom);
            
            _numNonAtom = @0;
            date_s = CFAbsoluteTimeGetCurrent();
            for (int i = 0; i < LOOP_NUM; i++) {
                [self performSelector:@selector(setNumNonAtom:) withObject:@([_numNonAtom intValue]+1)];
            }
            NSLog(@"%f numNonAtom by selector Time %@", CFAbsoluteTimeGetCurrent() - date_s,_numNonAtom);
            

            _numNonAtom = @0;
            date_s = CFAbsoluteTimeGetCurrent();
            for (int i = 0; i < LOOP_NUM; i++) {
                self.numNonAtom = @([self.numNonAtom integerValue]+1);
            }
            NSLog(@"%f numNonAtom Get & Set Time", CFAbsoluteTimeGetCurrent() - date_s);
            
            _numAtom = @0;
            date_s = CFAbsoluteTimeGetCurrent();
            for (int i = 0; i < LOOP_NUM; i++) {
                _numAtom = @([_numAtom integerValue]+1);
            }
            NSLog(@"%f numAtom Time", CFAbsoluteTimeGetCurrent() - date_s);
            _numAtom = @0;
            date_s = CFAbsoluteTimeGetCurrent();
            for (int i = 0; i < LOOP_NUM; i++) {
                self.numAtom = @([self.numAtom integerValue]+1);
            }
            NSLog(@"%f numAtom Get & Set Time", CFAbsoluteTimeGetCurrent() - date_s);

            
        }
            break;
        case ForLoop:
        {
            
            NSMutableArray *test = [NSMutableArray array];
            for (int i= 0; i < LOOP_NUM; i++) {
                [test addObject:@(i)];
            }
            
            __block int sum = 0;
            NSUInteger count = test.count;
            double date_s = CFAbsoluteTimeGetCurrent();
            for (int i = 0;i < count; i++) {
                sum += 1;
            }
            NSLog(@"%f ForLoop Time", CFAbsoluteTimeGetCurrent() - date_s);
            
            sum = 0;
            date_s =  CFAbsoluteTimeGetCurrent();
            for (id obj in test) {
                sum += 1;
            }
            NSLog(@"%f For in Time", CFAbsoluteTimeGetCurrent() - date_s);
            
            sum = 0;
            date_s =  CFAbsoluteTimeGetCurrent();
            for (id obj in [test reverseObjectEnumerator]) {
                sum += 1;
            }
            NSLog(@"%f For in Time reverse", CFAbsoluteTimeGetCurrent() - date_s);
            
            sum = 0;
            date_s = CFAbsoluteTimeGetCurrent();
            [test enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                sum += 1;
            }];
            NSLog(@"%f EnumerateObjectsWithOptions Time", CFAbsoluteTimeGetCurrent() - date_s);
            
            sum = 0;
            date_s =  CFAbsoluteTimeGetCurrent();
            [test enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                sum += 1;
            }];
            NSLog(@"%f EnumerateObjectsWithOptions Time reverse", CFAbsoluteTimeGetCurrent() - date_s);

        }
            break;
        case CallFuntion:
        {
            NSUInteger j = 0;
            EZTestFunction *test = [[EZTestFunction alloc] init];
            double date_s = CFAbsoluteTimeGetCurrent();
            
            for (int i = 0; i < LOOP_NUM; i++) {
                j = [test testMethod];
            }
            NSLog(@"%f normal", CFAbsoluteTimeGetCurrent() - date_s);
            
            j = 0;
            date_s = CFAbsoluteTimeGetCurrent();
            for (int i = 0; i < LOOP_NUM; i++) {
                j = (NSUInteger)[test performSelector:@selector(testMethod)];
            }
            NSLog(@"%f performSelector ", CFAbsoluteTimeGetCurrent() - date_s);
            
            j = 0;
            date_s = CFAbsoluteTimeGetCurrent();
            SEL testMethod = @selector(testMethod);
            for (int i = 0; i < LOOP_NUM; i++) {
                j = (NSUInteger)[test performSelector:testMethod];
            }
            NSLog(@"%f performSelector V2 ", CFAbsoluteTimeGetCurrent() - date_s);
            
            
            j = 0;
            int (*func)(id,SEL) = (int (*)(id,SEL))[test methodForSelector:@selector(testMethod)];
            date_s = CFAbsoluteTimeGetCurrent();
            for (int i = 0; i < LOOP_NUM; i++) {
                j = (*func)(test,@selector(testMethod));
            }
            NSLog(@"%f function", CFAbsoluteTimeGetCurrent() - date_s);
            
            j = 0;
            IMP func2 =[test methodForSelector:@selector(testMethod)];
            date_s = CFAbsoluteTimeGetCurrent();
            for (int i = 0; i < LOOP_NUM; i++) {
                j = ((NSUInteger (*)(id, SEL))func2)(test,@selector(testMethod));
            }
            NSLog(@"%f IMP", CFAbsoluteTimeGetCurrent() - date_s);
            
            
            j = 0;
            
            date_s = CFAbsoluteTimeGetCurrent();
            for (int i = 0; i < LOOP_NUM; i++) {
                int (*func3)(id,SEL) = (int (*)(id,SEL))[test methodForSelector:@selector(testMethod)];
                j = (*func3)(test,@selector(testMethod));
            }
            NSLog(@"%f function3", CFAbsoluteTimeGetCurrent() - date_s);
            
            j = 0;
            date_s = CFAbsoluteTimeGetCurrent();
            for (int i = 0; i < LOOP_NUM; i++) {
                j++;

            }
            NSLog(@"%f ===", CFAbsoluteTimeGetCurrent() - date_s);


        }
            break;

        default:
            break;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}






@end
