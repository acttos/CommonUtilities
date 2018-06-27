//
//  CUQueryString.h
//  CUtil
//
//  Created by Acttos on 2018/6/27.
//  Copyright © 2018 Acttos.org. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CUQueryString : NSObject

/**
 Puts the key-value pairs in paramDic to query string of given request path.
 
 @param paramDic The key-value pairs container Dictionary.
 @param requestURLPath The original http(s) request path
 @return The Query String appended to the requestURLPath.
 */
+ (NSString *)fillParameters:(NSDictionary<NSString *, NSString *> *)paramDic forPath:(NSString *)requestURLPath;

@end

NS_ASSUME_NONNULL_END
