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
 将自定义data的数据写入系统Keychain中，data的值不随app的卸载、重装而发生变化，常用于存储固定的UserId。
 
 @param key  用来存储数据的Key
 @param data 需要存储的数据
 @warning 跟Keychain相关的读写操作，仅在真机上验证通过
 */
+ (void)storeInKeychainWithKey:(NSString *)key data:(id)data;

/**
 根据key名称获取写入系统Keychain的数据
 
 @param key 获取数据对应的Key
 @warning 跟Keychain相关的读写操作，仅在真机上验证通过
 @return 存储在keychain中的数据
 */
+ (id)loadFromKeychainWithKey:(NSString *)key;

@end
