//
//  CUCode.m
//  CommonUtilities
//
//  Created by Acttos on 24/11/2016.
//  Copyright © 2016 Acttos.org. All rights reserved.
//

#import "CUCode.h"

#import <CommonCrypto/CommonDigest.h>

@implementation CUCode

+ (NSString*) BASE64EncodeWithString:(NSString*)string {
    if(string == nil || [string length] == 0) {
        return nil;
    }
    
    NSData* strData = [string dataUsingEncoding:NSUTF8StringEncoding];
    return [strData base64EncodedStringWithOptions:0];
}

+ (NSString*) BASE64DecodeWithString:(NSString*)string {
    if(string == nil || [string length] == 0) {
        return nil;
    }
    
    NSData *strData = [[NSData alloc] initWithBase64EncodedString:string options:0];
    NSString *decodedStr = [[NSString alloc] initWithData:strData encoding:NSUTF8StringEncoding];

    return decodedStr;
}

+ (NSString *) MD5CodeWithString:(NSString *)sourceString {
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

+ (NSString *) SHA1CodeWithString:(NSString *)sourceString {
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

@end
