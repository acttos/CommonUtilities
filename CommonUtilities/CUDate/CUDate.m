//
//  CUDate.m
//  CommonUtilities
//
//  Created by Actto on 3/10/16.
//  Copyright © 2016 Actto. All rights reserved.
//

#import "CUDate.h"
#import "CUDefine.h"

@implementation CUDate

+(long long)generateMillisecondTime {
    return [CUDate generateMillisecondTimeWithDate:nil];
}

+(long long)generateMillisecondTimeWithDate:(NSDate *)date {
    date = date == nil ? [NSDate date] : date;
    NSTimeInterval timeInterval = [date timeIntervalSince1970];
    return (long long)(timeInterval * 1000);
}

+(NSDate *)generateDateWithMilliseconds:(long long)milliseconds {
    return [NSDate dateWithTimeIntervalSince1970:milliseconds / 1000];
}

+ (NSString *) stringOfDate:(NSDate *)date withFormat:(NSString *)format {
    if (!format || [format isEqualToString:@""]) {
        format = @"yyyy-MM-dd HH:mm:ss";

        Logger(@"The format string is Empty,default value is %@",format);
    }
    
    if (!date) {
        date = [NSDate date];

        Logger(@"The NSDate instance 'date' is nil,default value is [NSDate date]");
    }
    
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:format];
    
    return [dateFormater stringFromDate:[NSDate date]];
}

@end
