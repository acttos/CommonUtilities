//
//  CUAlertView.m
//  CUtil
//
//  Created by Acttos on 28/12/2016.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.
//

#import "CUAlertView.h"

#import "CUDefine.h"
#import "NSString+CUString.h"
#import "CULabel.h"
#import "CUColor.h"

@interface CUAlertView()

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) NSString *leftBtnText;
@property (nonatomic, strong) UIColor *leftBtnBgColor;
@property (nonatomic, strong) NSString *rightBtnText;
@property (nonatomic, strong) UIColor *rightBtnBgColor;
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

@implementation CUAlertView

-(instancetype)initWithTitle:(NSString *)title message:(NSString *)message leftButtonText:(NSString *)leftBtnText leftClicked:(void(^)(void))leftClickedBlock rightButtonText:(NSString *)rightBtnText rightClicked:(void(^)(void))rightClickedBlock {
    
    if (self = [super init]) {
        self.title = title;
        self.message = message;
        self.leftBtnText = leftBtnText;
        self.rightBtnText = rightBtnText;
        self.leftBtnClickedBlock = leftClickedBlock;
        self.rightBtnClickedBlock = rightClickedBlock;
        
        [self _initViews];
        
        return self;
    }
    
    Logger(@"Failed to init CUAlertView, maybe there is not enough memory left.");
    return nil;
}

-(instancetype)initWithTitle:(NSString *)title image:(UIImage *)image message:(NSString *)message leftButtonText:(NSString *)leftBtnText leftClicked:(void(^)(void))leftClickedBlock rightButtonText:(NSString *)rightBtnText rightClicked:(void(^)(void))rightClickedBlock {
    
    if (self = [super init]) {
        self.title = title;
        self.image = image;
        self.message = message;
        self.leftBtnText = leftBtnText;
        self.rightBtnText = rightBtnText;
        self.leftBtnClickedBlock = leftClickedBlock;
        self.rightBtnClickedBlock = rightClickedBlock;
        
        [self _initViews];
        
        return self;
    }
    
    Logger(@"Failed to init CUAlertView, maybe there is not enough memory left.");
    return nil;
}

-(instancetype)initWithTitle:(NSString *)title
                       image:(UIImage *)image
                     message:(NSString *)message
                   textColor:(UIColor *)textColor
              leftButtonText:(NSString *)leftBtnText
             leftButtonColor:(UIColor *)leftBtnBgColor
                 leftClicked:(void(^)(void))leftClickedBlock
             rightButtonText:(NSString *)rightBtnText
            rightButtonColor:(UIColor *)rightBtnBgColor
                rightClicked:(void(^)(void))rightClickedBlock {
    if (self = [super init]) {
        self.title = title;
        self.image = image;
        self.message = message;
        self.textColor = textColor;
        self.leftBtnText = leftBtnText;
        self.leftBtnBgColor = leftBtnBgColor;
        self.leftBtnClickedBlock = leftClickedBlock;
        self.rightBtnText = rightBtnText;
        self.rightBtnBgColor = rightBtnBgColor;
        self.rightBtnClickedBlock = rightClickedBlock;
        
        [self _initViews];
        
        return self;
    }
    
    Logger(@"Failed to init CUAlertView, maybe there is not enough memory left.");
    return nil;
}

-(void)show {
    [self _showThemeDefault];
}

-(void)showWithTheme:(CUAlertViewTheme)theme {
    switch (theme) {
        case CUAlertViewThemeDefault:
            [self _showThemeDefault];
            break;
        case CUAlertViewThemePopDown:
            [self _showThemePopDown];
            break;
        case CUAlertViewThemePopUp:
            [self _showThemePopUp];
            break;
            
        default:
            [self _showThemeDefault];
            break;
    }
}

