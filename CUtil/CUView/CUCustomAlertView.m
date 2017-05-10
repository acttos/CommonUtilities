//
//  CUCustomAlertView.m
//  CUtil
//
//  Created by Acttos on 24/03/2017.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.
//

#import "CUCustomAlertView.h"

#import "CUColor.h"
#import "CULabel.h"
#import "CUDefine.h"
#import "NSString+CUString.h"

@interface CUCustomAlertView ()

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *leftBtnText;
@property (nonatomic, strong) UIColor *leftBtnTextColor;
@property (nonatomic, strong) NSString *rightBtnText;
@property (nonatomic, strong) UIColor *rightBtnTextColor;
@property (nonatomic, copy) void(^leftBtnClickedBlock)(void);
@property (nonatomic, copy) void(^rightBtnClickedBlock)(void);

@property(nonatomic, strong) UIView *mainAlertView;
@property(nonatomic, strong) UIView *contentView;
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic, strong) UILabel *messageLabel;
@property(nonatomic, strong) UIView *buttonsContainerView;
@property(nonatomic, strong) UIButton *leftButton;
@property(nonatomic, strong) UIButton *rightButton;

@end

@implementation CUCustomAlertView

-(instancetype)initWithTitle:(NSString *)title
                       image:(UIImage *)image
                     message:(NSString *)message
              leftButtonText:(NSString *)leftBtnText
         leftButtonTextColor:(UIColor *)leftBtnTextColor
                 leftClicked:(void(^)(void))leftClickedBlock
             rightButtonText:(NSString *)rightBtnText
            rightButtonColor:(UIColor *)rightBtnTextColor
                rightClicked:(void(^)(void))rightClickedBlock {

    if (self = [super init]) {
        self.title = title;
        self.image = image;
        self.message = message;
        self.leftBtnText = leftBtnText;
        self.leftBtnTextColor = leftBtnTextColor ? leftBtnTextColor : [CUColor colorWithHexString:@"#888888"];
        self.rightBtnText = rightBtnText;
        self.rightBtnTextColor = rightBtnTextColor ? rightBtnTextColor : [CUColor colorWithHexString:@"#EB9D04"];
        self.leftBtnClickedBlock = leftClickedBlock;
        self.rightBtnClickedBlock = rightClickedBlock;

        [self _initViews];

        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(_handleDeviceOrientationDidChangeNotification:)
                                                     name:UIDeviceOrientationDidChangeNotification
                                                   object:nil
         ];

        return self;
    }

    Logger(@"Failed to init CUCustomAlertView with '[super init]', maybe there is not enough memory left.");
    return nil;
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//MARK: - Private Methods for Initialization of UI
-(void)_initViews {
    /** Don't pay much attention to the frames of views below, the frames may be changed in '_updateViewsWith***Theme' methods */
    self.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height);
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];

    self.mainAlertView = [[UIView alloc] initWithFrame:CGRectMake(46, (kScreen_Height - 230) / 2 - 40, kScreen_Width - 46 * 2, 230)];
    self.mainAlertView.layer.cornerRadius = 14.0f;
    self.mainAlertView.layer.masksToBounds = YES;
    self.mainAlertView.userInteractionEnabled = YES;

    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.mainAlertView.frame), CGRectGetHeight(self.mainAlertView.frame))];
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self.mainAlertView addSubview:self.contentView];

    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    float maxYOfTitleLabel;
    if (self.title) {
        self.titleLabel.frame = CGRectMake(0, 15, CGRectGetWidth(self.contentView.frame), 20);
        self.titleLabel.text = self.title;
        self.titleLabel.textColor = [CUColor colorWithHexString:@"#000000"];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:18];
        [self.contentView addSubview:self.titleLabel];
        maxYOfTitleLabel = CGRectGetMaxY(self.titleLabel.frame);
    } else {
        maxYOfTitleLabel = 20;
    }

    float messageLabelYPosition = maxYOfTitleLabel + 15;

    if (self.image) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.contentView.frame) - self.image.size.width) / 2, maxYOfTitleLabel + 15, self.image.size.width, self.image.size.height)];
        self.imageView.image = self.image;

        [self.contentView addSubview:self.imageView];

        messageLabelYPosition = CGRectGetMaxY(self.imageView.frame) + 15;
    }

    self.messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    if (self.message) {
        self.messageLabel.frame = CGRectMake(18, messageLabelYPosition, CGRectGetWidth(self.contentView.frame) - 36, 40);
        self.messageLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
        self.messageLabel.text = self.message;
        self.messageLabel.textColor = [CUColor colorWithHexString:@"#888888"];
        self.messageLabel.textAlignment = NSTextAlignmentCenter;
        self.messageLabel.numberOfLines = 0;
        self.messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [self.contentView addSubview:self.messageLabel];

        CGSize size = [CULabel sizeOfLabel:self.messageLabel inView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame) - 36, CGRectGetHeight(self.contentView.frame))]];
        self.messageLabel.frame = CGRectMake((CGRectGetWidth(self.contentView.frame) - CGRectGetWidth(self.messageLabel.frame) - 12) / 2, messageLabelYPosition, CGRectGetWidth(self.messageLabel.frame) + 12, size.height);
    }

    self.buttonsContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.contentView.frame) - 55, CGRectGetWidth(self.contentView.frame), 55)];

    CGRect rightButtonFrame = CGRectZero;
    if (self.leftBtnText && ![self.leftBtnText isEmpty]) {
        self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.leftButton.frame = CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame) / 2 - 1, CGRectGetHeight(self.buttonsContainerView.frame));
        self.leftButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:18];
        [self.leftButton setTitle:self.leftBtnText forState:UIControlStateNormal];
        [self.leftButton setTitleColor:self.leftBtnTextColor forState:UIControlStateNormal];
        [self.leftButton addTarget:self action:@selector(_leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [self.buttonsContainerView addSubview:self.leftButton];

        rightButtonFrame = CGRectMake(CGRectGetWidth(self.contentView.frame) / 2 + 1, 0, CGRectGetWidth(self.contentView.frame) / 2 - 1, CGRectGetHeight(self.buttonsContainerView.frame));
    } else {
        rightButtonFrame = CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame), CGRectGetHeight(self.buttonsContainerView.frame));
    }

    if (self.rightBtnText && ![self.rightBtnText isEmpty]) {
        self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.rightButton.frame = rightButtonFrame;
        self.rightButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:18];
        [self.rightButton setTitle:self.rightBtnText forState:UIControlStateNormal];
        [self.rightButton setTitleColor:self.rightBtnTextColor forState:UIControlStateNormal];
        [self.rightButton addTarget:self action:@selector(_rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [self.buttonsContainerView addSubview:self.rightButton];

        [self.contentView addSubview:self.buttonsContainerView];
    }

    UIView *horizontalLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.buttonsContainerView.frame), 1)];
    horizontalLine.backgroundColor = [CUColor colorWithHexString:@"#E5E5E5"];
    [self.buttonsContainerView addSubview:horizontalLine];

    if (self.leftBtnText && ![self.leftBtnText isEmpty]) {
        UIView *verticalLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.buttonsContainerView.frame) / 2, 0, 1, CGRectGetHeight(self.buttonsContainerView.frame))];
        verticalLine.backgroundColor = [CUColor colorWithHexString:@"#E5E5E5"];
        [self.buttonsContainerView addSubview:verticalLine];
    }

    CGFloat mainAlertViewHeight = CGRectGetHeight(self.titleLabel.frame) + CGRectGetHeight(self.imageView.frame) + CGRectGetHeight(self.messageLabel.frame) + CGRectGetHeight(self.buttonsContainerView.frame) + [self _caculateAllGapsHeight];

    self.mainAlertView.frame = CGRectMake(CGRectGetMinX(self.mainAlertView.frame), (kScreen_Height - mainAlertViewHeight) / 2 - 40, kScreen_Width - 46 * 2, mainAlertViewHeight);
    self.contentView.frame = CGRectMake(0, 0, CGRectGetWidth(self.mainAlertView.frame), CGRectGetHeight(self.mainAlertView.frame));
    self.titleLabel.frame = CGRectMake(0, 15, CGRectGetWidth(self.contentView.frame), CGRectGetHeight(self.titleLabel.frame));
    self.buttonsContainerView.frame = CGRectMake(0, CGRectGetHeight(self.contentView.frame) - 55, CGRectGetWidth(self.contentView.frame), CGRectGetHeight(self.buttonsContainerView.frame));

    [self addSubview:self.mainAlertView];
    self.mainAlertView.center = CGPointMake(self.center.x, self.center.y - 10);
}

