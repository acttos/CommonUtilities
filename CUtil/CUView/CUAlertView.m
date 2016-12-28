//
//  CUAlertView.m
//  CUtil
//
//  Created by Acttos on 28/12/2016.
//  Copyright © 2016 Acttos.org. All rights reserved.
//

#import "CUAlertView.h"

#import "CUDefine.h"
#import "CULabel.h"
#import "CUColor.h"

@interface CUAlertView()

@property(nonatomic, strong) UIView *mainAlertView;
@property(nonatomic, strong) UIView *contentView;
@property(nonatomic, strong) UILabel *titleLabel;
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
         
-(void)_initViews {
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
    self.titleLabel.textColor = [CUColor colorWithHexString:@"#000000"];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16];
    [self.contentView addSubview:self.titleLabel];
    
    self.messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.titleLabel.frame) + 20, CGRectGetWidth(self.contentView.frame) - 20, 100)];
    self.messageLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    self.messageLabel.text = self.message;
    self.messageLabel.textColor = [CUColor colorWithHexString:@"#050505"];
    self.messageLabel.textAlignment = NSTextAlignmentCenter;
    self.messageLabel.numberOfLines = 0;
    [self.contentView addSubview:self.messageLabel];
    
    //Update the frame of messageLabel
    CGSize size = [CULabel sizeOfLabel:self.messageLabel inView:self.contentView];
    self.messageLabel.frame = CGRectMake(CGRectGetMinX(self.messageLabel.frame), (CGRectGetHeight(self.messageLabel.frame) - size.height) / 2 + CGRectGetMaxY(self.titleLabel.frame) - 10, CGRectGetWidth(self.messageLabel.frame), size.height + 20);
    
    self.buttonsContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.contentView.frame) - 44, CGRectGetWidth(self.contentView.frame), 44)];
    
    self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftButton.frame = CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame) / 2, CGRectGetHeight(self.buttonsContainerView.frame));
    self.leftButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14];
    self.leftButton.backgroundColor = [CUColor colorWithHexString:@"#F2F2F2"];
    [self.leftButton setTitle:self.leftBtnText forState:UIControlStateNormal];
    [self.leftButton setTitleColor:[CUColor colorWithHexString:@"#1E63D2"] forState:UIControlStateNormal];
    [self.leftButton addTarget:self action:@selector(_leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonsContainerView addSubview:self.leftButton];
    
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightButton.frame = CGRectMake(CGRectGetWidth(self.contentView.frame) / 2, 0, CGRectGetWidth(self.contentView.frame) / 2, CGRectGetHeight(self.buttonsContainerView.frame));
    self.rightButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14];
    self.rightButton.backgroundColor = [CUColor colorWithHexString:@"#FF4444"];
    [self.rightButton setTitle:self.rightBtnText forState:UIControlStateNormal];
    [self.rightButton setTitleColor:[CUColor colorWithHexString:@"#FFFFFF"] forState:UIControlStateNormal];
    [self.rightButton addTarget:self action:@selector(_rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonsContainerView addSubview:self.rightButton];
    
    [self.contentView addSubview:self.buttonsContainerView];
    
    [self addSubview:self.mainAlertView];
}

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
    [self removeFromSuperview];
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

@end
