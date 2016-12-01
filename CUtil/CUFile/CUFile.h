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
+ (NSURL *)getDocumentsDirectory;

/**
 在指定路径创建目录，创建的目录包括父目录。

 @param path 给定的创建目录
 @return 目录存在或创建成功：YES，否则：NO
 @warning 该方法的根目录为当前应用的data目录，所有目录的建立，均在此data目录下。PS：data目录可理解为沙河中可访问的顶层目录。
 */
+ (BOOL)createDirectoryAtPath:(NSString *)path;

/**
 在指定的path目录存储data数据

 @param data 要存储的数据
 @param path 存储数据的具体路径，注意这个路径是包含文件名的路径，不是存放文件的目录
 */
+ (void)saveFile:(NSData *)data atPath:(NSString *)path;

/**
 在制定的path目录，按照fileName存储数据data。

 @param data 要存储的数据
 @param path 存储数据的具体目录，此处问文件存储的具体目录
 @param fileName 要存放的data的文件名称
 */
+ (void)saveFile:(NSData *)data atPath:(NSString *)path withName:(NSString *)fileName;

@end
