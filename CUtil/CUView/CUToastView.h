//
//  CUToastView.h
//  CUtil
//
//  Created by Acttos on 8/12/2016.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.

//

#import <UIKit/UIKit.h>

@interface CUToastView : UIView

@property (nonatomic, readonly) UILabel* messageLabel;

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
 */+ (void)showToastInView:(UIView *)view withFrame:(CGRect)frame message:(NSString *)_message duration:(float)_duration delay:(float)_delay;

@end
