//
//  CUCode.m
//  CommonUtilities
//
//  Created by Acttos on 24/11/2016.
//  Copyright © 2016 Acttos.org. All rights reserved.
//

#import "CUCode.h"

#import "CUDefine.h"

#import <CommonCrypto/CommonDigest.h>

@implementation CUCode

+ (NSString*) BASE64EncodeWithString:(NSString*)string {
    if(string == nil || [string length] == 0) {
        Logger(@"The parameter 'string' can NOT be empty, return nil.");
        return nil;
    }
    
    NSData* strData = [string dataUsingEncoding:NSUTF8StringEncoding];
    return [strData base64EncodedStringWithOptions:0];
}

+ (NSString*) BASE64DecodeWithString:(NSString*)string {
    if(string == nil || [string length] == 0) {
        Logger(@"The parameter 'string' can NOT be empty, return nil.");
        return nil;
    }
    
    NSData *strData = [[NSData alloc] initWithBase64EncodedString:string options:0];
    NSString *decodedStr = [[NSString alloc] initWithData:strData encoding:NSUTF8StringEncoding];

    return decodedStr;
}

+ (NSString *) MD5CodeWithString:(NSString *)sourceString {
    if (sourceString == nil || sourceString.length == 0) {
        Logger(@"The parameter 'sourceString' can NOT be empty, return nil.");
        return nil;
    }
    
    const char *cStr = [sourceString UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5( cStr, (int)sourceString.length, digest );
    
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    return result;
}

+ (NSString *) MD5CodeWithData:(NSData *) data {
    if(data == nil || data.length == 0) {
        Logger(@"The parameter 'data' can NOT be nil, return nil.");
        return nil;
    }
    
    const char *cStr = (const char*)[data bytes];
    unsigned char digest[16];
    CC_MD5( cStr, (int)data.length, digest ); // This is the MD5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return  output;
}

+ (NSString *) MD5CodeWithFileAtPath:(NSString *) path {
    if (nil == path || path.length == 0) {
        Logger(@"The parameter 'path' can NOT be empty, return nil.");
        return nil;
    }
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [CUCode MD5CodeWithData:data];
}

+ (NSString *) MD5CodeWithFileAtURL:(NSURL *) url {
    if (nil == url) {
        Logger(@"The parameter 'url' can NOT be nil, return nil.");
        return nil;
    }
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    return [CUCode MD5CodeWithData:data];
}

+ (NSString *) SHA1CodeWithString:(NSString *)sourceString {
    if (sourceString == nil || sourceString.length == 0) {
        Logger(@"The parameter 'sourceString' can NOT be empty, return nil.");
        return nil;
    }
    
    const char *cStr = [sourceString UTF8String];
    unsigned char digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1( cStr, (int)sourceString.length, digest );
    
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    return result;
}

+ (NSString*) SHA1CodeWithData:(NSData*)data {
    if(data == nil || data.length == 0) {
        Logger(@"The parameter 'data' can NOT be nil, return nil.");
        return nil;
    }
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (int)data.length, digest);// This is the SHA1 call
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

+ (NSString *) SHA1CodeWithFileAtPath:(NSString *) path {
    if (nil == path || path.length == 0) {
        Logger(@"The parameter 'path' can NOT be empty, return nil.");
        return nil;
    }
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [CUCode SHA1CodeWithData:data];

}

+ (NSString *) SHA1CodeWithFileAtURL:(NSURL *) url {
    if (nil == url) {
        Logger(@"The parameter 'url' can NOT be nil, return nil.");
        return nil;
    }
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    return [CUCode SHA1CodeWithData:data];
}

@end
