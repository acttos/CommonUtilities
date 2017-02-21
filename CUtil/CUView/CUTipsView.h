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
 Defined theme types of CUTipsView.
 */
typedef enum {
    CUTipsViewThemeDark = 1, //The default value.
    CUTipsViewThemeLight
} CUTipsViewTheme;

@interface CUTipsView : NSObject

/**
 Show up a tost view (like on Android) with message and time.
 
 @param view     The super view of the toast view
 @param message  The message shown in the toast view
 @param _duration The time of disappearance, Unit: second
 @param _delay    The time of delay, means the time seconds of showing of the toast, Unit: second
 */
+ (void)showToastInView:(UIView *)view withMessage:(NSString *)message duration:(float)_duration delay:(float)_delay;

/**
 Show up a tost view (like on Android) with message, frame and time.
 
 @param view     The super view of the toast view
 @param frame    The frame of the toast view
 @param _message  The message shown in the toast view
 @param _duration The time of disappearance, Unit: second
 @param _delay    The time of delay, means the time seconds of showing of the toast, Unit: second
 */
+ (void)showToastInView:(UIView *)view withFrame:(CGRect)frame message:(NSString *)_message duration:(float)_duration delay:(float)_delay;

/**
 Show up an animating UIActivityIndicator in full screen with message.
 
 @param tag The tag of the view, for later use: hiding or removing
 @param _message The message to show
 @warning This method can NOT be used in Extension apps, because the UIWindow instance can NOT be instantiated.
 */
+(void)showFullScreenWaitingViewWithTag:(NSUInteger)tag message:(NSString *)_message;

/**
 Show up an animating UIActivityIndicator view in full screen with a super view as container. The waiting view uses the default tag defined.
 The full screen here means the waiting view fills full of the super view. When you need to hide this waiting view, just call [CUTipsView hideWaitingViewInView:].

 @param view The super view of waiting view
 @param _message The message shows up.
 */
+(void)showFullScreenWaitingViewInView:(UIView *)view message:(NSString *)_message;

/**
 Show up a waiting view with a certain tag, frame, message and an UIActivityIndicator view.
 
 @param tag The tag of the waiting view, for later hiding or removing.
 @param _frame The frame of the waiting view.
 @param _message The message to show.
 @warning This method can NOT be used in Extension apps, because the UIWindow instance can NOT be instantiated.
 */
+(void)showWaitingViewWithTag:(NSUInteger)tag frame:(CGRect)_frame message:(NSString *)_message;

/**
 Show up a waiting view with a certain tag, frame, message, theme and an UIActivityIndicator view.
 
 @param tag The tag of the waiting view, for later hiding or removing.
 @param _frame The frame of the waiting view.
 @param _message The message to show.
 @param _theme  The theme of the waiting view.
 @warning This method can NOT be used in Extension apps, because the UIWindow instance can NOT be instantiated.
 */
+(void)showWaitingViewWithTag:(NSUInteger)tag frame:(CGRect)_frame message:(NSString *)_message theme:(CUTipsViewTheme)_theme;

/**
 Show up a waiting view in a given super view with frame and message.
 
 @param view The super view to contain the waiting view.
 @param _frame The frame of the waiting view.
 @param _message The message to show.
 */
+(void)showWaitingViewInView:(UIView *)view frame:(CGRect)_frame message:(NSString *)_message;

/**
 Show up a waiting view in a given super view with frame, message and theme.
 
 @param view The super view to contain the waiting view.
 @param _frame The frame of the waiting view.
 @param _message The message to show.
 @param _theme  The theme of the waiting view.
 */
+(void)showWaitingViewInView:(UIView *)view frame:(CGRect)_frame message:(NSString *)_message theme:(CUTipsViewTheme)_theme;

/**
 Show up an UIActivityIndicator view in a super view with a center point and theme

 @param view The super view of the waiting view
 @param _center The center point of the UIActivityIndicator view
 @param _theme The theme of the waiting view.
 */
+(void)showActivityIndicatorInView:(UIView *)view center:(CGPoint)_center theme:(CUTipsViewTheme)_theme;

/**
 Show a 'PopDown' alert tips view from the top of the given view with an optional image, a message and an offset of vertical.
 
 @param view The super view of the alert tips view.
 @param aImage The image of the alert tips view, placed at the left side of the message label.
 @param aMessage The message to show.
 @param _yOffset The vertical offset of the alert tips view, usually set it to be 0.0f.
 */
+(void)showPopDownTipsViewInView:(UIView *)view withImage:(UIImage *)aImage message:(NSString *)aMessage yOffset:(CGFloat)_yOffset;

/**
 Hide and remove a view from UIWindow with a tag.
 
 @param tag The tag of view to hide and remove.
 */
+(void)hideViewInWindowWithTag:(NSUInteger)tag;

/**
 Hide and remove the waiting view from super view

 @param view The super view of the waiting view.
 */
+(void)hideWaitingViewInView:(UIView *)view;

/**
 Hide the Activity Indicator view

 @param view The container view of Activity Indicator
 */
+(void)hideActivityIndicatorInView:(UIView *)view;

/**
 Return a centered frame's rect with the given width and height.

 @param width The width of the rect
 @param _height The height of the rect
 @return An centered frame's rect.
 */
+(CGRect)centeredFrameWithWidth:(float)width height:(float)_height;

@end
