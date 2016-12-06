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
