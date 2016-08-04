//
//  CUFile.h
//  CommonUtilities
//
//  Created by Actto on 3/10/16.
//  Copyright © 2016 Actto. All rights reserved.
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
