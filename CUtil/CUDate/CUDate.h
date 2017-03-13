//
//  CUDate.h
//  CUtil
//
//  Created by Acttos on 3/10/16.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.
//

#import <Foundation/Foundation.h>

@interface CUDate : NSObject

/**
 Generate a millisecond value based on current time.
 
 @return The current milliseconds.
 */
+(long long)generateMillisecondTime;

/**
 Generate a millisecond value based on the given date.
 
 @param date The date which will be converted into milliseconds, current date will replace this parameter when the give date is nil
 @return The milliseconds based on the give date.
 */
+(long long)generateMillisecondTimeWithDate:(NSDate *)date;

/**
 Generate a millisecond value based on the date and format

 @param date The string date to use, if nil, the current [NSDate date] will be used
 @param format The format asscoiated with the date, "yyyy-MM-dd HH:mm:ss" will be used when parameter 'format' is nil.
 @return The milliseconds based on the date and format
 */
+(long long)generateMillisecondTimeWithStringDate:(NSString *)date format:(NSString *)format;

/**
 Convert the milliseconds into a NSDate instance
 
 @param milliseconds The milliseconds to convert with.
 @return The NSDate instance based on the milliseconds.
 */
+(NSDate *)generateDateWithMilliseconds:(long long)milliseconds;

/**
 Format the date with a format string
 
 @param date   The NSDate instance to convert and format, if nil, the current [NSDate date] will be used
 @param format The format string, "yyyy-MM-dd HH:mm:ss" will be used when parameter 'format' is nil.
 @return The formated string
 */
+(NSString *)stringOfDate:(NSDate *)date withFormat:(NSString *)format;

@end
