//
//  CUTipsView.m
//  CUtil
//
//  Created by Acttos on 23/11/2016.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.
//

#import "CUTipsView.h"
#import "CULabel.h"

@implementation CUTipsView

+(void)showFullScreenWaitingViewWithTag:(NSUInteger)tag message:(NSString *)_message {
    UIWindow *currentWindow = [UIApplication sharedApplication].keyWindow;
    UIView *waitingViewContainerView = [currentWindow viewWithTag:tag];
    if (waitingViewContainerView == nil) {
        waitingViewContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(currentWindow.frame), CGRectGetHeight(currentWindow.frame))];
        waitingViewContainerView.tag = tag;
        waitingViewContainerView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.7];//黑色，70%透明度
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [indicatorView startAnimating];
        indicatorView.center = CGPointMake(currentWindow.center.x, currentWindow.center.y - 40);
        [waitingViewContainerView addSubview:indicatorView];
        
        if (_message) {
            UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(indicatorView.frame) + 20, currentWindow.bounds.size.width, 60)];
            messageLabel.font = [UIFont systemFontOfSize:20.0f];
            messageLabel.textAlignment = NSTextAlignmentCenter;
            messageLabel.textColor = [UIColor whiteColor];
            messageLabel.text = _message;
            messageLabel.numberOfLines = 0;
            [waitingViewContainerView addSubview:messageLabel];
        }
        
        [currentWindow addSubview:waitingViewContainerView];
    } else {
        [waitingViewContainerView removeFromSuperview];
        [CUTipsView showFullScreenWaitingViewWithTag:tag message:_message];
    }
}

+(void)showWaitingViewWithTag:(NSUInteger)tag frame:(CGRect)_frame message:(NSString *)_message {
    UIWindow *currentWindow = [UIApplication sharedApplication].keyWindow;
    UIView *waitingViewContainerView = [currentWindow viewWithTag:tag];
    if (waitingViewContainerView == nil) {
        waitingViewContainerView = [[UIView alloc] initWithFrame:_frame];
        waitingViewContainerView.tag = tag;
        waitingViewContainerView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.7];//黑色，70%透明度
        waitingViewContainerView.layer.cornerRadius = 10;
        waitingViewContainerView.layer.masksToBounds = YES;
        
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [indicatorView startAnimating];
        indicatorView.center = CGPointMake(waitingViewContainerView.bounds.size.width / 2, waitingViewContainerView.bounds.size.height / 2 - 30);
        [waitingViewContainerView addSubview:indicatorView];
        
        if (_message) {
            UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(indicatorView.frame) + 15, waitingViewContainerView.bounds.size.width, 60)];
            messageLabel.font = [UIFont systemFontOfSize:20.0f];
            messageLabel.textAlignment = NSTextAlignmentCenter;
            messageLabel.textColor = [UIColor whiteColor];
            messageLabel.text = _message;
            messageLabel.numberOfLines = 0;
            
            [waitingViewContainerView addSubview:messageLabel];
        }
        
        [currentWindow addSubview:waitingViewContainerView];
    } else {
        [waitingViewContainerView removeFromSuperview];
        [CUTipsView showWaitingViewWithTag:tag frame:_frame message:_message];
    }
}

+(void)showWaitingViewInView:(UIView *)view withTag:(NSUInteger)tag frame:(CGRect)_frame message:(NSString *)_message {
    UIView *waitingViewContainerView = [view viewWithTag:tag];
    if (waitingViewContainerView == nil) {
        waitingViewContainerView = [[UIView alloc] initWithFrame:_frame];
        waitingViewContainerView.tag = tag;
        waitingViewContainerView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.7];//黑色，70%透明度
        waitingViewContainerView.layer.cornerRadius = 10;
        waitingViewContainerView.layer.masksToBounds = YES;
        
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [indicatorView startAnimating];
        indicatorView.center = CGPointMake(waitingViewContainerView.bounds.size.width / 2, waitingViewContainerView.bounds.size.height / 2 - 30);
        [waitingViewContainerView addSubview:indicatorView];
        
        if (_message) {
            UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(indicatorView.frame) + 15, waitingViewContainerView.bounds.size.width, 60)];
            messageLabel.font = [UIFont systemFontOfSize:20.0f];
            messageLabel.textAlignment = NSTextAlignmentCenter;
            messageLabel.textColor = [UIColor whiteColor];
            messageLabel.text = _message;
            messageLabel.numberOfLines = 0;
            
            [waitingViewContainerView addSubview:messageLabel];
        }
        
        [view addSubview:waitingViewContainerView];
    } else {
        [waitingViewContainerView removeFromSuperview];
        [CUTipsView showWaitingViewInView:view withTag:tag frame:_frame message:_message];
    }
}

+(void)showPopDownTipsViewWithImage:(UIImage *)aImage message:(NSString *)aMessage yOffset:(CGFloat)_yOffset inView:(UIView *)view {
    if (!aMessage) {
        return;
    }
    
    UIView *containerView = view;
    if (!containerView) {
        containerView = [UIApplication sharedApplication].keyWindow;
    }
    
    UIView *popDownTipsView = [containerView viewWithTag:kPop_Down_Tips_View_Default_Tag];
    if (popDownTipsView == nil) {
        popDownTipsView = [[UIView alloc] initWithFrame:CGRectMake(0, _yOffset, CGRectGetWidth(containerView.frame), 64)];
        popDownTipsView.tag = kPop_Down_Tips_View_Default_Tag;
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
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
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
        [CUTipsView showPopDownTipsViewWithImage:aImage message:aMessage yOffset:_yOffset inView:view];
    }
}

+(void)hideViewInWindowWithTag:(NSUInteger)tag {
    UIWindow *currentWindow = [UIApplication sharedApplication].keyWindow;
    UIView *waitingViewContainerView = [currentWindow viewWithTag:tag];
    if (waitingViewContainerView) {
        [waitingViewContainerView removeFromSuperview];
    }
}

+(CGRect)centeredFrameWithWidth:(float)width height:(float)_height {
    CGRect screen = [UIScreen mainScreen].bounds;
    CGRect result = CGRectMake((screen.size.width - width) / 2, (screen.size.height - _height) / 2, width, _height);
    
    return result;
}

@end
