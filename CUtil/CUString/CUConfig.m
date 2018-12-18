//
//  CUConfig.m
//  CUtil
//
//  Created by Acttos on 21/11/2016.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.
//

#import "CUConfig.h"
#import "CUDefine.h"

@implementation CUConfig

+ (NSString *)getDeviceLanguage{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSArray * allLanguages = [defaults objectForKey:@"AppleLanguages"];
    NSString * prefferedLang = [allLanguages objectAtIndex:0];
    
    Logger(@"Preffered Lang:%@",prefferedLang);
    
    return prefferedLang;
}

+ (NSString *)getDeviceLanguageCode {
    return [[NSLocale currentLocale] objectForKey:NSLocaleLanguageCode];
}

+ (NSString *)getDeviceCountryCode {
    return [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode];
}

+ (NSString *)getLocalStringIni18N {
    NSString *i18NPrefix = [CUConfig getDeviceLanguageCode];
    NSString *i18NSuffix = [CUConfig getDeviceCountryCode];
    
    NSString *result = [NSString stringWithFormat:@"%@_%@", i18NPrefix, i18NSuffix];
    
    Logger(@"Return:%@", result);
    return result;
}

+ (BOOL)isChineseLang {
    if ([[CUConfig getDeviceLanguageCode] isEqualToString:@"zh"]) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)isArabicLang {
    if ([[CUConfig getDeviceLanguage] containsString:@"ar-"]) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)isFrenchLang {
    if ([[CUConfig getDeviceLanguage] containsString:@"fr-"]) {
        return YES;
    }
    
    return NO;
}

@end
