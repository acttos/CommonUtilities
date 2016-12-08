//
//  CUToastView.m
//  CUtil
//
//  Created by Acttos on 8/12/2016.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.

//

#import "CUToastView.h"
#import "CUDefine.h"

@implementation CUToastView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(5.0f, 0.0f, CGRectGetWidth(frame) - 10.0f, CGRectGetHeight(frame))];
        _messageLabel.textColor = [UIColor whiteColor];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:16.0f];
        _messageLabel.numberOfLines = 0;
        [self addSubview:_messageLabel];
        
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8f];
        self.layer.cornerRadius = 6.0f;
    }
    return self;
}

+ (void)showToastInView:(UIView *)view withMessage:(NSString *)message duration:(float)_duration delay:(float)_delay {
    UIView *toastContainerView = [view viewWithTag:kDefault_Tag_4_Toast_View];
    if (toastContainerView == nil) {
        toastContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame))];
        toastContainerView.tag = kDefault_Tag_4_Toast_View;
        [view addSubview:toastContainerView];
    }
    
    CUToastView *toastView = (CUToastView *)[toastContainerView viewWithTag:kDefault_Tag_4_Toast_View + 100];
    if (toastView == nil) {
        toastView = [[CUToastView alloc] initWithFrame:CGRectMake(40, view.frame.size.height / 3, view.frame.size.width - 80, 100)];
        toastView.tag = kDefault_Tag_4_Toast_View + 100;
        toastView.messageLabel.text = message;
        
        [toastContainerView addSubview:toastView];
    } else {
        toastView.messageLabel.text = message;
    }
    
    [UIView animateWithDuration:_duration delay:_delay options:UIViewAnimationOptionCurveEaseOut animations:^{
        toastView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [toastView removeFromSuperview];
        [toastContainerView removeFromSuperview];
    }];
}

+ (void)showToastInView:(UIView *)view withFrame:(CGRect)frame message:(NSString *)_message duration:(float)_duration delay:(float)_delay {
    UIView *toastContainerView = [view viewWithTag:kDefault_Tag_4_Toast_View];
    if (toastContainerView == nil) {
        toastContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame))];
        toastContainerView.tag = kDefault_Tag_4_Toast_View;
        [view addSubview:toastContainerView];
    }
    
    CUToastView *toastView = (CUToastView *)[toastContainerView viewWithTag:kDefault_Tag_4_Toast_View + 100];
    if (toastView == nil) {
        toastView = [[CUToastView alloc] initWithFrame:frame];
        toastView.tag = kDefault_Tag_4_Toast_View + 100;
        toastView.messageLabel.text = _message;
        
        [toastContainerView addSubview:toastView];
    } else {
        toastView.messageLabel.text = _message;
    }
    
    [UIView animateWithDuration:_duration delay:_delay options:UIViewAnimationOptionCurveEaseOut animations:^{
        toastView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [toastView removeFromSuperview];
        [toastContainerView removeFromSuperview];
    }];
}

@end
