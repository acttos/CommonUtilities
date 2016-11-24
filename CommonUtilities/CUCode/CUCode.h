//
//  CUCode.h
//  CommonUtilities
//
//  Created by Acttos on 24/11/2016.
//  Copyright © 2016 Acttos.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CUCode : NSObject

/**
 将给定的字符串进行BASE64编码

 @param string 源字符串
 @return 经过BASE64编码后的字符串
 */
+ (NSString*) BASE64EncodeWithString:(NSString*)string;

/**
 将给定的字符串进行BASE64解码

 @param string 源字符串
 @return 经过BASE64解码后的字符串
 */
+ (NSString*) BASE64DecodeWithString:(NSString*)string;

/**
 将给定的字符串进行MD5摘要
 
 @param sourceString 源字符串
 @return 进行了MD5摘要后的字符串
 */
+ (NSString *) MD5CodeWithString:(NSString *)sourceString;

/**
 将给定的NSData实例进行MD5摘要
 
 @param data 给定的NSData实例
 @return 进行了MD5摘要后的字符串
 */
+ (NSString *) MD5CodeWithData:(NSData *) data;

/**
 将给定的字符串进行SHA1摘要

 @param sourceString 源字符串
 @return 进行了SHA1摘要后的字符串
 */
+ (NSString *) SHA1CodeWithString:(NSString *)sourceString;

/**
 将给定的NSData实例进行SHA1摘要
 
 @param data 给定的NSData实例
 @return 进行了SHA1摘要后的字符串
 */
+ (NSString*) SHA1CodeWithData:(NSData*)data;

@end
