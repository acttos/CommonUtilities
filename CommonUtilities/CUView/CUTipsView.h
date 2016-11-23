//
//  CUTipsView.h
//  CommonUtilities
//
//  Created by Acttos on 23/11/2016.
//  Copyright © 2016 Acttos.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kUserCenter_PopDownTipsViewTag 9876001
#define kUserCenter_WithdrawProcessingViewTag 9876002
#define kUserCenter_InAppPurchaseProcessingViewTag 9876003

typedef enum:NSUInteger{
    PopDownTipsViewType_Default,
    PopDownTipsViewType_Message,
    PopDownTipsViewType_PositiveIconWithMessage,
    PopDownTipsViewType_NagtiveIconWithMessage,
    PopDownTipsViewType_WarningIconWithMessage,
    PopDownTipsViewType_ApplePurchase_Succeed
} PopDownTipsViewType;

@interface CUTipsView : NSObject

+(void)showWaitingViewWithTag:(NSUInteger)tag message:(NSString *)_message;

+(void)showPopDownTipsViewWithTag:(NSUInteger)tag yOffset:(CGFloat)_yOffset image:(UIImage *)aImage message:(NSString *)aMessage inView:(UIView *)view;
+(void)showPopDownTipsViewWithTag:(NSUInteger)tag yOffset:(CGFloat)_yOffset type:(PopDownTipsViewType)type image:(UIImage *)aImage message:(NSString *)aMessage subMessage:(NSString *)aSubMessage inView:(UIView *)view;

+(void)hideViewInWindowWithTag:(NSUInteger)tag;

@end
