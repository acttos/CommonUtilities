//
//  CUCode.h
//  CUtil
//
//  Created by Acttos on 24/11/2016.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.
//

#import <Foundation/Foundation.h>

#import "CUDefine.h"

@interface CUCode : NSObject

/**
 Generate a global unique identifer ^_-。<br/>
 You can use other methods in this class to persistent this value for later use.<br/>
 This method is usually used in condition of 'UserId,DeviceId' and so on.

 @return The global unique identifier
 */
+ (NSString *)uniqueIdentifier;

/**
 Save the unique identifier into Keychain, if the value exists, will be rewrote.

 @param identifier The ID to be saved.
 */
+ (void)saveInKeychainWithIdentifier:(NSString *)identifier;

/**
 Load the unique identifier form Keychain

 @return nil or the identifier saved before
 */
+ (NSString *)loadIdentifierFromKeychain;

/**
 Encode the given string with BASE64 encoding

 @param string The source string to encode with.
 @return Encoded BASE64 string
 */
+ (NSString *) BASE64EncodeWithString:(NSString *)string;

/**
 Decode the BASE64 string

 @param string The string to decode with.
 @return Decoded string
 */
+ (NSString *) BASE64DecodeWithString:(NSString *)string;

/**
 Return the MD5 digest string of sourceString
 
 @param sourceString The string to digest.
 @return The MD5 digest string
 */
+ (NSString *) MD5CodeWithString:(NSString *)sourceString;

/**
 Return the MD5 digest string of data
 
 @param data The data to digest
 @return The MD5 digest string
 */
+ (NSString *) MD5CodeWithData:(NSData *) data;

/**
 Return the MD5 digest string of file at specified path

 @param path The path of a file, such as: "/home/user/photo.png"
 @return The MD5 digest of file at path.
 */
+ (NSString *) MD5CodeWithFileAtPath:(NSString *) path;

/**
 Return the MD5 digest string of file at specified URL
 
 @param url The URL of a file, must start with scheme flag. such as: "file:///home/user/photo.png"
 @return The MD5 digest of file at url.
 */
+ (NSString *) MD5CodeWithFileAtURL:(NSURL *) url;

/**
 Return the SHA1 digest string of sourceString

 @param sourceString The source string to digest with.
 @return The SHA1 digest string.
 */
+ (NSString *) SHA1CodeWithString:(NSString *)sourceString;

/**
 Return the SHA1 digest string of a data
 
 @param data The data to digest
 @return The SHA1 digest string
 */
+ (NSString *) SHA1CodeWithData:(NSData*)data;

/**
 Return the SHA1 digest string of a file at path.
 
 @param path The path of a file, such as: "/home/user/photo.png"
 @return The SHA1 digest string of file.
 */
+ (NSString *) SHA1CodeWithFileAtPath:(NSString *) path;

/**
 Return the SHA1 digest string of a file at url.
 
 @param url The URL of a file, must start with a scheme flag. such as: "file:///home/user/photo.png"
 @return The SHA1 digest string of file.
 */
+ (NSString *) SHA1CodeWithFileAtURL:(NSURL *) url;



@end
