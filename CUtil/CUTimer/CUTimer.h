//
//  CUTimer.h
//  CUtil
//
//  Created by Acttos on 2018/7/13.
//  Copyright © 2018 Acttos.org. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CUTimer : NSObject


/**
 CUTimer is a singleton instance, you can obtain a CUTimer instance by calling this method.
 @warning This is the only way to obtain a CUTimer instance.

 @return A CUTimer instance.
 */
+ (instancetype)timer;

/**
 Fires an event calling the block and repeats with given time interval.
 
 @discussion This method will fire a timer with timerName immediately, the block will be executed every interval seconds.
 
 @param timerName The name of the timer, you will use this name to cancel(or terminate) the timer.
 @param interval The interval in seconds.
 @param block The block will be called when the event is triggered.
 */
- (void) fireWithName:(NSString *)timerName timeInterval:(NSTimeInterval)interval block:(void(^)(void))block;

/**
 Fires an event calling the block and repeats with given time interval.

 @discussion This method will fire a timer with timerName immediately, the block will be executed every interval seconds when yesOrNo is YES, the block will be called once when the yesOrNo is NO.
 
 @param timerName The name of the timer, you will use this name to cancel(or terminate) the timer.
 @param interval The interval in seconds.
 @param yesOrNo Defines whether the timer should execute the block repeatedly.
 @param block The block will be called when the event is triggered.
 */
- (void) fireWithName:(NSString *)timerName timeInterval:(NSTimeInterval)interval repeats:(BOOL)yesOrNo block:(void(^)(void))block;

/**
 Fires an event calling the block and repeats with given time interval.

 @discussion This method will fire a timer with timerName with delay seconds, the block will be executed every interval seconds.
 
 @param timerName The name of the timer, you will use this name to cancel(or terminate) the timer.
 @param interval The interval in seconds.
 @param delay If delay is bigger than 0, the timer will execute the block in delay seconds.
 @param block The block will be called when the event is triggered.
 */
- (void) fireWithName:(NSString *)timerName timeInterval:(NSTimeInterval)interval delay:(NSTimeInterval)delay block:(void(^)(void))block;

/**
 Fires an event calling the block and repeats with given time interval.

 @discussion This method will fire a timer with timerName with delay seconds, the block will be executed every interval seconds when yesOrNo is YES, the block will be called once when the yesOrNo is NO.
 
 @param timerName The name of the timer, you will use this name to cancel(or terminate) the timer.
 @param interval The interval in seconds.
 @param delay If delay is bigger than 0, the timer will execute the block in delay seconds.
 @param yesOrNo Defines whether the timer should execute the block repeatedly.
 @param block The block will be called when the event is triggered.
 */
- (void) fireWithName:(NSString *)timerName timeInterval:(NSTimeInterval)interval delay:(NSTimeInterval)delay repeats:(BOOL)yesOrNo block:(void(^)(void))block;

/**
 Cancel the timer.
 
 @discussion This method will find the timer with timerName, then cancel the timer, so make sure the timerName is valid.
 
 @param timerName The name of the timer.
 */
- (void) cancelWithName:(NSString *)timerName;

/**
 Terminate the timer.
 
 @discussion This method will find the timer with timerName, then terminate the timer, so make sure the timerName is valid.
 
 @param timerName The name of the timer.
 */
- (void) terminateWithName:(NSString *)timerName;

@end

NS_ASSUME_NONNULL_END
