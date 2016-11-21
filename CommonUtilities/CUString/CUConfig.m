//
//  CUConfig.m
//  CommonUtilities
//
//  Created by Acttos on 21/11/2016.
//  Copyright © 2016 Actto. All rights reserved.
//

#import "CUConfig.h"
#import "CUDefine.h"

@implementation CUConfig

+ (NSString*)getDeviceLanguage{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSArray * allLanguages = [defaults objectForKey:@"AppleLanguages"];
    NSString * preferredLang = [allLanguages objectAtIndex:0];
    
    Logger(@"Prefered Lang:%@",preferredLang);
    
    return preferredLang;
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
