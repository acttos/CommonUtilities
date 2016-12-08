//
//  CUDefine.h
//  CUtil
//
//  Created by Actto on 5/9/16.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.
//

#ifdef DEBUG
//#define Logger(format, ...) NSLog(format, ## __VA_ARGS__)
#define Logger(...) NSLog(@"%s:%d %@", __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__])
#else
#define Logger(format, ...)
#endif

#define kScreen_Width    [[UIScreen mainScreen] bounds].size.width
#define kScreen_Height   [[UIScreen mainScreen] bounds].size.height

#define kDefault_Unique_Identifier_Key_In_Keychain @"kDefault_Unique_Identifier_Key_In_Keychain"

#define kPop_Down_Tips_View_Default_Tag 2016120801
#define kToast_View_Default_Tag 2016120802
