//
//  CUTipsView.m
//  CommonUtilities
//
//  Created by Acttos on 23/11/2016.
//  Copyright © 2016 Acttos.org. All rights reserved.
//

#import "CUTipsView.h"
#import "CULabel.h"

@implementation CUTipsView

+(void)showWaitingViewWithTag:(NSUInteger)tag message:(NSString *)_message {
    UIWindow *currentWindow = [UIApplication sharedApplication].keyWindow;
    UIView *waitingViewContainerView = [currentWindow viewWithTag:tag];
    if (waitingViewContainerView == nil) {
        waitingViewContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(currentWindow.frame), CGRectGetHeight(currentWindow.frame))];
        waitingViewContainerView.tag = tag;
        waitingViewContainerView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.8];//黑色，80%透明度
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [indicatorView startAnimating];
        indicatorView.center = CGPointMake(currentWindow.center.x, currentWindow.center.y - 40);
        [waitingViewContainerView addSubview:indicatorView];
        
        if (_message) {
            UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(indicatorView.frame) + 20, currentWindow.bounds.size.width, 20)];
            messageLabel.font = [UIFont systemFontOfSize:20.0f];
            messageLabel.textAlignment = NSTextAlignmentCenter;
            messageLabel.textColor = [UIColor whiteColor];
            messageLabel.text = _message;
            [waitingViewContainerView addSubview:messageLabel];
        }
        
        [currentWindow addSubview:waitingViewContainerView];
    } else {
        [waitingViewContainerView removeFromSuperview];
        [CUTipsView showWaitingViewWithTag:tag message:_message];
    }
}

+(void)hideViewInWindowWithTag:(NSUInteger)tag {
    UIWindow *currentWindow = [UIApplication sharedApplication].keyWindow;
    UIView *waitingViewContainerView = [currentWindow viewWithTag:tag];
    if (waitingViewContainerView) {
        [waitingViewContainerView removeFromSuperview];
    }
}

+(void)showPopDownTipsViewWithTag:(NSUInteger)tag yOffset:(CGFloat)_yOffset image:(UIImage *)aImage message:(NSString *)aMessage inView:(UIView *)view {
    if (!aMessage) {
        return;
    }
    
    UIView *containerView = view;
    if (!containerView) {
        containerView = [UIApplication sharedApplication].keyWindow;
    }
    
    UIView *popDownTipsView = [containerView viewWithTag:tag];
    if (popDownTipsView == nil) {
        popDownTipsView = [[UIView alloc] initWithFrame:CGRectMake(0, _yOffset, CGRectGetWidth(containerView.frame), 64)];
        popDownTipsView.tag = tag;
        popDownTipsView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.8];//黑色，80%透明度
        
        UILabel *messageLabel = nil;
        if (aMessage) {
            //添加消息Label
            messageLabel = [[UILabel alloc] init];
            messageLabel.font = [UIFont systemFontOfSize:17.0f];
            messageLabel.textAlignment = NSTextAlignmentLeft;
            messageLabel.textColor = [UIColor whiteColor];
            messageLabel.text = aMessage;
            //计算Label的CGSize
            CGSize retSize = [CULabel sizeOfLabel:messageLabel inView:popDownTipsView];
            
            messageLabel.frame = CGRectMake((CGRectGetWidth(popDownTipsView.frame) - retSize.width) / 2, (CGRectGetHeight(popDownTipsView.frame) - retSize.height) / 2, retSize.width, retSize.height);
            [popDownTipsView addSubview:messageLabel];
        }
        
        if (messageLabel && aImage) {
            //添加图标
            messageLabel.frame = CGRectMake(messageLabel.frame.origin.x + (5 + 22) / 2, messageLabel.frame.origin.y, messageLabel.frame.size.width, messageLabel.frame.size.height);
            UIImageView *iconImageView = [[UIImageView alloc] initWithImage:aImage];
            iconImageView.frame = CGRectMake(CGRectGetMinX(messageLabel.frame) - (5 + 22), (CGRectGetHeight(popDownTipsView.frame) - 22) / 2, 22, 22);
            
            [popDownTipsView addSubview:iconImageView];
        }
        
        [containerView addSubview:popDownTipsView];
        /** 向下弹出动画 */
        CGPoint orignalCenter = CGPointMake(popDownTipsView.center.x, -32);
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            popDownTipsView.center = CGPointMake(popDownTipsView.center.x, _yOffset + popDownTipsView.frame.size.height / 2);
        } completion:^(BOOL finished) {
            if (finished) {
                [UIView animateWithDuration:0.25 delay:3.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                    popDownTipsView.center = orignalCenter;
                } completion:^(BOOL finished) {
                    if (finished) {
                        popDownTipsView.hidden = YES;
                        [popDownTipsView removeFromSuperview];
                    }
                }];
            }
        }];
    } else {
        [popDownTipsView removeFromSuperview];
        [CUTipsView showPopDownTipsViewWithTag:tag yOffset:_yOffset image:aImage message:aMessage inView:view];
    }
}

+(void)showPopDownTipsViewWithTag:(NSUInteger)tag yOffset:(CGFloat)_yOffset type:(PopDownTipsViewType)type image:(UIImage *)aImage message:(NSString *)aMessage subMessage:(NSString *)aSubMessage inView:(UIView *)view {
    switch (type) {
        case PopDownTipsViewType_ApplePurchase_Succeed:
            [CUTipsView showPopDownTipsViewWithTag:tag yOffset:_yOffset image:aImage message:aMessage inView:view];
            break;
        case PopDownTipsViewType_Default:
            [CUTipsView showPopDownTipsViewWithTag:tag yOffset:_yOffset image:aImage message:aMessage inView:view];
            break;
        case PopDownTipsViewType_Message:
            [CUTipsView showPopDownTipsViewWithTag:tag yOffset:_yOffset image:nil message:aMessage inView:view];
            break;
        case PopDownTipsViewType_NagtiveIconWithMessage: {
            UIImage *nagtiveIcon = [UIImage imageNamed:@"failure_tips_icon.png"];
            [CUTipsView showPopDownTipsViewWithTag:tag yOffset:_yOffset image:nagtiveIcon message:aMessage inView:view];
            break;
        }
        case PopDownTipsViewType_PositiveIconWithMessage: {
            UIImage *postitiveIcon = [UIImage imageNamed:@"succeed_tips_icon.png"];
            [CUTipsView showPopDownTipsViewWithTag:tag yOffset:_yOffset image:postitiveIcon message:aMessage inView:view];
            break;
        }
        case PopDownTipsViewType_WarningIconWithMessage: {
            UIImage *warningIcon = [UIImage imageNamed:@"warning_tips_icon.png"];
            [CUTipsView showPopDownTipsViewWithTag:tag yOffset:_yOffset image:warningIcon message:aMessage inView:view];
            break;
        }
            
        default:
            break;
    }
}

@end
