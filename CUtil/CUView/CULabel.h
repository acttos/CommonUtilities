//
//  CULabel.h
//  CUtil
//
//  Created by Acttos on 23/11/2016.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CULabel : NSObject

/**
 Caculate the size of an UILabel instance in it's super view. Usually used in condition where needs to change the size of UILable due to the texts in it.

 @param label The UILabel instance to caculate
 @param view The super view of the UILabel instance
 @warning You'd better set the text of the UILabel before invoke this method, otherwise you will get an useless size.
 @return The size of UILable instance.
 */
+(CGSize)sizeOfLabel:(UILabel *)label inView:(UIView *)view;

@end
