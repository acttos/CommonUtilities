//
//  CULabel.m
//  CUtil
//
//  Created by Acttos on 23/11/2016.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.
//

#import "CULabel.h"

@implementation CULabel

+(CGSize)sizeOfLabel:(UILabel *)label inView:(UIView *)view {
    NSDictionary *attribute = @{NSFontAttributeName:label.font};
    return [label.text boundingRectWithSize:view.frame.size
                                    options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                 attributes:attribute
                                    context:nil].size;
}

@end
