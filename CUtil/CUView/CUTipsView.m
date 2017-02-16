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
#import "CUDefine.h"
#import "CUToastView.h"

@implementation CUTipsView

+ (void)showToastInView:(UIView *)view withMessage:(NSString *)message duration:(float)_duration delay:(float)_delay {
    [CUToastView showToastInView:view withMessage:message duration:_duration delay:_delay];
}

+ (void)showToastInView:(UIView *)view withFrame:(CGRect)frame message:(NSString *)_message duration:(float)_duration delay:(float)_delay {
    [CUToastView showToastInView:view withFrame:frame message:_message duration:_duration delay:_delay];
}

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
        } else {
            indicatorView.center = CGPointMake(currentWindow.center.x, currentWindow.center.y);
        }
        
        [currentWindow addSubview:waitingViewContainerView];
    } else {
        [waitingViewContainerView removeFromSuperview];
        [CUTipsView showFullScreenWaitingViewWithTag:tag message:_message];
    }
}

+(void)showFullScreenWaitingViewInView:(UIView *)view message:(NSString *)_message {
    UIView *waitingViewContainerView = [view viewWithTag:kDefault_Tag_4_Waiting_View];
    if (waitingViewContainerView == nil) {
        waitingViewContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame))];
        waitingViewContainerView.tag = kDefault_Tag_4_Waiting_View;
        waitingViewContainerView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.7];//黑色，70%透明度
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [indicatorView startAnimating];
        indicatorView.center = CGPointMake(view.center.x, view.center.y - 40);
        [waitingViewContainerView addSubview:indicatorView];
        
        if (_message) {
            UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(indicatorView.frame) + 20, view.bounds.size.width, 60)];
            messageLabel.font = [UIFont systemFontOfSize:20.0f];
            messageLabel.textAlignment = NSTextAlignmentCenter;
            messageLabel.textColor = [UIColor whiteColor];
            messageLabel.text = _message;
            messageLabel.numberOfLines = 0;
            [waitingViewContainerView addSubview:messageLabel];
        } else {
            indicatorView.center = CGPointMake(view.center.x, view.center.y);
        }
        
        [view addSubview:waitingViewContainerView];
    } else {
        [waitingViewContainerView removeFromSuperview];
        [CUTipsView showFullScreenWaitingViewWithTag:kDefault_Tag_4_Waiting_View message:_message];
    }
}

+(void)showWaitingViewWithTag:(NSUInteger)tag frame:(CGRect)_frame message:(NSString *)_message {
    [CUTipsView showWaitingViewWithTag:tag frame:_frame message:_message theme:CUTipsViewThemeDark];
}

+(void)showWaitingViewWithTag:(NSUInteger)tag frame:(CGRect)_frame message:(NSString *)_message theme:(CUTipsViewTheme)_theme {
    UIWindow *currentWindow = [UIApplication sharedApplication].keyWindow;
    UIView *waitingViewContainerView = [currentWindow viewWithTag:tag];
    if (waitingViewContainerView == nil) {
        waitingViewContainerView = [[UIView alloc] initWithFrame:currentWindow.bounds];
        waitingViewContainerView.userInteractionEnabled = YES;
        waitingViewContainerView.tag = tag;
        
        UIView *waitingView = [[UIView alloc] initWithFrame:_frame];
        CGFloat whiteColorFloatValue = _theme == CUTipsViewThemeDark ? 0.0f : 1.0f;
        waitingView.backgroundColor = [UIColor colorWithWhite:whiteColorFloatValue alpha:0.7];
        waitingView.layer.borderWidth = 1.0f;
        waitingView.layer.borderColor = [[[UIColor grayColor] colorWithAlphaComponent:0.5f] CGColor];
        waitingView.layer.cornerRadius = 10;
        waitingView.layer.masksToBounds = YES;
        
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:_theme == CUTipsViewThemeDark ? UIActivityIndicatorViewStyleWhite : UIActivityIndicatorViewStyleGray];
        [indicatorView startAnimating];
        indicatorView.center = indicatorView.center = CGPointMake(CGRectGetWidth(waitingView.frame) / 2, 32);
        [waitingView addSubview:indicatorView];
        
        if (_message) {
            UILabel *messageLabel = [[UILabel alloc] init];
            messageLabel.font = [UIFont systemFontOfSize:18.0f];
            messageLabel.textAlignment = NSTextAlignmentCenter;
            messageLabel.textColor = _theme == CUTipsViewThemeDark ? [UIColor whiteColor] : [UIColor blackColor];
            messageLabel.text = _message;
            messageLabel.numberOfLines = 0;
            
            [waitingView addSubview:messageLabel];
            
            CGSize size = [CULabel sizeOfLabel:messageLabel inView:waitingView];
            messageLabel.frame = CGRectMake(10, CGRectGetMaxY(indicatorView.frame) + 10, waitingView.frame.size.width - 20, size.height);
        } else {
            indicatorView.center = CGPointMake(CGRectGetWidth(waitingView.frame) / 2, CGRectGetHeight(waitingView.frame) / 2);
        }
        
        [waitingViewContainerView addSubview:waitingView];
        [currentWindow addSubview:waitingViewContainerView];
    } else {
        [waitingViewContainerView removeFromSuperview];
        [CUTipsView showWaitingViewWithTag:tag frame:_frame message:_message theme:_theme];
    }
}

