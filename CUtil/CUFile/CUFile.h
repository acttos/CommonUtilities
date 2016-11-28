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

@end
