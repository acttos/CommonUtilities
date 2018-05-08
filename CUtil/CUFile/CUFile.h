//
//  CUFile.h
//  CUtil
//
//  Created by Acttos on 3/10/16.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes are under MIT License
//

#import <Foundation/Foundation.h>

@interface CUFile : NSObject

/**
 Return the default Documents URL

 @return Documents' URL
 */
+ (NSURL *)getDocumentsDirectory;

/**
 Create a directory at the given path, including the parent directories.

 @param path The full path of the directory to create, such as: "/videos/2016/12/"
 @warning The root directory of this method is the 'data' directory of the device, all the directories will be created under the 'data' folder.
 @return Created or already exists: YES, otherwise: NO
 */
+ (BOOL)createDirectoryAtPath:(NSString *)path;

/**
 Save the data to the given path.

 @param data The data to save.
 @param path The path which to save the data. PS:This path should contain the name of the file, path can NOT end with '/'.
 @return Saved: YES, otherwise: NO
 */
+ (BOOL)saveFile:(NSData *)data atPath:(NSString *)path;

/**
 Save the data to the given path with a given file name.

 @param data The data to save.
 @param path The path which to save the data. PS:This path CAN contain the name of the file, path CAN end with '/'.
 @param fileName The file name of the file to create.
 @return Saved: YES, otherwise: NO
 */
+ (BOOL)saveFile:(NSData *)data atPath:(NSString *)path withName:(NSString *)fileName;

@end
