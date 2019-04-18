//
//  MyTableViewCell.m
//  TimerCellDemo
//
//  Created by Yuanhai on 10/12/18.
//  Copyright © 2018年 Yuanhai. All rights reserved.
//

#import "MyTableViewCell.h"
#import "GCHTimerManger.h"

@implementation MyTableViewCell

- (void)dealloc
{
    NSLog(@"dealloc..........");
    [[GCHTimerManger shareTimer] stopTimer];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeText) name:TIMER_NOTIFICATION object:nil];
    }
    return self;
}

- (void)setLeftInterval:(long)leftInterval
{
    _leftInterval = leftInterval;
    [self changeText];
    [[GCHTimerManger shareTimer] startTimerWithTimeInterVal:1];
}

- (void)changeText
{
    _leftInterval--;
    self.textLabel.text = [self getTimeStringFromSeconds:self.leftInterval];
}

/**
 *  get time string from seconds
 *  @param seconds 93662
 *  @return 1天2小时1分2秒结束
 */
- (NSString *)getTimeStringFromSeconds:(long long)seconds
{
    long long msec = seconds;
    if (msec <= 0)
    {
        return @"已结束";
    }
    
    NSInteger d = msec / 60 / 60 / 24;
    NSInteger h = msec / 60 / 60 % 24;
    NSInteger m = msec / 60 % 60;
    NSInteger s = msec % 60;
    
    NSString *dStr = d > 0 ? [NSString stringWithFormat:@"%ld天", d] : @"";
    NSString *hStr = h > 0 ? [NSString stringWithFormat:@"%ld小时", h] : @"";
    NSString *mStr = m > 0 ? [NSString stringWithFormat:@"%ld分", m] : @"";
    NSString *sStr = s > 0 ? [NSString stringWithFormat:@"%ld秒", s] : @"";
    
    return [NSString stringWithFormat:@"%@%@%@%@结束", dStr, hStr, mStr, sStr];
}

@end
