//
//  CUQueryString.m
//  CUtil
//
//  Created by Acttos on 2018/6/27.
//  Copyright © 2018 Acttos.org. All rights reserved.
//

#import "CUQueryString.h"

@implementation CUQueryString

+ (NSString *)fillParameters:(NSDictionary<NSString *, NSString *> *)paramDic forPath:(NSString *)requestURLPath {
    if (requestURLPath && paramDic && paramDic.count > 0) {
        NSMutableString *paramQueryString = [NSMutableString stringWithString:requestURLPath];
        
        NSArray<NSString *> *keys = paramDic.allKeys;
        for (NSString *key in keys) {
            NSString *value = [paramDic valueForKey:key];
            if ([paramQueryString containsString:@"?"]) {
                [paramQueryString appendString:[NSString stringWithFormat:@"&%@=%@", key, value]];
            } else {
                [paramQueryString appendString:[NSString stringWithFormat:@"?%@=%@", key, value]];
            }
        }
        
        return paramQueryString;
    }
    
    return requestURLPath;
}

@end
