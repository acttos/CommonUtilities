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

#define kPop_Down_Tips_View_Default_Tag 90158396

@interface CUTipsView : NSObject

/**
 已全屏幕的方式展现出一个带有转动菊花的Waiting视图
 
 @param tag 视图对应的tag，方便隐藏时使用
 @param _message Waiting视图中显示的文字消息
 @warning 本方法不能应用在Extension中，因为获取不到UIWindow.keyWindo.
 */
+(void)showFullScreenWaitingViewWithTag:(NSUInteger)tag message:(NSString *)_message;

/**
 显示一个根据给定frame生成的带有转动菊花的Waiting视图
 
 @param tag 视图对应的tag，方便隐藏时使用
 @param _frame 视图整体的大小和位置参数
 @param _message Waiting视图中显示的文字消息
 @warning 本方法不能应用在Extension中，因为获取不到UIWindow.keyWindo.
 */
+(void)showWaitingViewWithTag:(NSUInteger)tag frame:(CGRect)_frame message:(NSString *)_message;

/**
 在视图顶部显示的一个Tips视图，可包含文字和图片，该Tips视图会自动以向上滑出的方式消失
 
 @param _yOffset Tips视图距离屏幕顶部的偏移量，一般为0.0f
 @param aImage Tips视图中的图片，位于aMessage的左侧
 @param aMessage Tips视图中显示的文字消息
 @param view Tips视图的父View
 */
+(void)showPopDownTipsViewWithImage:(UIImage *)aImage message:(NSString *)aMessage yOffset:(CGFloat)_yOffset inView:(UIView *)view;

/**
 隐藏某个tag对应的视图，并从父视图中移除
 
 @param tag 视图对应的tag
 */
+(void)hideViewInWindowWithTag:(NSUInteger)tag;


/**
 根据宽和高生成一个在屏幕（Screen）上下左右居中的CGRect结构体

 @param width 宽数值
 @param _height 高数值
 @return 全居中的frame数值
 */
+(CGRect)centeredFrameWithWidth:(float)width height:(float)_height;

@end
