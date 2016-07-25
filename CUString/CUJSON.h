//
//  CUJSON.h
//  CommonUtilities
//
//  Created by Actto on 3/31/16.
//  Copyright © 2016 Actto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CUJSON : NSObject

+(NSString *)JSONStringFromArray:(NSArray *)array;
+(NSString *)JSONStringFromDictionary:(NSDictionary *)dictionary;

+(NSString *)parseJSONStringFromObject:(NSObject *)object;

@end
