//
//  GCHTimerManger.h
//  TimerCellDemo
//
//  Created by Yuanhai on 10/12/18.
//  Copyright © 2018年 Yuanhai. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * TIMER_NOTIFICATION = @"TIMER_NOTIFICATION";

@interface GCHTimerManger : NSObject

/**
 结束定时器
 */
- (void)stopTimer;

/**
 开始定时器
 */
- (void)startTimerWithTimeInterVal:(NSTimeInterval)timeInterVal;

/**
 单利
 */
+ (instancetype)shareTimer;

@end
