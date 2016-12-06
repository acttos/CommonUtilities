//
//  CUConfig.h
//  CUtil
//
//  Created by Acttos on 21/11/2016.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.
//

#import <Foundation/Foundation.h>

@interface CUConfig : NSObject

/**
 获取当前系统首选的语言标识

 @return 当前系统首选的语言，采用系统给出的值
 */
+ (NSString *)getDeviceLanguage;

/**
 获取当前系统的语言编码

 @return 语言编码，如：en,zh,ar,fr等
 */
+ (NSString *)getDeviceLanguageCode;

/**
 获取当先系统的国家或地区编码

 @return 国家或地区编码，如：CN,US,UK,AR,FR,TW,HK等
 */
+ (NSString *)getDeviceCountryCode;

/**
 以i18N的格式输出当前系统的语言和地域，如"en_US,zh_CN,zh_TW,en_FR"

 @return 将国家码和语言码组合后返回，是目前网络协议中常见的格式。
 */
+ (NSString *)getLocalStringIni18N;

/**
 是否为中文环境

 @return 中文：YES，否则：NO
 */
+ (BOOL)isChineseLang;

/**
 是否为阿拉伯语环境，因为阿拉伯语在界面布局时，需要从右向左设计，因此，这个方法有较高的使用率。
 
 @return 阿拉伯语：YES，否则：NO
 */
+ (BOOL)isArabicLang;

/**
 是否为法语环境
 
 @return 法语：YES，否则：NO
 */
+ (BOOL)isFrenchLang;

@end
