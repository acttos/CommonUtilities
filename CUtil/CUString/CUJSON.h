//
//  CUJSON.h
//  CUtil
//
//  Created by Acttos on 3/31/16.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.
//

#import <Foundation/Foundation.h>

@interface CUJSON : NSObject

/**
 根据给定的NSArray实例生成JSON字符串
 
 @param array NSArray实例
 @return NSArray对应的JSON字符串
 */
+(NSString *)JSONStringFromArray:(NSArray *)array;

/**
 根据给定的NSDictionary实例生成JSON字符串
 
 @param dictionary NSDictionary实例
 @return NSDictionary对应的JSON字符串
 */
+(NSString *)JSONStringFromDictionary:(NSDictionary *)dictionary;

/**
 将任意对象转换成JSON字符串，当给定object为nil或者不可解析为JSON时，返回错误
 
 @param object 任意NSObject对象
 @return 解析的JSON或错误内容
 */
+(NSString *)JSONStringFromObject:(NSObject *)object;

/**
 Parse the given JSON string to an array instance

 @param JSON The JSON string
 @return An array instance parsed from the JSON
 */
+(NSArray *)arrayFromJSON:(NSString *)JSON;

/**
 Parse the given JSON string to a dictionary instance
 
 @param JSON The JSON string
 @return A dictionary instance parsed from the JSON
 */
+(NSDictionary *)dictionaryFromJSON:(NSString *)JSON;

@end
