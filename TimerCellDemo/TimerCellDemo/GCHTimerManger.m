//
//  GCHTimerManger.m
//  TimerCellDemo
//
//  Created by Yuanhai on 10/12/18.
//  Copyright © 2018年 Yuanhai. All rights reserved.
//

#import "GCHTimerManger.h"

@interface GCHTimerManger ()
/**
 定时器
 */
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation GCHTimerManger

+ (instancetype)shareTimer
{
    static dispatch_once_t onceToken;
    static GCHTimerManger *instance;
    dispatch_once(&onceToken, ^{
        instance = [[GCHTimerManger alloc]init];
    });
    return instance;
}

- (void)startTimerWithTimeInterVal:(NSTimeInterval)timeInterVal
{
    if (_timer) return;
    _timer = [NSTimer timerWithTimeInterval:timeInterVal
                                     target:self
                                   selector:@selector(timerAction:)
                                   userInfo:nil
                                    repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer
                              forMode:NSRunLoopCommonModes];
}

/**
 定时器调用事件
 
 @param timer timer
 */
- (void)timerAction:(NSTimer *)timer
{
    [[NSNotificationCenter defaultCenter] postNotificationName:TIMER_NOTIFICATION
                                                        object:nil
                                                      userInfo:nil];
}

/**
 结束定时器
 */
- (void)stopTimer
{
    if (!_timer) return;
    [self.timer invalidate];
    self.timer = nil;
}

@end
