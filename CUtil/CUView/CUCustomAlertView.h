//
//  CUCustomAlertView.h
//  CUtil
//
//  Created by Acttos on 24/03/2017.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.
//

#import <UIKit/UIKit.h>

@interface CUCustomAlertView : UIView


/**
 Initialize a custom alert view which is different from UCAlertView.

 @param title The title of the alert view.
 @param image The image of the alert view.
 @param message The content message of the alert view.
 @param leftBtnText The button text of left button.
 @param leftBtnTextColor The text color of left button.
 @param leftClickedBlock The click block of the left button.
 @param rightBtnText The button text of right button.
 @param rightBtnTextColor The text color of right button.
 @param rightClickedBlock The click block of the right button.
 @return The CUCustomAlertView instance.
 */
-(nullable instancetype)initWithTitle:(nullable NSString *)title
                       image:(nullable UIImage *)image
                     message:(nonnull NSString *)message
              leftButtonText:(nullable NSString *)leftBtnText
         leftButtonTextColor:(nullable UIColor *)leftBtnTextColor
                 leftClicked:(nullable void(^)(void))leftClickedBlock
             rightButtonText:(nonnull NSString *)rightBtnText
            rightButtonColor:(nullable UIColor *)rightBtnTextColor
                rightClicked:(nonnull void(^)(void))rightClickedBlock;

/**
 Show up the alert view after got the instance. This method must be invoked to display the alert view.
 */
-(void)show;

@end