//MARK: - Private Methods for Initialization of UI
-(void)_initViews {
    /** Don't pay much attention to the frames of views below, the frames may be changed in '_updateViewsWith***Theme' methods */
    self.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height);
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4f];
    
    self.mainAlertView = [[UIView alloc] initWithFrame:CGRectMake(20, (kScreen_Height - 190) / 2 - 40, kScreen_Width - 40, 190)];
    self.mainAlertView.layer.cornerRadius = 6.0f;
    self.mainAlertView.layer.masksToBounds = YES;
    self.mainAlertView.userInteractionEnabled = YES;
    
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.mainAlertView.frame), CGRectGetHeight(self.mainAlertView.frame))];
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self.mainAlertView addSubview:self.contentView];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, CGRectGetWidth(self.contentView.frame), 20)];
    self.titleLabel.text = self.title;
    self.titleLabel.textColor = [CUColor colorWithHexString:@"#13334A"];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16];
    [self.contentView addSubview:self.titleLabel];
    
    float messageLabelYPosition = CGRectGetMaxY(self.titleLabel.frame);
    
    if (self.image) {
//        float imageViewWidth = self.image.size.width / self.image.size.height * 40;
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.contentView.frame) - self.image.size.width) / 2, CGRectGetMaxY(self.titleLabel.frame) + 10, self.image.size.width, self.image.size.height)];
        self.imageView.image = self.image;
        [self.contentView addSubview:self.imageView];
        
        messageLabelYPosition = CGRectGetMaxY(self.imageView.frame) + 10;
    }
    
    self.messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, messageLabelYPosition, CGRectGetWidth(self.contentView.frame) - 30, 100)];
    self.messageLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
    self.messageLabel.text = self.message;
//    self.messageLabel.backgroundColor = [UIColor redColor];
    self.messageLabel.textColor = [CUColor colorWithHexString:@"#13334A"];
    self.messageLabel.textAlignment = NSTextAlignmentCenter;
    self.messageLabel.numberOfLines = 0;
    [self.contentView addSubview:self.messageLabel];
    
    self.buttonsContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.contentView.frame) - 44, CGRectGetWidth(self.contentView.frame), 44)];
    
    CGRect rightButtonFrame = CGRectZero;
//    UIColor *rightButtonBgColor = [CUColor colorWithHexString:@"#FF4444"];
    if (self.leftBtnText && ![self.leftBtnText isEmpty]) {
        self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.leftButton.frame = CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame) / 2, CGRectGetHeight(self.buttonsContainerView.frame));
        self.leftButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14];
        self.leftButton.backgroundColor = self.leftBtnBgColor;
        [self.leftButton setTitle:self.leftBtnText forState:UIControlStateNormal];
        [self.leftButton setTitleColor:[CUColor colorWithHexString:@"#1E63D2"] forState:UIControlStateNormal];
        [self.leftButton addTarget:self action:@selector(_leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [self.buttonsContainerView addSubview:self.leftButton];
        
        rightButtonFrame = CGRectMake(CGRectGetWidth(self.contentView.frame) / 2, 0, CGRectGetWidth(self.contentView.frame) / 2, CGRectGetHeight(self.buttonsContainerView.frame));
    } else {
        rightButtonFrame = CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame), CGRectGetHeight(self.buttonsContainerView.frame));
//        rightButtonBgColor = [CUColor colorWithHexString:@"#1E63D2"];
    }
    
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightButton.frame = rightButtonFrame;
    self.rightButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14];
    self.rightButton.backgroundColor = [self _colorOfRightButton:self.rightBtnBgColor];
    [self.rightButton setTitle:self.rightBtnText forState:UIControlStateNormal];
    [self.rightButton setTitleColor:[self _colorOfRightButtonText:self.rightBtnBgColor] forState:UIControlStateNormal];
    [self.rightButton addTarget:self action:@selector(_rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonsContainerView addSubview:self.rightButton];
    
    [self.contentView addSubview:self.buttonsContainerView];
    
    [self addSubview:self.mainAlertView];
}

