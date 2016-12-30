//
//  CUAlertView.h
//  CUtil
//
//  Created by Acttos on 28/12/2016.
//  Copyright © 2016 Acttos.org. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    CUAlertViewThemeDefault,
    CUAlertViewThemePopDown,
    CUAlertViewThemePopUp
}CUAlertViewTheme;

@interface CUAlertView : UIView

@property (nonatomic, assign) NSString *title;
@property (nonatomic, assign) NSString *message;
@property (nonatomic, assign) NSString *leftBtnText;
@property (nonatomic, assign) NSString *rightBtnText;
@property (nonatomic, copy) void(^leftBtnClickedBlock)(void);
@property (nonatomic, copy) void(^rightBtnClickedBlock)(void);


/**
 Initialize a CUAlertView instance
 @warning Remember to invoke this method to initialize CUAlertView only.
 
 @param title The title texts in this alert view
 @param message The message texts in this alert view
 @param leftBtnText The texts of left button in this alert view
 @param leftClickedBlock The clicked-block of the left button in this alert view
 @param rightBtnText The texts of right button in this alert view
 @param rightClickedBlock The clicked-block of the right button in this alert view
 @return The instance of this CUAlertView.
 */
-(instancetype)initWithTitle:(NSString *)title
                     message:(NSString *)message
              leftButtonText:(NSString *)leftBtnText
                 leftClicked:(void(^)(void))leftClickedBlock
             rightButtonText:(NSString *)rightBtnText
                rightClicked:(void(^)(void))rightClickedBlock;

/**
 Invoke this method to show up the alert view
 */
-(void)show;

@end
