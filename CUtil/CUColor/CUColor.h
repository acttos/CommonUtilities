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
 根据传递的16进制数据生成UIColor实例
 
 @param hexValue 16进制的颜色表示方式。如：0xFF00FF
 @return 对应色值的UIColor实例
 */
+ (UIColor *)colorWithHex:(NSInteger)hexValue;

/**
 根据传递的16进制数据生成UIColor实例，该UIColor包含指定的透明度
 
 @param hexValue 16进制的颜色表示方式。如：0xFF00FF
 @param alpha    颜色的透明度
 @return 对应色值的UIColor实例
 */
+ (UIColor *)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alpha;

/**
 根据传递的色值字符串生成UIColor实例
 
 @param hexString 以#开头的16进制色值字符串。如：#FF00FF
 @return 对应色值的UIColor实例
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;

/**
 根据传递的色值字符串生成UIColor实例，该UIColor包含指定的透明度
 
 @param hexString 以#开头的16进制色值字符串。如：#FF00FF
 @param alpha     颜色的透明度
 @return 对应色值的UIColor实例
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

@end
