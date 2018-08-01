//
//  CUJSON.h
//  CUtil
//
//  Created by Acttos on 3/31/16.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.
//

#import <Foundation/Foundation.h>

@interface CUJSON : NSObject

/**
 Return the JSON string generated from an array
 
 @param array The array used to generate JSON string
 @return The JSON string from an array
 */
+(NSString *)JSONStringFromArray:(NSArray *)array;
/**
 Return the JSON string generated from an array
 
 @param array The array used to generate JSON string
 @param readable Should return the human readable string
 @return The JSON string from an array
 */
+(NSString *)JSONStringFromArray:(NSArray *)array readable:(BOOL)readable;

/**
 Return the JSON string generated from a dictionary
 
 @param dictionary The dictionary used to generate JSON string
 @return The JSON string from a dictionary
 */
+(NSString *)JSONStringFromDictionary:(NSDictionary *)dictionary;
/**
 Return the JSON string generated from a dictionary
 
 @param dictionary The dictionary used to generate JSON string
 @param readable Should return the human readable string
 @return The JSON string from a dictionary
 */
+(NSString *)JSONStringFromDictionary:(NSDictionary *)dictionary readable:(BOOL)readable;

/**
 Generate JSON string with object.
 
 @param object Any NSObject instance
 @return The JSON string or nil when the object is nil or can NOT be parsed into JSON.
 */
+(NSString *)JSONStringFromObject:(NSObject *)object;
/**
 Generate JSON string with object.
 
 @param object Any NSObject instance
 @param readable Should return the human readable string
 @return The JSON string or nil when the object is nil or can NOT be parsed into JSON.
 */
+(NSString *)JSONStringFromObject:(NSObject *)object readable:(BOOL)readable;

/**
 Parse the given JSON string to an array instance

 @param JSON The JSON string
 @return An array instance parsed from the JSON
 */
+(NSArray *)arrayFromJSON:(NSString *)JSON;

/**
 Parse the given JSON string to a dictionary instance
 
 @param JSON The JSON string
 @return A dictionary instance parsed from the JSON
 */
+(NSDictionary *)dictionaryFromJSON:(NSString *)JSON;

@end
