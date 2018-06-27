//
//  NSString+CUString.h
//  CUtil
//
//  Created by Acttos on 12/20/16.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.
//

#import <Foundation/Foundation.h>

@interface NSString (CUString)

/**
 Determine whether the string is empty, such as: "" or "    "
 @warning when the instance string is nil,this method will return NO, that must be handled by yourself

 @return YES: empty, NO: otherwise
 */
- (BOOL)isEmpty;

/**
 Judge whether the string starts with given string

 @param string The string to judge with
 @return Starts with the given string: YES, otherwise: NO
 */
- (BOOL)startsWith:(NSString *)string;

/**
 Judge whether the string ends with given string
 
 @param string The string to judge with
 @return Ends with the given string: YES, otherwise: NO
 */
- (BOOL)endsWith:(NSString *)string;

/**
 Return the substring cut with given indexes.

 @param beginIndex The index where to begin, the characher at this index is included in the cut string. Make sure the value of it is equal to or bigger than 0 and less than the length of the source string.
 @param endIndex The index where to end, the characher at this index is NOT included in the cut string. Make sure the value of it is bigger than 0 and equal to or less than the length of the source string.
 @return The cut string or a warning string 'The indexes may be NOT correct, please check the the indexes or source string.'.
 */
- (NSString *)substring:(NSUInteger)beginIndex to:(NSUInteger)endIndex;

/**
 Return the clean string which deleted the blank characters at the beginning and the ending.

 @return The string without blank charachers at the beginning or ending
 */
- (NSString *)trim;

/**
 Return an array split from a string with given separator.

 @param pattern The separator's pattern
 @return The array split from the string.
 */
- (NSArray<NSString *> *)splitBy:(NSString *)pattern;

/**
 Return the first index where matches the pattern.

 @param pattern The string's pattern to match
 @return The first index of the matched string.
 */
- (NSUInteger)indexOf:(NSString *)pattern;

/**
 Return the last index where matches the pattern.
 
 @param pattern The string's pattern to match
 @return The last index of the matched string.
 */
- (NSUInteger)lastIndexOf:(NSString *)pattern;

/**
 Replace the first matched characters with the replacement.

 @param pattern The string's pattern to match.
 @param replacement The replacement string.
 @return The new string replaced the first match.
 */
- (NSString *)replaceFirst:(NSString *)pattern with:(NSString *)replacement;

/**
 Replace the last matched characters with the replacement.
 
 @param pattern The string's pattern to match.
 @param replacement The replacement string.
 @return The new string replaced the last match.
 */
- (NSString *)replaceLast:(NSString *)pattern with:(NSString *)replacement;

/**
 Replace all the matched characters with the replacement.
 
 @param pattern The string's pattern to match.
 @param replacement The replacement string.
 @return The new string replaced the match.
 */
- (NSString *)replaceAll:(NSString *)pattern with:(NSString *)replacement;

@end
