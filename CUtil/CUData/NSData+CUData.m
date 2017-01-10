//
//  NSData+CUData.m
//  CUtil
//
//  Created by Acttos on 05/01/2017.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.
//  The sources is from http://www.cocoadev.com/index.pl?NSDataCategory
//

#import "NSData+CUData.h"
#import <zlib.h>
#import <CommonCrypto/CommonCryptor.h>

@implementation NSData (CUData)

//- (NSData *)zlibDecompress {
//    if ([self length] == 0) {
//        return self;
//    }
//    
//    unsigned full_length = [self length];
//    unsigned half_length = [self length] / 2;
//    
//    NSMutableData *decompressed = [NSMutableData dataWithLength: full_length + half_length];
//    BOOL done = NO;
//    int status;
//    
//    z_stream strm;
//    strm.next_in = (Bytef *)[self bytes];
//    strm.avail_in = [self length];
//    strm.total_out = 0;
//    strm.zalloc = Z_NULL;
//    strm.zfree = Z_NULL;
//    
//    if (inflateInit (&strm) != Z_OK) {
//        return nil;
//    }
//    
//    while (!done) {
//        // Make sure we have enough room and reset the lengths.
//        if (strm.total_out >= [decompressed length]) {
//            [decompressed increaseLengthBy: half_length];
//        }
//        strm.next_out = [decompressed mutableBytes] + strm.total_out;
//        strm.avail_out = [decompressed length] - strm.total_out;
//        
//        // Inflate another chunk.
//        status = inflate (&strm, Z_SYNC_FLUSH);
//        if (status == Z_STREAM_END) {
//            done = YES;
//        } else if (status != Z_OK) {
//            break;
//        }
//    }
//    if (inflateEnd (&strm) != Z_OK) {
//        return nil;
//    }
//    
//    // Set real length.
//    if (done) {
//        [decompressed setLength: strm.total_out];
//        return [NSData dataWithData: decompressed];
//    } else {
//        return nil;
//    }
//}
//
//- (NSData *)zlibCompress {
//    if ([self length] == 0){
//        return self;
//    }
//    
//    z_stream strm;
//    
//    strm.zalloc = Z_NULL;
//    strm.zfree = Z_NULL;
//    strm.opaque = Z_NULL;
//    strm.total_out = 0;
//    strm.next_in=(Bytef *)[self bytes];
//    strm.avail_in = [self length];
//    
//    // Compresssion Levels:
//    //   Z_NO_COMPRESSION
//    //   Z_BEST_SPEED
//    //   Z_BEST_COMPRESSION
//    //   Z_DEFAULT_COMPRESSION
//    
//    if (deflateInit(&strm, Z_BEST_COMPRESSION) != Z_OK) {
//        return nil;
//    }
//    
//    NSMutableData *compressed = [NSMutableData dataWithLength:16384];  // 16K chuncks for expansion
//    
//    do {
//        if (strm.total_out >= [compressed length]) {
//            [compressed increaseLengthBy: 16384];
//        }
//        
//        strm.next_out = [compressed mutableBytes] + strm.total_out;
//        strm.avail_out = [compressed length] - strm.total_out;
//        
//        deflate(&strm, Z_FINISH);
//        
//    } while (strm.avail_out == 0);
//    
//    deflateEnd(&strm);
//    
//    [compressed setLength: strm.total_out];
//    return [NSData dataWithData: compressed];
//}
//
//- (NSData *)gzipDecompress {
//    if ([self length] == 0){
//        return self;
//    }
//    
//    unsigned full_length = [self length];
//    unsigned half_length = [self length] / 2;
//    
//    NSMutableData *decompressed = [NSMutableData dataWithLength: full_length + half_length];
//    BOOL done = NO;
//    int status;
//    
//    z_stream strm;
//    strm.next_in = (Bytef *)[self bytes];
//    strm.avail_in = [self length];
//    strm.total_out = 0;
//    strm.zalloc = Z_NULL;
//    strm.zfree = Z_NULL;
//    
//    if (inflateInit2(&strm, (15+32)) != Z_OK) {
//        return nil;
//    }
//    while (!done) {
//        // Make sure we have enough room and reset the lengths.
//        if (strm.total_out >= [decompressed length]) {
//            [decompressed increaseLengthBy: half_length];
//        }
//        strm.next_out = [decompressed mutableBytes] + strm.total_out;
//        strm.avail_out = [decompressed length] - strm.total_out;
//        
//        // Inflate another chunk.
//        status = inflate (&strm, Z_SYNC_FLUSH);
//        if (status == Z_STREAM_END) {
//            done = YES;
//        } else if (status != Z_OK) {
//            break;
//        }
//    }
//    if (inflateEnd (&strm) != Z_OK) {
//        return nil;
//    }
//    
//    // Set real length.
//    if (done) {
//        [decompressed setLength: strm.total_out];
//        return [NSData dataWithData: decompressed];
//    } else {
//        return nil;
//    }
//}
//
//- (NSData *)gzipCompress {
//    if ([self length] == 0) {
//        return self;
//    }
//    
//    z_stream strm;
//    
//    strm.zalloc = Z_NULL;
//    strm.zfree = Z_NULL;
//    strm.opaque = Z_NULL;
//    strm.total_out = 0;
//    strm.next_in=(Bytef *)[self bytes];
//    strm.avail_in = [self length];
//    
//    // Compresssion Levels:
//    //   Z_NO_COMPRESSION
//    //   Z_BEST_SPEED
//    //   Z_BEST_COMPRESSION
//    //   Z_DEFAULT_COMPRESSION
//    
//    if (deflateInit2(&strm, Z_DEFAULT_COMPRESSION, Z_DEFLATED, (15+16), 8, Z_DEFAULT_STRATEGY) != Z_OK) {
//        return nil;
//    }
//    
//    NSMutableData *compressed = [NSMutableData dataWithLength:16384];  // 16K chunks for expansion
//    
//    do {
//        if (strm.total_out >= [compressed length]) {
//            [compressed increaseLengthBy: 16384];
//        }
//        
//        strm.next_out = [compressed mutableBytes] + strm.total_out;
//        strm.avail_out = [compressed length] - strm.total_out;
//        
//        deflate(&strm, Z_FINISH);  
//        
//    } while (strm.avail_out == 0);
//    
//    deflateEnd(&strm);
//    
//    [compressed setLength: strm.total_out];
//    return [NSData dataWithData:compressed];
//}
//
//- (NSData *)AES256EncryptWithKey:(NSString *)key {
//    char keyPtr[kCCKeySizeAES256+1];
//    
//    bzero(keyPtr, sizeof(keyPtr));
//    
//    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
//    
//    NSUInteger dataLength = [self length];
//    
//    size_t bufferSize = dataLength + kCCBlockSizeAES128;
//    
//    void *buffer = malloc(bufferSize);
//    
//    size_t numBytesEncrypted = 0;
//    
//    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128,
//                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
//                                          keyPtr, kCCBlockSizeAES128,
//                                          NULL,
//                                          [self bytes], dataLength,
//                                          buffer, bufferSize,
//                                          &numBytesEncrypted);
//    
//    if (cryptStatus == kCCSuccess) {
//        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
//    }
//    
//    free(buffer);
//    
//    return nil;
//}
//
//- (NSData *)AES256DecryptWithKey:(NSString *)key {
//    char keyPtr[kCCKeySizeAES256+1];
//    
//    bzero(keyPtr, sizeof(keyPtr));
//    
//    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
//    
//    NSUInteger dataLength = [self length];
//    
//    size_t bufferSize = dataLength + kCCBlockSizeAES128;
//    
//    void *buffer = malloc(bufferSize);
//    
//    size_t numBytesDecrypted = 0;
//    
//    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
//                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
//                                          keyPtr, kCCBlockSizeAES128,
//                                          NULL,
//                                          [self bytes], dataLength,
//                                          buffer, bufferSize,
//                                          &numBytesDecrypted);
//    
//    if (cryptStatus == kCCSuccess) {
//        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
//    }
//    
//    free(buffer);
//    
//    return nil;
//}

@end