-(void)_updateViewsWithDefaultTheme {
    self.mainAlertView.frame = CGRectMake(20, (kScreen_Height - (CGRectGetHeight(self.messageLabel.frame) + 95)) / 2 - 40, kScreen_Width - 40, (CGRectGetHeight(self.messageLabel.frame) + 95));
    self.contentView.frame = CGRectMake(0, 0, CGRectGetWidth(self.mainAlertView.frame), CGRectGetHeight(self.mainAlertView.frame));
    self.titleLabel.frame = CGRectMake(0, 15, CGRectGetWidth(self.contentView.frame), 20);
    
    float messageLabelYPosition = CGRectGetMaxY(self.titleLabel.frame);
    if (self.image) {
        messageLabelYPosition = CGRectGetMaxY(self.imageView.frame);
    }
    
    CGSize size = [CULabel sizeOfLabel:self.messageLabel inView:self.contentView];
    self.messageLabel.frame = CGRectMake(CGRectGetMinX(self.messageLabel.frame), messageLabelYPosition, CGRectGetWidth(self.contentView.frame) - 30, size.height + 30);
    
    float mainAlertViewHeight = CGRectGetHeight(self.messageLabel.frame) + 95;
    if (self.image) {
        mainAlertViewHeight = mainAlertViewHeight + self.imageView.frame.size.height;
    }
    mainAlertViewHeight = mainAlertViewHeight < (kScreen_Width - 40) / 3 ? (kScreen_Width - 40) / 3 : mainAlertViewHeight;
    
    self.mainAlertView.frame = CGRectMake(20, (kScreen_Height - mainAlertViewHeight) / 2 - 40, kScreen_Width - 40, mainAlertViewHeight);
    self.contentView.frame = CGRectMake(0, 0, CGRectGetWidth(self.mainAlertView.frame), CGRectGetHeight(self.mainAlertView.frame));
    self.titleLabel.frame = CGRectMake(0, 15, CGRectGetWidth(self.contentView.frame), 20);
    self.buttonsContainerView.frame = CGRectMake(0, CGRectGetHeight(self.contentView.frame) - 44, CGRectGetWidth(self.contentView.frame), 44);
    
    if (!self.leftBtnText || [self.leftBtnText isEmpty]) {
        self.leftButton.frame = CGRectZero;
        self.rightButton.frame = CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame), CGRectGetHeight(self.buttonsContainerView.frame));
    } else {
        self.leftButton.frame = CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame) / 2, CGRectGetHeight(self.buttonsContainerView.frame));
        self.rightButton.frame = CGRectMake(CGRectGetWidth(self.contentView.frame) / 2, 0, CGRectGetWidth(self.contentView.frame) / 2, CGRectGetHeight(self.buttonsContainerView.frame));
    }
}

-(void)_updateViewsWithPopDownTheme {
    self.mainAlertView.frame = CGRectMake(8, 24, kScreen_Width - 16, (CGRectGetHeight(self.messageLabel.frame) + 95));
    self.contentView.frame = CGRectMake(0, 0, CGRectGetWidth(self.mainAlertView.frame), CGRectGetHeight(self.mainAlertView.frame));
    self.titleLabel.frame = CGRectMake(0, 15, CGRectGetWidth(self.contentView.frame), 20);
    
    float messageLabelYPosition = CGRectGetMaxY(self.titleLabel.frame);
    if (self.image) {
        messageLabelYPosition = CGRectGetMaxY(self.imageView.frame);
    }
    
    CGSize size = [CULabel sizeOfLabel:self.messageLabel inView:self.contentView];
    self.messageLabel.frame = CGRectMake(CGRectGetMinX(self.messageLabel.frame), messageLabelYPosition, CGRectGetWidth(self.contentView.frame) - 30, size.height);
    
    float mainAlertViewHeight = CGRectGetHeight(self.messageLabel.frame) + 95;
    if (self.image) {
        mainAlertViewHeight = mainAlertViewHeight + self.imageView.frame.size.height;
    }
    mainAlertViewHeight = mainAlertViewHeight < (kScreen_Width - 16) / 3 ? (kScreen_Width - 16) / 3 : mainAlertViewHeight;
    
    self.mainAlertView.frame = CGRectMake(8, 24, kScreen_Width - 16, mainAlertViewHeight);
    self.contentView.frame = CGRectMake(0, 0, CGRectGetWidth(self.mainAlertView.frame), CGRectGetHeight(self.mainAlertView.frame));
    self.titleLabel.frame = CGRectMake(0, 15, CGRectGetWidth(self.contentView.frame), 20);
    self.buttonsContainerView.frame = CGRectMake(0, CGRectGetHeight(self.contentView.frame) - 44, CGRectGetWidth(self.contentView.frame), 44);
    
    if (!self.leftBtnText || [self.leftBtnText isEmpty]) {
        self.leftButton.frame = CGRectZero;
        self.rightButton.frame = CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame), CGRectGetHeight(self.buttonsContainerView.frame));
    } else {
        self.leftButton.frame = CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame) / 2, CGRectGetHeight(self.buttonsContainerView.frame));
        self.rightButton.frame = CGRectMake(CGRectGetWidth(self.contentView.frame) / 2, 0, CGRectGetWidth(self.contentView.frame) / 2, CGRectGetHeight(self.buttonsContainerView.frame));
    }
}

