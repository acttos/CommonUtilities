//
//  CUDefine.h
//  CommonUtilities
//
//  Created by Actto on 5/9/16.
//  Copyright © 2016 Actto. All rights reserved.
//

#ifdef DEBUG
//#define Logger(format, ...) NSLog(format, ## __VA_ARGS__)
#define Logger(...) NSLog(@"%s:%d %@", __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__])
#else
#define Logger(format, ...)
#endif
