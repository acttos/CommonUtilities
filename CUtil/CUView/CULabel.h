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
 计算一个UILabel视图在父视图中的大小和位置，UILabel的高度和宽度在实际布局中，还是很有实际意义的。

 @param label 要用于计算的UILabel实例
 @param view UILabel实例的父视图
 @return UILabel在父视图中的大小和位置参数
 */
+(CGSize)sizeOfLabel:(UILabel *)label inView:(UIView *)view;

@end
