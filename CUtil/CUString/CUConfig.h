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
 Return the preffered language as the language of the device
 @return The language currently used by the device
 */
+ (NSString *)getDeviceLanguage;

/**
 Return the language code of the device
 @return The language code. such as: en, zh, ar, fr and so on.
 */
+ (NSString *)getDeviceLanguageCode;

/**
 Return the country code of the device

 @return The country code. such as: CN, US, UK, AR, FR, TW, HK and so on.
 */
+ (NSString *)getDeviceCountryCode;

/**
 Return the language code and country code in the format of 'i18N'. such as: en_US, zh_CN, zh_TW, en_FR and so on.
 
 @return The mixed code of language and country. Mostly used in the communication protocol between the client and the server.
 */
+ (NSString *)getLocalStringIni18N;

/**
 Is the device using Chinese as the prefrered language.

 @return Chinese: YES, otherwise: NO
 */
+ (BOOL)isChineseLang;

/**
 Is the device using Arabic as the prefrered language.
 
 @return Arabic: YES, otherwise: NO
 */
+ (BOOL)isArabicLang;

/**
 Is the device using French as the prefrered language.
 
 @return French: YES, otherwise: NO
 */
+ (BOOL)isFrenchLang;

@end
