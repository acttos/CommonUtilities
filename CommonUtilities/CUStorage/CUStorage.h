//
//  CUStorage.h
//  CommonUtilities
//
//  Created by Acttos on 3/10/16.
//  Copyright © 2016 Acttos.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CUStorage : NSObject

/**
 *  将自定义service的数据写入系统Keychain中，避免用户卸载软件后，data发生变化，用于IMEI或者UserId
 *
 *  @param key  用来存储数据的Key
 *  @param data 需要存储的数据
 */
+ (void)storeInKeychainWithKey:(NSString *)key data:(id)data;

/**
 *  根据service名称获取写入系统Keychain的数据
 *
 *  @param key 获取数据对应的Key
 *
 *  @return 存储在keychain中的数据
 */
+ (id)loadFromKeychainWithKey:(NSString *)key;

@end
