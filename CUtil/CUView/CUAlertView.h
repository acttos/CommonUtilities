//
//  CUAlertView.h
//  CUtil
//
//  Created by Acttos on 28/12/2016.
//  Copyright © 2016 Acttos.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CUAlertView : UIView

@property (nonatomic, assign) NSString *title;
@property (nonatomic, assign) NSString *message;
@property (nonatomic, assign) NSString *leftBtnText;
@property (nonatomic, assign) NSString *rightBtnText;
@property (nonatomic, copy) void(^leftBtnClickedBlock)(void);
@property (nonatomic, copy) void(^rightBtnClickedBlock)(void);

-(instancetype)initWithTitle:(NSString *)title message:(NSString *)message leftButtonText:(NSString *)leftBtnText leftClicked:(void(^)(void))leftClickedBlock rightButtonText:(NSString *)rightBtnText rightClicked:(void(^)(void))rightClickedBlock;

-(void)show;

@end
