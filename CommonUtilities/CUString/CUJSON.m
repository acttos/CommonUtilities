//
//  CUJSON.m
//  CommonUtilities
//
//  Created by Actto on 3/31/16.
//  Copyright © 2016 Actto. All rights reserved.
//

#import "CUJSON.h"

@implementation CUJSON

+(NSString *)JSONStringFromArray:(NSArray *)array {
    return [CUJSON parseJSONStringFromObject:array];
}

+(NSString *)JSONStringFromDictionary:(NSDictionary *)dictionary {
    return [CUJSON parseJSONStringFromObject:dictionary];
}

+(NSString *)parseJSONStringFromObject:(NSObject *)object {
    NSString *JSONString = nil;
    NSError *error;
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:object options:0 error:&error];
    if (!data || error) {
        JSONString = @"{\"error\":\"-1\"}";
    } else {
        JSONString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    
    return JSONString;
}

@end
