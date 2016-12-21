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

/**
 判断当前字符串是否为空；空代表：”nil“，”“ 或者 ”  “，任何无字符的字符串均为空

 @return YES：为空，NO：不为空
 */
-(BOOL)isEmpty;

/**
 判断当前字符串是否由给定的字符串作为开头

 @param string 给定的开头字符串，用来做判断条件
 @return YES：符合开头判断，NO：不符合开头判断
 */
-(BOOL)startsWith:(NSString *)string;

/**
 判断当前字符串是否由给定的字符串作为结尾
 
 @param string 给定的结尾字符串，用来做判断条件
 @return YES：符合结尾判断，NO：不符合结尾判断
 */
-(BOOL)endsWith:(NSString *)string;

/**
 按照给定的索引来截取字符串

 @param beginIndex 开始索引，截取后的字符串[包含]该索引对应的字符
 @param endIndex 结束索引，截取后的字符串[不包含]该索引对应的字符
 @return 截取后的字符串
 */
-(NSString *)substring:(NSUInteger)beginIndex to:(NSUInteger)endIndex;

/**
 将当前字符串首尾处的空字符删除并返回

 @return 删除收尾空字符后的字符串
 */
-(NSString *)trim;

/**
 将当前字符串按照给定的分隔符进行拆分,拆分后的数组不包含空元素

 @param pattern 给定的分隔符
 @return 根据分隔符拆分后的数组
 */
-(NSArray<NSString *> *)splitBy:(NSString *)pattern;

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