-(void)show {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    CGAffineTransform oriTransform = self.mainAlertView.transform;
    self.mainAlertView.transform = CGAffineTransformScale(oriTransform, 0.1, 0.1);
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.mainAlertView.transform = CGAffineTransformScale(oriTransform, 1.0, 1.0);
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.1
                                          animations:^{
                                              self.mainAlertView.transform = CGAffineTransformScale(oriTransform, 0.9, 0.9);
                                          } completion:^(BOOL finished) {
                                              [UIView animateWithDuration:0.1
                                                               animations:^{
                                                                   self.mainAlertView.transform = CGAffineTransformScale(oriTransform, 1, 1);
                                                               }];
                                          }];
                     }];
}

//MARK: - Private Methods for Button Actions
-(void)_leftButtonAction {
    if (self.leftBtnClickedBlock) {
        self.leftBtnClickedBlock();
    } else {
        Logger(@"There is no leftBtnClickedBlock assigned, we ignore this button click action");
    }

    [self _hide];

    return;
}

-(void)_rightButtonAction {
    if (self.rightBtnClickedBlock) {
        self.rightBtnClickedBlock();
    } else {
        Logger(@"There is no rightBtnClickedBlock assigned, we ignore this button click action");
    }

    [self _hide];

    return;
}

-(void)_hide {
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

-(CGFloat)_caculateAllGapsHeight {
    CGFloat height = 25.0f;
    if (self.title && ![self.title isEmpty]) {
        height += 15.0f;
    }

    if (self.image) {
        height += 15.0f;
    }
    if (self.message && ![self.message isEmpty]) {
        height += 15.0f;
    }

    return height;
}
//MARK: - 朝向变化响应
-(void)_handleDeviceOrientationDidChangeNotification:(NSNotification *)notification {
    [self _removeAllSubviews];
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    Logger(@"HandleDeviceOrientationDidChangeNotification:%@\n\norientation:%ld",notification, (long)orientation);
    [self _showAlertViewWhenOrientationDidChange];
}

-(void)_removeAllSubviews {
    NSArray *viewsToRemove = [self subviews];
    for (UIView *v in viewsToRemove) {
        [v removeFromSuperview];
    }
}

-(void)_showAlertViewWhenOrientationDidChange {
    [self _initViews];
}

@end
