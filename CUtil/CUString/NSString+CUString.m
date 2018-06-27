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

- (BOOL)isEmpty {
    return (self.length == 0 || [self trim].length == 0);
}

- (BOOL)startsWith:(NSString *)string {
    if (!string) {
        return NO;
    }
    
    if ([self indexOf:string] == 0) {
        return YES;
    }
    
    return NO;
}

- (BOOL)endsWith:(NSString *)string {
    if (!string) {
        return NO;
    }
    
    if ([self lastIndexOf:string] == self.length - string.length) {
        return YES;
    }
    
    return NO;
}

- (NSString *)substring:(NSUInteger)beginIndex to:(NSUInteger)endIndex {
    if (endIndex < beginIndex || self.length < beginIndex || self.length < endIndex) {
        return @"The indexes may be NOT correct, please check the the indexes or source string.";
    }
    
    NSString *substring = [self substringWithRange:NSMakeRange(beginIndex, endIndex - beginIndex)];
    
    return substring;
}

- (NSString *)trim {
    NSString *trimedString = self;
    while ([trimedString startsWith:@" "]) {
        trimedString = [trimedString replaceFirst:@" " with:@""];
    }
    
    while ([trimedString endsWith:@" "]) {
        trimedString = [trimedString replaceLast:@" " with:@""];
    }
    
    return trimedString;
}

- (NSArray<NSString *> *)splitBy:(NSString *)pattern {
    NSArray<NSString *> *sourceArray = [self componentsSeparatedByString:pattern];
    if (sourceArray == nil) {
        return nil;
    }
    
    NSMutableArray<NSString *> *result = [NSMutableArray arrayWithCapacity:10];
    for (NSString *string in sourceArray) {
        if (![string isEmpty]) {
            [result addObject:string];
        }
    }
    
    return result;
}

- (NSUInteger)indexOf:(NSString *)pattern {
    return [self rangeOfString:pattern].location;
}

- (NSUInteger)lastIndexOf:(NSString *)pattern {
    return [self rangeOfString:pattern options:NSBackwardsSearch].location;
}

- (NSString *)replaceFirst:(NSString *)pattern with:(NSString *)replacement {
    NSRange range = [self rangeOfString:pattern];
    return [self stringByReplacingCharactersInRange:range withString:replacement];
}

- (NSString *)replaceLast:(NSString *)pattern with:(NSString *)replacement {
    
    NSRange range = [self rangeOfString:pattern options:NSBackwardsSearch];
    return [self stringByReplacingCharactersInRange:range withString:replacement];
}

- (NSString *)replaceAll:(NSString *)pattern with:(NSString *)replacement {
    return [self stringByReplacingOccurrencesOfString:pattern withString:replacement];
}

@end