+(void)showWaitingViewInView:(UIView *)view frame:(CGRect)_frame message:(NSString *)_message {
    [CUTipsView showWaitingViewInView:view frame:_frame message:_message theme:CUTipsViewThemeDark];
}

+(void)showWaitingViewInView:(UIView *)view frame:(CGRect)_frame message:(NSString *)_message theme:(CUTipsViewTheme)_theme {
    UIView *waitingViewContainerView = [view viewWithTag:kDefault_Tag_4_Waiting_View];
    if (waitingViewContainerView == nil) {
        waitingViewContainerView = [[UIView alloc] initWithFrame:view.bounds];
        waitingViewContainerView.userInteractionEnabled = YES;
        waitingViewContainerView.tag = kDefault_Tag_4_Waiting_View;
        
        UIView *waitingView = [[UIView alloc] initWithFrame:_frame];
        CGFloat whiteColorFloatValue = _theme == CUTipsViewThemeDark ? 0.0f : 1.0f;
        waitingView.backgroundColor = [UIColor colorWithWhite:whiteColorFloatValue alpha:0.7];
        waitingView.layer.borderWidth = 1.0f;
        waitingView.layer.borderColor = [[[UIColor grayColor] colorWithAlphaComponent:0.5f] CGColor];
        waitingView.layer.cornerRadius = 10;
        waitingView.layer.masksToBounds = YES;
        
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:_theme == CUTipsViewThemeDark ? UIActivityIndicatorViewStyleWhite : UIActivityIndicatorViewStyleGray];
        [indicatorView startAnimating];
        indicatorView.center = indicatorView.center = CGPointMake(CGRectGetWidth(waitingView.frame) / 2, 32);
        [waitingView addSubview:indicatorView];
        
        if (_message) {
            UILabel *messageLabel = [[UILabel alloc] init];
            messageLabel.font = [UIFont systemFontOfSize:18.0f];
            messageLabel.textAlignment = NSTextAlignmentCenter;
            messageLabel.textColor = _theme == CUTipsViewThemeDark ? [UIColor whiteColor] : [UIColor blackColor];
            messageLabel.text = _message;
            messageLabel.numberOfLines = 0;
            
            [waitingView addSubview:messageLabel];
            
            CGSize size = [CULabel sizeOfLabel:messageLabel inView:waitingView];
            messageLabel.frame = CGRectMake(10, CGRectGetMaxY(indicatorView.frame) + 10, waitingView.frame.size.width - 20, size.height);
        } else {
            indicatorView.center = CGPointMake(CGRectGetWidth(waitingView.frame) / 2, CGRectGetHeight(waitingView.frame) / 2);
        }
        
        [waitingViewContainerView addSubview:waitingView];
        [view addSubview:waitingViewContainerView];
    } else {
        [waitingViewContainerView removeFromSuperview];
        [CUTipsView showWaitingViewInView:view frame:_frame message:_message theme:_theme];
    }
}

