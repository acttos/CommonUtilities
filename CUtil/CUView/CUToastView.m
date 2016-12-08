//
//  CUToastView.m
//  CUtil
//
//  Created by Acttos on 8/12/2016.
//  Copyright © 2016 Acttos.org. All rights reserved.
//

#import "CUToastView.h"

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

@end
