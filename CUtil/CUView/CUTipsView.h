//
//  CUTipsView.h
//  CUtil
//
//  Created by Acttos on 23/11/2016.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "CUDefine.h"

/**
 预定义的CUTipsView样式，每一个样式对应一组显示效果
 */
typedef enum {
    CUTipsViewThemeDark, //Treated as the default value.
    CUTipsViewThemeLight
} CUTipsViewTheme;

@interface CUTipsView : NSObject

/**
 在给定的view中显示一个类似于Android Toast效果的弹框。
 
 @param view     弹框的父视图容器View
 @param message  弹框需要显示的文字内容
 @param _duration Toast消失过程持续的时间，单位：秒
 @param _delay    Toast持续显示的时间，单位：秒
 */
+ (void)showToastInView:(UIView *)view withMessage:(NSString *)message duration:(float)_duration delay:(float)_delay;

/**
 在给定的view中显示一个类似于Android Toast效果的弹框。该弹框支持自定义frame

 @param view 弹框的父视图容器view
 @param frame 弹框的frame
 @param _message 弹框要显示的消息
 @param _duration Toast消失过程持续的时间，单位：秒
 @param _delay Toast持续显示的时间，单位：秒
 */
+ (void)showToastInView:(UIView *)view withFrame:(CGRect)frame message:(NSString *)_message duration:(float)_duration delay:(float)_delay;

/**
 以全屏幕的方式展现出一个带有转动菊花的Waiting视图
 
 @param tag 视图对应的tag，方便隐藏时使用
 @param _message Waiting视图中显示的文字消息
 @warning 本方法不能应用在Extension中，因为获取不到UIWindow.keyWindow.
 */
+(void)showFullScreenWaitingViewWithTag:(NSUInteger)tag message:(NSString *)_message;

/**
 在给定的view上展示一个全屏的waiting视图，采用默认tag运算，隐藏时调用[CUTipsView hideWaitingViewInView:]。

 @param view Waiting视图覆盖的低层视图
 @param _message 需要在Waiting视图中显示的消息
 */
+(void)showFullScreenWaitingViewInView:(UIView *)view message:(NSString *)_message;

/**
 显示一个根据给定frame生成的带有转动菊花的Waiting视图
 
 @param tag 视图对应的tag，方便隐藏时使用
 @param _frame 视图整体的大小和位置参数
 @param _message Waiting视图中显示的文字消息
 @warning 本方法不能应用在Extension中，因为获取不到UIWindow.keyWindow.
 */
+(void)showWaitingViewWithTag:(NSUInteger)tag frame:(CGRect)_frame message:(NSString *)_message;

/**
 显示一个根据给定frame生成的带有转动菊花的Waiting视图
 
 @param tag 视图对应的tag，方便隐藏时使用
 @param _frame 视图整体的大小和位置参数
 @param _message Waiting视图中显示的文字消息
 @param _theme  Waiting视图的样式
 @warning 本方法不能应用在Extension中，因为获取不到UIWindow.keyWindow.
 */
+(void)showWaitingViewWithTag:(NSUInteger)tag frame:(CGRect)_frame message:(NSString *)_message theme:(CUTipsViewTheme)_theme;

/**
 在指定的view中显示一个根据frame生成的带有转动菊花的Waiting视图
 
 @param view waiting视图的父视图
 @param _frame 视图整体的大小和位置参数
 @param _message Waiting视图中显示的文字消息
 */
+(void)showWaitingViewInView:(UIView *)view frame:(CGRect)_frame message:(NSString *)_message;

/**
 在指定的view中显示一个根据frame生成的带有转动菊花的Waiting视图
 
 @param view waiting视图的父视图
 @param _frame 视图整体的大小和位置参数
 @param _message Waiting视图中显示的文字消息
 @param _theme  Waiting视图的样式
 */
+(void)showWaitingViewInView:(UIView *)view frame:(CGRect)_frame message:(NSString *)_message theme:(CUTipsViewTheme)_theme;

/**
 在指定的view中显示一个转动的ActivityIndicatorView

 @param view ActivityIndicatorView的父视图
 @param _center ActivityIndicatorView的中心点坐标
 @param _theme ActivityIndicatorView的视图样式
 */
+(void)showActivityIndicatorInView:(UIView *)view center:(CGPoint)_center theme:(CUTipsViewTheme)_theme;

/**
 在视图顶部显示的一个Tips视图，可包含文字和图片，该Tips视图会自动以向上滑出的方式消失
 
 @param view Tips视图的父View
 @param aImage Tips视图中的图片，位于aMessage的左侧
 @param aMessage Tips视图中显示的文字消息
 @param _yOffset Tips视图距离屏幕顶部的偏移量，一般为0.0f
 */
+(void)showPopDownTipsViewInView:(UIView *)view withImage:(UIImage *)aImage message:(NSString *)aMessage yOffset:(CGFloat)_yOffset;

/**
 隐藏某个tag对应的视图，并从父视图中移除
 
 @param tag 视图对应的tag
 */
+(void)hideViewInWindowWithTag:(NSUInteger)tag;

/**
 隐藏waiting视图，采用默认tag运算

 @param view waiting视图覆盖的视图
 */
+(void)hideWaitingViewInView:(UIView *)view;

/**
 Hide the Activity Indicator view

 @param view The container view of Activity Indicator
 */
+(void)hideActivityIndicatorInView:(UIView *)view;

/**
 根据宽和高生成一个在屏幕（Screen）上下左右居中的CGRect结构体

 @param width 宽数值
 @param _height 高数值
 @return 全居中的frame数值
 */
+(CGRect)centeredFrameWithWidth:(float)width height:(float)_height;

@end