+(void)showActivityIndicatorInView:(UIView *)view center:(CGPoint)_center theme:(CUTipsViewTheme)_theme {
    UIView *indicatorViewContainerView = [view viewWithTag:kDefault_Tag_4_Indicator_View];
    if (indicatorViewContainerView == nil) {
        indicatorViewContainerView = [[UIView alloc] initWithFrame:view.bounds];
        CGFloat whiteColorFloatValue = _theme == CUTipsViewThemeDark ? 0.0f : 1.0f;
        indicatorViewContainerView.backgroundColor = [UIColor colorWithWhite:whiteColorFloatValue alpha:0.7];
        indicatorViewContainerView.userInteractionEnabled = YES;
        indicatorViewContainerView.tag = kDefault_Tag_4_Indicator_View;
        
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:_theme == CUTipsViewThemeDark ? UIActivityIndicatorViewStyleWhite : UIActivityIndicatorViewStyleGray];
        indicatorView.center = _center;
        CGAffineTransform scaledTransform = CGAffineTransformMakeScale(1.3f, 1.3f);
        indicatorView.transform = scaledTransform;
        [indicatorView startAnimating];
    
        [indicatorViewContainerView addSubview:indicatorView];
        [view addSubview:indicatorViewContainerView];
    } else {
        [indicatorViewContainerView removeFromSuperview];
        [CUTipsView showActivityIndicatorInView:view center:_center theme:_theme];
    }
}

+(void)showPopDownTipsViewInView:(UIView *)view withImage:(UIImage *)aImage message:(NSString *)aMessage yOffset:(CGFloat)_yOffset {
    if (!view) {
        Logger(@"The param 'view' is as the container of this PopDownTipsView, it can NOT be nil.");
        return;
    }
    
    if (!aMessage || [aMessage isEqualToString:@""]) {
        Logger(@"The message should be in the PopDownTipsView, it can NOT be nil or empty.");
        return;
    }
    
    UIView *popDownTipsView = [view viewWithTag:kDefault_Tag_4_Pop_Down_Tips_View];
    if (popDownTipsView == nil) {
        popDownTipsView = [[UIView alloc] initWithFrame:CGRectMake(0, _yOffset, CGRectGetWidth(view.frame), 64)];
        popDownTipsView.tag = kDefault_Tag_4_Pop_Down_Tips_View;
        popDownTipsView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.8];//黑色，80%透明度
        
        //添加消息Label
        UILabel *messageLabel = [[UILabel alloc] init];
        messageLabel.font = [UIFont systemFontOfSize:17.0f];
        messageLabel.textAlignment = NSTextAlignmentLeft;
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.text = aMessage;
        //计算Label的CGSize
        CGSize retSize = [CULabel sizeOfLabel:messageLabel inView:popDownTipsView];
        
        messageLabel.frame = CGRectMake((CGRectGetWidth(popDownTipsView.frame) - retSize.width) / 2, (CGRectGetHeight(popDownTipsView.frame) - retSize.height) / 2, retSize.width, retSize.height);
        [popDownTipsView addSubview:messageLabel];
        
        if (aImage) {
            //添加图标
            messageLabel.frame = CGRectMake(messageLabel.frame.origin.x + (5 + 22) / 2, messageLabel.frame.origin.y, messageLabel.frame.size.width, messageLabel.frame.size.height);
            UIImageView *iconImageView = [[UIImageView alloc] initWithImage:aImage];
            iconImageView.frame = CGRectMake(CGRectGetMinX(messageLabel.frame) - (5 + 22), (CGRectGetHeight(popDownTipsView.frame) - 22) / 2, 22, 22);
            
            [popDownTipsView addSubview:iconImageView];
        }
        
        [view addSubview:popDownTipsView];
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
        [CUTipsView showPopDownTipsViewInView:view withImage:aImage message:aMessage yOffset:_yOffset];
    }
}

+(void)hideViewInWindowWithTag:(NSUInteger)tag {
    UIWindow *currentWindow = [UIApplication sharedApplication].keyWindow;
    UIView *tagedView = [currentWindow viewWithTag:tag];
    if (tagedView) {
        [CUTipsView _hideView:tagedView];
    }
}

+(void)hideWaitingViewInView:(UIView *)view {
    UIView *tagedView = [view viewWithTag:kDefault_Tag_4_Waiting_View];
    if (tagedView) {
        [CUTipsView _hideView:tagedView];
    }
}

+(void)hideActivityIndicatorInView:(UIView *)view {
    UIView *tagedView = [view viewWithTag:kDefault_Tag_4_Indicator_View];
    if (tagedView) {
        [CUTipsView _hideView:tagedView];
    }
}

+(CGRect)centeredFrameWithWidth:(float)width height:(float)_height {
    CGRect screen = [UIScreen mainScreen].bounds;
    CGRect result = CGRectMake((screen.size.width - width) / 2, (screen.size.height - _height) / 2, width, _height);
    
    return result;
}

+(void)_hideView:(UIView *)view {
    [UIView animateWithDuration:0.25 animations:^{
        view.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [view removeFromSuperview];
    }];
}

@end
