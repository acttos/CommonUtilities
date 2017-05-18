//
//  CUColor.h
//  CUtil
//
//  Created by Acttos on 3/10/16.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CUColor : NSObject

/**
 Return the UIColor instance generated with a hex value
 
 @param hexValue The value of color in hex format, such as: 0xFF00FF
 @return The UIColor instance
 */
+ (UIColor *)colorWithHex:(NSInteger)hexValue;

/**
 Return the UIColor instance generated with a hex and alpha values
 
 @param hexValue The value of color in hex format, such as: 0xFF00FF
 @param alpha    The alpha property of this color
 @return The UIColor instance with alpha.
 */
+ (UIColor *)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alpha;

/**
 Return the UIColor instance generated with a hex string value
 
 @param hexString The color value in format of hex string, such as: @"#FF00FF"
 @return The UIColor instance from hexString.
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;

/**
 Return the UIColor instance generated with a hex string and alpha values.
 
 @param hexString The color value in format of hex string, such as: @"#FF00FF"
 @param alpha The alpha property of this color
 @return The UIColor instance from hexString and alpha.
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

/**
 Generate an UIImage instance with given UIColor

 @param color The color to fill the image
 @return The image with full of the given color
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
