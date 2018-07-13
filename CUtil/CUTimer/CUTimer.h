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

+ (instancetype)timer;

- (void) fireWithName:(NSString *)timerName timeInterval:(NSTimeInterval)interval block:(void(^)(void))block;
- (void) fireWithName:(NSString *)timerName timeInterval:(NSTimeInterval)interval repeats:(BOOL)yesOrNo block:(void(^)(void))block;
- (void) fireWithName:(NSString *)timerName timeInterval:(NSTimeInterval)interval delay:(NSTimeInterval)delay block:(void(^)(void))block;
- (void) fireWithName:(NSString *)timerName timeInterval:(NSTimeInterval)interval delay:(NSTimeInterval)delay repeats:(BOOL)yesOrNo block:(void(^)(void))block;
- (void) cancelWithName:(NSString *)timerName;

@end

NS_ASSUME_NONNULL_END
