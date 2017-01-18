//
//  CUStorage.h
//  CUtil
//
//  Created by Acttos on 3/10/16.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.
//

#import <Foundation/Foundation.h>

@interface CUStorage : NSObject

/**
 Write the custom data into Keychain of OS, the data will not change when re-install the app. Mostly used to save non-changed UserId.
 
 @param key  The key to save the data in Keychain
 @param data The data to save
 @warning Only passed on real devices, not support Simulators.
 */
+ (void)storeInKeychainWithKey:(NSString *)key data:(id)data;

/**
 Load the data from Keychain through the given key
 
 @param key The data's key to load.
 @warning Only passed on real devices, not support Simulators.
 @return The data saved in Keychain with the given key
 */
+ (id)loadFromKeychainWithKey:(NSString *)key;

@end
