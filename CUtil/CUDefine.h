//
//  CUDefine.h
//  CUtil
//
//  Created by Actto on 5/9/16.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.
//


/**
 Constant Key-Values
 */
#define kScreen_Width    [[UIScreen mainScreen] bounds].size.width
#define kScreen_Height   [[UIScreen mainScreen] bounds].size.height


/* Sting Values */
#define kDefault_Unique_Identifier_Key_In_Keychain          @"kDefault_Unique_Identifier_Key_In_Keychain"

/* Number Values */
#define kDefault_Tag_4_Pop_Down_Tips_View                   2016120801
#define kDefault_Tag_4_Toast_View                           2016120802
#define kDefault_Tag_4_Waiting_View                         2016120803
#define kDefault_Tag_4_Indicator_View                       2016122101


/**
 Define Logger
 */
#ifdef DEBUG
#define Logger(...) NSLog(@"%s:%d %@", __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__])
#else
#define Logger(format, ...)
#endif

