//
//  CUToastView.m
//  CUtil
//
//  Created by Acttos on 8/12/2016.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.

//

#import "CUToastView.h"
#import "CUTipsView.h"
#import "CULabel.h"

@implementation CUToastView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _messageLabel = [[UILabel alloc] init];//WithFrame:CGRectMake(10.0f, 0.0f, CGRectGetWidth(frame) - 20.0f, CGRectGetHeight(frame))];
        _messageLabel.textColor = [UIColor whiteColor];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:16.0f];
        _messageLabel.numberOfLines = 0;
        [self addSubview:_messageLabel];
        
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8f];
        self.layer.borderWidth = 1.0f;
        self.layer.borderColor = [[[UIColor grayColor] colorWithAlphaComponent:0.5f] CGColor];
        self.layer.cornerRadius = 6.0f;
    }
    return self;
}

/**
 Make sure to invoke this method AFTER setting the text for _messageLabel.
 */
-(void)updateLayoutOfMessageLabel {
    CGSize size = [CULabel sizeOfLabel:self.messageLabel inView:self];
    self.messageLabel.frame = CGRectMake(10, (CGRectGetHeight(self.frame) - size.height) / 2, CGRectGetWidth(self.frame) - 20, size.height);
}

+ (void)showToastInView:(UIView *)view withMessage:(NSString *)message duration:(float)_duration delay:(float)_delay {
    UIView *toastContainerView = [view viewWithTag:kDefault_Tag_4_Toast_View];
    if (toastContainerView == nil) {
        toastContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame))];
        toastContainerView.tag = kDefault_Tag_4_Toast_View;
        
        CUToastView *toastView = [[CUToastView alloc] initWithFrame:CGRectMake(40, view.frame.size.height / 3, view.frame.size.width - 80, 100)];
        toastView.messageLabel.text = message;
        [toastView updateLayoutOfMessageLabel];
        
        [toastContainerView addSubview:toastView];
        [view addSubview:toastContainerView];
        
        [UIView animateWithDuration:_duration delay:_delay options:UIViewAnimationOptionCurveEaseOut animations:^{
            toastView.alpha = 0.0f;
        } completion:^(BOOL finished) {
            [toastView removeFromSuperview];
            [toastContainerView removeFromSuperview];
        }];
    } else {
        [toastContainerView removeFromSuperview];
        [CUToastView showToastInView:view withMessage:message duration:_duration delay:_delay];
    }
}

+ (void)showToastInView:(UIView *)view withFrame:(CGRect)frame message:(NSString *)_message duration:(float)_duration delay:(float)_delay {
    UIView *toastContainerView = [view viewWithTag:kDefault_Tag_4_Toast_View];
    if (toastContainerView == nil) {
        toastContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame))];
        toastContainerView.tag = kDefault_Tag_4_Toast_View;
        
        CUToastView *toastView = [[CUToastView alloc] initWithFrame:frame];
        toastView.messageLabel.text = _message;
        
        [toastContainerView addSubview:toastView];
        [view addSubview:toastContainerView];
        
        [UIView animateWithDuration:_duration delay:_delay options:UIViewAnimationOptionCurveEaseOut animations:^{
            toastView.alpha = 0.0f;
        } completion:^(BOOL finished) {
            [toastView removeFromSuperview];
            [toastContainerView removeFromSuperview];
        }];
    } else {
        [toastContainerView removeFromSuperview];
        [CUToastView showToastInView:view withFrame:frame message:_message duration:_duration delay:_delay];
    }
}

@end
