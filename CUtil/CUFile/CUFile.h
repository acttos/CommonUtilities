//
//  CUFile.h
//  CommonUtilities
//
//  Created by Acttos on 3/10/16.
//  Copyright © 2016 Acttos.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CUFile : NSObject

/**
 *  返回当前App的Documents路径
 *
 *  @return Documents的URL
 */
+(NSURL *)getDocumentsDirectory;

/**
 在指定的path目录存储data数据

 @param data 要存储的数据
 @param path 存储数据的具体路径
 */
+ (void)saveFile:(NSData *)data atPath:(NSString *)path;

@end
