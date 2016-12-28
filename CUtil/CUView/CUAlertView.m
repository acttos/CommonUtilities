//
//  CUAlertView.m
//  CUtil
//
//  Created by Acttos on 28/12/2016.
//  Copyright © 2016 Acttos.org. All rights reserved.
//

#import "CUAlertView.h"

#import "CUDefine.h"
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
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7f];
    
    self.mainAlertView = [[UIView alloc] initWithFrame:CGRectMake(11, (kScreen_Height - 190) / 2 - 20, kScreen_Width - 22, 190)];
    self.mainAlertView.layer.cornerRadius = 6.0f;
    self.mainAlertView.layer.masksToBounds = YES;
    self.mainAlertView.userInteractionEnabled = YES;
    self.mainAlertView.backgroundColor = [UIColor greenColor];
    
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.mainAlertView.frame), CGRectGetHeight(self.mainAlertView.frame))];
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self.mainAlertView addSubview:self.contentView];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, CGRectGetWidth(self.contentView.frame), 20)];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.textColor = [CUColor colorWithHexString:@"#13334A"];
    [self.contentView addSubview:self.titleLabel];
    
    self.messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(self.titleLabel.frame) + 15, CGRectGetWidth(self.contentView.frame), 20)];
    self.messageLabel.backgroundColor = [UIColor clearColor];
    self.messageLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    self.messageLabel.textColor = [CUColor colorWithHexString:@"#13334A"];
    self.messageLabel.numberOfLines = 0;
    self.messageLabel.textAlignment = NSTextAlignmentCenter;
    self.messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [self.contentView addSubview:self.messageLabel];
    
    self.buttonsContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.contentView.frame) - 44, CGRectGetWidth(self.contentView.frame), 44)];
    
    self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftButton.frame = CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame) / 2, CGRectGetHeight(self.buttonsContainerView.frame));
    self.leftButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    [self.leftButton setTitleColor:[CUColor colorWithHexString:@"#1E63D2"] forState:UIControlStateNormal];
    self.leftButton.backgroundColor = [CUColor colorWithHexString:@"#F2F2F2"];
    [self.leftButton addTarget:self action:@selector(_leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonsContainerView addSubview:self.leftButton];
    
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightButton.frame = CGRectMake(CGRectGetWidth(self.contentView.frame) / 2, 0, CGRectGetWidth(self.contentView.frame) / 2, CGRectGetHeight(self.buttonsContainerView.frame));
    self.rightButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    [self.rightButton setTitleColor:[CUColor colorWithHexString:@"#FFFFFF"] forState:UIControlStateNormal];
    self.rightButton.backgroundColor = [CUColor colorWithHexString:@"#FF1844"];
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
