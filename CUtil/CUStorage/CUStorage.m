//
//  CUStorage.m
//  CUtil
//
//  Created by Acttos on 3/10/16.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.
//

#import "CUStorage.h"
#import "CUDefine.h"

@implementation CUStorage

+ (void)storeInKeychainWithKey:(NSString *)key data:(id)data {
#ifndef TARGET_IPHONE_SIMULATOR
    //Get search dictionary
    NSMutableDictionary *keychainQuery = [self getKeychainWithKey:key];
    //Delete old item before add new item
    SecItemDelete((__bridge CFDictionaryRef)keychainQuery);
    //Add new object to search dictionary(Attention:the data format)
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(__bridge id)kSecValueData];
    //Add item to keychain with the search dictionary
    SecItemAdd((__bridge CFDictionaryRef)keychainQuery, NULL);
#else
    Logger(@"Methods associated with Keychain only work on real devices.");
#endif
}

+ (NSMutableDictionary *)getKeychainWithKey:(NSString *)key {
#ifndef TARGET_IPHONE_SIMULATOR
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (__bridge id)kSecClassGenericPassword,(__bridge id)kSecClass,
            key, (__bridge id)kSecAttrService,
            key, (__bridge id)kSecAttrAccount,
            (__bridge id)kSecAttrAccessibleAfterFirstUnlock,(__bridge id)kSecAttrAccessible,
            nil];
#else
    Logger(@"Methods associated with Keychain only work on real devices.");
    return nil;
#endif
}

+ (id)loadFromKeychainWithKey:(NSString *)key {
#ifndef TARGET_IPHONE_SIMULATOR
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainWithKey:key];
    
    [keychainQuery setObject:(__bridge id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
    [keychainQuery setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    
    OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData);
    if (status == errSecSuccess) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        } @catch (NSException *e) {
            Logger(@"Unarchive of %@ failed: %@", key, e);
        } @finally {
        }
    }
    if (keyData) {
        CFRelease(keyData);
    }
    
    return ret;
#else
    Logger(@"Methods associated with Keychain only work on real devices.");
    return nil;
#endif
}


@end
