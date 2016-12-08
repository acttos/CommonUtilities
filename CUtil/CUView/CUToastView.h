//
//  CUToastView.h
//  CUtil
//
//  Created by Acttos on 8/12/2016.
//  Copyright © 2016 Acttos.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CUToastView : UIView

@property (nonatomic, readonly) UILabel* messageLabel;

/**
 *  在给定的view中显示一个类似于Android Toast效果的弹框。
 *
 *  @param view     弹框的父视图容器View
 *  @param message  弹框需要显示的文字内容
 *  @param _duration Toast消失过程持续的时间，单位：秒
 *  @param _delay    Toast持续显示的时间，单位：秒
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

@end
