//
//  CUConfig.h
//  CommonUtilities
//
//  Created by Acttos on 21/11/2016.
//  Copyright © 2016 Acttos.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CUConfig : NSObject

/**
 * 获取当前系统首选的语言标识
 */
+ (NSString *)getDeviceLanguage;
/**
 * 获取当前系统的语言编码
 */
+ (NSString *)getDeviceLanguageCode;
/**
 * 获取当先系统的国家和地区编码
 */
+ (NSString *)getDeviceCountryCode;
/**
 * 以i18N的格式输出当前系统的语言和地域，如"en_US,zh_CN,zh_TW,en_FR"
 */
+ (NSString *)getLocalStringIni18N;
/**
 * 是否为中文环境
 */
+ (BOOL)isChineseLang;
/**
 * 是否为阿拉伯语环境
 */
+ (BOOL)isArabicLang;
/**
 * 是否为法语环境
 */
+ (BOOL)isFrenchLang;

@end
