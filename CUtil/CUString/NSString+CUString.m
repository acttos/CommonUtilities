//
//  NSString+CUString.m
//  CUtil
//
//  Created by Acttos on 12/20/16.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.
//

#import "NSString+CUString.h"

@implementation NSString (CUString)

-(BOOL)isEmpty {
    return NO;
}

-(BOOL)startsWith:(NSString *)string {
    return NO;
}

-(BOOL)endsWith:(NSString *)string {
    return NO;
}

-(NSString *)substring:(NSUInteger)beginIndex to:(NSUInteger)endIndex {
    return nil;
}

-(NSMutableArray *)split:(NSString *)pattern {
    return nil;
}

-(NSUInteger)indexOf:(NSString *)pattern {
    return [self rangeOfString:pattern].location;
}

-(NSUInteger)lastIndexOf:(NSString *)pattern {
    return [self rangeOfString:pattern options:NSBackwardsSearch].location;
}

-(NSString *)replaceFirst:(NSString *)pattern with:(NSString *)replacement {
    NSRange range = [self rangeOfString:pattern];
    return [self stringByReplacingCharactersInRange:range withString:replacement];
}

-(NSString *)replaceLast:(NSString *)pattern with:(NSString *)replacement {
    
    NSRange range = [self rangeOfString:pattern options:NSBackwardsSearch];
    return [self stringByReplacingCharactersInRange:range withString:replacement];
}

-(NSString *)replaceAll:(NSString *)pattern with:(NSString *)replacement {
    return [self stringByReplacingOccurrencesOfString:pattern withString:replacement];
}

@end
