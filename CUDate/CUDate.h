//
//  CUDate.h
//  CommonUtilities
//
//  Created by Actto on 3/10/16.
//  Copyright © 2016 Actto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CUDate : NSObject

/** 创建时间戳 */
+(long long)generateMillisecondTime;
/** 根据给定日期创建时间戳 */
+(long long)generateMillisecondTimeWithDate:(NSDate *)date;
/** 将毫秒的时间转化为NSDate实例 */
+(NSDate *)generateDateWithMilliseconds:(long long)milliseconds;
+(NSString *)stringOfDate:(NSDate *)date withFormat:(NSString *)format;
@end
