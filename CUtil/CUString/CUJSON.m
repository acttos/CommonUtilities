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
#import "NSString+CUString.h"

@implementation CUJSON

+(NSString *)JSONStringFromArray:(NSArray *)array {
    return [CUJSON JSONStringFromObject:array];
}

+(NSString *)JSONStringFromDictionary:(NSDictionary *)dictionary {
    return [CUJSON JSONStringFromObject:dictionary];
}

+(NSString *)JSONStringFromObject:(NSObject *)object {
    NSString *JSONString = nil;
    NSError *error;
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&error];
    if (!data || error) {
        Logger(@"There is an error:%@",error);
        return nil;
    } else {
        JSONString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    
    Logger(@"%@", JSONString);
    
    return JSONString;
}

+(NSArray *)arrayFromJSON:(NSString *)JSON {
    if ([JSON isEmpty]) {
        Logger(@"The parameter 'JSON' can NOT be empty.");
        return nil;
    }
    
    if (!([JSON startsWith:@"["] && [JSON endsWith:@"]"])) {
        Logger(@"The parameter 'JSON' does NOT fit array pattern:'[]'");
        return nil;
    }
    
    NSError *error;
    NSArray *array = [NSJSONSerialization JSONObjectWithData:[JSON dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&error];
    
    if (error) {
        Logger(@"There is an error: \n'%@'\n occurs when parsing the given JSON string.", error);
        return nil;
    }
    
    return array;
}

+(NSDictionary *)dictionaryFromJSON:(NSString *)JSON {
    if ([JSON isEmpty]) {
        Logger(@"The parameter 'JSON' can NOT be empty.");
        return nil;
    }
    
    if (!([JSON startsWith:@"{"] && [JSON endsWith:@"}"])) {
        Logger(@"The parameter 'JSON' does NOT fit dictionary pattern:'{}'");
        return nil;
    }
    
    NSError *error;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:[JSON dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&error];
    
    if (error) {
        Logger(@"There is an error: \n'%@'\n occurs when parsing the given JSON string.", error);
        return nil;
    }
    
    return dictionary;
}

@end
