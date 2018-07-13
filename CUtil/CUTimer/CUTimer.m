//
//  CUTimer.m
//  CUtil
//
//  Created by Acttos on 2018/7/13.
//  Copyright © 2018 Acttos.org. All rights reserved.
//

#import "CUTimer.h"

@interface CUTimer()

@property (nonatomic, strong) NSMutableDictionary<NSString *, dispatch_source_t> *timersDictionary;

@property (nonatomic, strong) dispatch_source_t timer;
@property (nonatomic, strong) dispatch_queue_t queue;

@end

@implementation CUTimer

+ (instancetype)timer {
    static CUTimer *instance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [[CUTimer alloc] init];
        instance.queue = dispatch_queue_create("org.acttos.cutil.CUTimer-GCDTimerQueue", DISPATCH_QUEUE_CONCURRENT);
        instance.timersDictionary = [NSMutableDictionary dictionary];
    });
    
    return instance;
}

- (void) fireWithName:(NSString *)timerName timeInterval:(NSTimeInterval)interval block:(void(^)(void))block {
    [self fireWithName:timerName timeInterval:interval delay:0 repeats:YES block:block];
}

- (void) fireWithName:(NSString *)timerName timeInterval:(NSTimeInterval)interval repeats:(BOOL)yesOrNo block:(void(^)(void))block {
    [self fireWithName:timerName timeInterval:interval delay:0 repeats:yesOrNo block:block];
}

- (void) fireWithName:(NSString *)timerName timeInterval:(NSTimeInterval)interval delay:(NSTimeInterval)delay block:(void(^)(void))block {
    [self fireWithName:timerName timeInterval:interval delay:delay repeats:YES block:block];
}

- (void) fireWithName:(NSString *)timerName timeInterval:(NSTimeInterval)interval delay:(NSTimeInterval)delay repeats:(BOOL)yesOrNo block:(void(^)(void))block {
    dispatch_source_t timer = [self.timersDictionary valueForKey:timerName];
    
    if (timer != nil) {
        [self cancelWithName:timerName];
    }
    
    timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, self.queue);
    dispatch_source_set_timer(timer, dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC), interval * NSEC_PER_SEC, 0);
    
    [self.timersDictionary setObject:timer forKey:timerName];
    
    dispatch_source_set_event_handler(timer, ^{
        block();
        if (!yesOrNo) {
            dispatch_source_cancel(timer);
        }
    });
    
    dispatch_resume(timer);
}

- (void) cancelWithName:(NSString *)timerName {
    if (timerName && timerName.length > 0) {
        dispatch_source_t timer = [self.timersDictionary valueForKey:timerName];
        
        if (timer) {
            dispatch_source_cancel(timer);
            [self.timersDictionary removeObjectForKey:timerName];
        }
    }
}

- (void)terminateWithName:(NSString *)timerName {
    [self cancelWithName:timerName];
}

@end
