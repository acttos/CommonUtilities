//
//  NSString+CUString.h
//  CUtil
//
//  Created by Acttos on 12/20/16.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.
//

#import <Foundation/Foundation.h>

@interface NSString (CUString)

-(BOOL)isEmpty;
-(BOOL)startsWith:(NSString *)string;
-(BOOL)endsWith:(NSString *)string;
-(NSString *)substring:(NSUInteger)beginIndex to:(NSUInteger)endIndex;
-(NSMutableArray *)split:(NSString *)pattern;

/**
 获取字符串中符合匹配的首个索引

 @param pattern 需要匹配的字符串
 @return 匹配字符的首个匹配索引
 */
-(NSUInteger)indexOf:(NSString *)pattern;

/**
 获取字符串中符合匹配的最后一个索引

 @param pattern 需要匹配的字符串
 @return 匹配字符的最后一个匹配索引
 */
-(NSUInteger)lastIndexOf:(NSString *)pattern;

/**
 替换首个匹配的字符

 @param pattern 需要进行匹配的字符
 @param replacement 用于将匹配到的字符替换为的字符
 @return 替换完毕的新字符串
 */
-(NSString *)replaceFirst:(NSString *)pattern with:(NSString *)replacement;

/**
 替换最后一个匹配的字符
 
 @param pattern 需要进行匹配的字符
 @param replacement 用于将匹配到的字符替换为的字符
 @return 替换完毕的新字符串
 */
-(NSString *)replaceLast:(NSString *)pattern with:(NSString *)replacement;

/**
 替换所有匹配的字符
 
 @param pattern 需要进行匹配的字符
 @param replacement 用于将匹配到的字符替换为的字符
 @return 替换完毕的新字符串
 */
-(NSString *)replaceAll:(NSString *)pattern with:(NSString *)replacement;

@end
