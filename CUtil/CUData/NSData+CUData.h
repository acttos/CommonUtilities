//
//  NSData+CUData.h
//  CUtil
//
//  Created by Acttos on 05/01/2017.
//  Copyright © 2017 Acttos.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (CUData)

// ZLIB
- (NSData *) zlibDecompress;
- (NSData *) zlibCompress;

// GZIP
- (NSData *) gzipDecompress;
- (NSData *) gzipCompress;

@end
