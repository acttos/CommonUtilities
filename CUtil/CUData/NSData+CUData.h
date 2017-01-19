//
//  NSData+CUData.h
//  CUtil
//
//  Created by Acttos on 05/01/2017.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.
//

#import <Foundation/Foundation.h>

@interface NSData (CUData)

/**
 Decompress the data with zlib

 @return Decompressed data
 */
- (NSData *) zlibDecompress;

/**
 Compress the data with zlib

 @return Compressed data
 */
- (NSData *) zlibCompress;

/**
 Decompress the data with gzip

 @return Decompressed data
 */
- (NSData *) gzipDecompress;

/**
 Compress the data with gzip
 
 @return Compressed data
 */
- (NSData *) gzipCompress;

/**
 Encrypt the data with a key

 @param key The key with which to encrypt data
 @return Ecrypted data
 */
- (NSData *)AES256EncryptWithKey:(NSString *)key;

/**
 Decrypt the data with a key

 @param key The key with which to decrypt data
 @return Decrypted data
 */
- (NSData *)AES256DecryptWithKey:(NSString *)key;

@end