-(void)_updateViewsWithPopUpTheme {
    self.mainAlertView.frame = CGRectMake(8, kScreen_Height - (CGRectGetHeight(self.messageLabel.frame) + 95), kScreen_Width - 16, (CGRectGetHeight(self.messageLabel.frame) + 95));
    self.contentView.frame = CGRectMake(0, 0, CGRectGetWidth(self.mainAlertView.frame), CGRectGetHeight(self.mainAlertView.frame));
    self.titleLabel.frame = CGRectMake(0, 15, CGRectGetWidth(self.contentView.frame), 20);
    
    float messageLabelYPosition = CGRectGetMaxY(self.titleLabel.frame);
    if (self.image) {
        messageLabelYPosition = CGRectGetMaxY(self.imageView.frame);
    }
    
    CGSize size = [CULabel sizeOfLabel:self.messageLabel inView:self.contentView];
    self.messageLabel.frame = CGRectMake(CGRectGetMinX(self.messageLabel.frame), messageLabelYPosition, CGRectGetWidth(self.contentView.frame) - 30, size.height);
    
    float mainAlertViewHeight = CGRectGetHeight(self.messageLabel.frame) + 95;
    if (self.image) {
        mainAlertViewHeight = mainAlertViewHeight + self.imageView.frame.size.height;
    }
    mainAlertViewHeight = mainAlertViewHeight < (kScreen_Width - 16) / 3 ? (kScreen_Width - 16) / 3 : mainAlertViewHeight;
    
    self.mainAlertView.frame = CGRectMake(8, kScreen_Height - mainAlertViewHeight - 8, kScreen_Width - 16, mainAlertViewHeight);
    self.contentView.frame = CGRectMake(0, 0, CGRectGetWidth(self.mainAlertView.frame), CGRectGetHeight(self.mainAlertView.frame));
    self.titleLabel.frame = CGRectMake(0, 15, CGRectGetWidth(self.contentView.frame), 20);
    self.buttonsContainerView.frame = CGRectMake(0, CGRectGetHeight(self.contentView.frame) - 44, CGRectGetWidth(self.contentView.frame), 44);
    
    if (!self.leftBtnText || [self.leftBtnText isEmpty]) {
        self.leftButton.frame = CGRectZero;
        self.rightButton.frame = CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame), CGRectGetHeight(self.buttonsContainerView.frame));
    } else {
        self.leftButton.frame = CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame) / 2, CGRectGetHeight(self.buttonsContainerView.frame));
        self.rightButton.frame = CGRectMake(CGRectGetWidth(self.contentView.frame) / 2, 0, CGRectGetWidth(self.contentView.frame) / 2, CGRectGetHeight(self.buttonsContainerView.frame));
    }
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

//MARK: - Private Methods for the alert view's showing up
-(void)_showThemeDefault {
    [self _updateViewsWithDefaultTheme];
    
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

-(void)_showThemePopDown {
    [self _updateViewsWithPopDownTheme];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    CGAffineTransform oriTransform = self.mainAlertView.transform;
    self.mainAlertView.transform = CGAffineTransformTranslate(oriTransform, 0, -CGRectGetHeight(self.mainAlertView.frame));
    //CGAffineTransformScale(oriTransform, 0.1, 0.1);
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.mainAlertView.transform = CGAffineTransformTranslate(oriTransform, 0, 8);
                     } completion:^(BOOL finished) {
                         self.mainAlertView.transform = oriTransform;
                     }];
}

-(void)_showThemePopUp {
    [self _updateViewsWithPopUpTheme];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    CGAffineTransform oriTransform = self.mainAlertView.transform;
    self.mainAlertView.transform = CGAffineTransformTranslate(oriTransform, 0, CGRectGetHeight(self.mainAlertView.frame));
    //CGAffineTransformScale(oriTransform, 0.1, 0.1);
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.mainAlertView.transform = CGAffineTransformTranslate(oriTransform, 0, 8);
                     } completion:^(BOOL finished) {
                         self.mainAlertView.transform = oriTransform;
                     }];
}

-(UIColor *)_colorOfRightButton:(UIColor *)color {
    if (!color) {
        return [CUColor colorWithHexString:@"#1E63D2"];
    }
    
    return color;
}

-(UIColor *)_colorOfRightButtonText:(UIColor *)color {
    if (!color) {
        return [CUColor colorWithHexString:@"#FFFFFF"];
    }
    
    return color;
}

@end
