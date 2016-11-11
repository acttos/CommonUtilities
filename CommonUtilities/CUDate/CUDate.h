//
//  CUDate.h
//  CommonUtilities
//
//  Created by Actto on 3/10/16.
//  Copyright © 2016 Actto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CUDate : NSObject

/**
 *  根据当前时间创建时间戳
 *
 *  @return 当前时间的时间戳，精确到毫秒
 */
+(long long)generateMillisecondTime;
/**
 *  根据给定日期创建时间戳
 *
 *  @param date 需要转换为时间戳的NSDate对象,date为nil时，取当前时刻
 *
 *  @return 转换后的时间戳，精确到毫秒
 */
+(long long)generateMillisecondTimeWithDate:(NSDate *)date;
/**
 *  将毫秒的时间转化为NSDate实例
 *
 *  @param milliseconds 某个时间对应的毫秒值
 *
 *  @return 给定时间戳对应的NSDate对象
 */
+(NSDate *)generateDateWithMilliseconds:(long long)milliseconds;
/**
 *  将NSDate对象进行格式化，采用当前时区
 *
 *  @param date   NSDate对象
 *  @param format 格式化字符串，如果为空或者nil，采用“yyyy-MM-dd HH:mm:ss”
 *
 *  @return 格式化后的字符串
 */
+(NSString *)stringOfDate:(NSDate *)date withFormat:(NSString *)format;

@end
