//
//  CUJSON.m
//  CUtil
//
//  Created by Acttos on 3/31/16.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.
//

#import "CUJSON.h"
#import "CUDefine.h"

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
    
    Logger(@"%@", JSONString);
    
    return JSONString;
}

@end
