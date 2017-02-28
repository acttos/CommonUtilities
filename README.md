# Summary

`CUtil` is a common utility framework based on Objective-C. It is for iOS developments with some useful methods in it.  

All the codes in `CUtil` is from the daily work, it will be uploaded frome time to time. Your are welcomed to [Give Suggestions](mailto:acttosma@gmail.com).

### Warning:

*       *CUtil has corrected an issue, please make sure you update your CUtil to version 0.1.8 or higher.*
	

# How to use it:

## 1. Use it with CocoaPods:

CUtil is uploaded to CocoaPods, so you can use `pod` command to integrate CUtil:

Create a Podfile and add this line below:

```
pod 'CUtil'
```

Or you can set the version of CUtil:

```
pod 'CUtil', '~> x.x.x'
```

The latest version of CUtil can be found in: *[[CUtil on CocoaPods.org]](https://cocoapods.org/pods/CUtil)*。

**Attentaion: If you need to update your local CUtil to a higher version, you do need to set the version you want to update to.**

*Such as: I want to update my CUtil from 0.0.10 to 0.1.8, I need to modify my Podfile like below:*

```
pod 'CUtil', '~> 0.1.8'  
# was pod 'CUtil', '~> 0.0.10'
```

And then run `pod install` :

```
[acttos@acttos.org:~/CUtilPod]$pod install
Analyzing dependencies
Downloading dependencies
Installing CUtil 0.1.8 (was 0.0.10)
Generating Pods project
Integrating client project
Sending stats
Pod installation complete! There is 1 dependency from the Podfile and 1 total pod installed.
```

The time you use CUtil, you just need import the module in your class file：

```
#import <Foundation/Foundation.h>
#import "AppDelegate.h"
//.... Some Codes ....

//.... Import CUtil Module by '@import' ....
@import CUtil;
```

## 2. Use CUtil without CocoaPods:

If you don't use CocoaPods, which I strongly recommand you do, you can just copy all the files in GitHub to your frameworks group in your project, and in the class file import CUtil.h:

```
#import <CUtil/CUtil.h>
```


# CUtil's Functions Introduction

## Functions of storage:

> CUStorage.h

```
/**
 Write the custom data into Keychain of OS, the data will not change when re-install the app. Mostly used to save non-changed UserId.
 
 @param key  The key to save the data in Keychain
 @param data The data to save
 @warning Only passed on real devices, not support Simulators.
 */
+ (void)storeInKeychainWithKey:(NSString *)key data:(id)data;

/**
 Load the data from Keychain through the given key
 
 @param key The data's key to load.
 @warning Only passed on real devices, not support Simulators.
 @return The data saved in Keychain with the given key
 */
+ (id)loadFromKeychainWithKey:(NSString *)key;
```

## Functions of color:
> CUColor.h

```
/**
 Return the UIColor instance generated with a hex value
 
 @param hexValue The value of color in hex format, such as: 0xFF00FF
 @return The UIColor instance
 */
+ (UIColor *)colorWithHex:(NSInteger)hexValue;

/**
 Return the UIColor instance generated with a hex and alpha values
 
 @param hexValue The value of color in hex format, such as: 0xFF00FF
 @param alpha    The alpha property of this color
 @return The UIColor instance with alpha.
 */
+ (UIColor *)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alpha;

/**
 Return the UIColor instance generated with a hex string value
 
 @param hexString The color value in format of hex string, such as: @"#FF00FF"
 @return The UIColor instance from hexString.
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;

/**
 Return the UIColor instance generated with a hex string and alpha values.
 
 @param hexString The color value in format of hex string, such as: @"#FF00FF"
 @param alpha The alpha property of this color
 @return The UIColor instance from hexString and alpha.
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
```

## Functions of data and binary:
> NSData+CUData.h

```
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
```

## Functions of file and directory:
> CUFile.h

```
/**
 Return the default Documents URL

 @return Documents' URL
 */
+ (NSURL *)getDocumentsDirectory;

/**
 Create a directory at the given path, including the parent directories.

 @param path The full path of the directory to create, such as: "/videos/2016/12/"
 @warning The root directory of this method is the 'data' directory of the device, all the directories will be created under the 'data' folder.
 @return Created: YES, otherwise: NO
 */
+ (BOOL)createDirectoryAtPath:(NSString *)path;

/**
 Save the data to the given path.

 @param data The data to save.
 @param path The path which to save the data. PS:This path should contain the name of the file, path can NOT end with '/'.
 @return Saved: YES, otherwise: NO
 */
+ (BOOL)saveFile:(NSData *)data atPath:(NSString *)path;

/**
 Save the data to the given path with a given file name.

 @param data The data to save.
 @param path The path which to save the data. PS:This path CAN contain the name of the file, path CAN end with '/'.
 @param fileName The file name of the file to create.
 @return Saved: YES, otherwise: NO
 */
+ (BOOL)saveFile:(NSData *)data atPath:(NSString *)path withName:(NSString *)fileName;
```

## Functions of JSON-related:
> CUJSON.h

```
/**
 Return the JSON string generated from an array
 
 @param array The array used to generate JSON string
 @return The JSON string from an array
 */
+(NSString *)JSONStringFromArray:(NSArray *)array;

/**
 Return the JSON string generated from a dictionary
 
 @param dictionary The dictionary used to generate JSON string
 @return The JSON string from a dictionary
 */
+(NSString *)JSONStringFromDictionary:(NSDictionary *)dictionary;

/**
 Generate JSON string with object.
 
 @param object Any NSObject instance
 @return The JSON string or nil when the object is nil or can NOT be parsed into JSON.
 */
+(NSString *)JSONStringFromObject:(NSObject *)object;

/**
 Parse the given JSON string to an array instance

 @param JSON The JSON string
 @return An array instance parsed from the JSON
 */
+(NSArray *)arrayFromJSON:(NSString *)JSON;

/**
 Parse the given JSON string to a dictionary instance
 
 @param JSON The JSON string
 @return A dictionary instance parsed from the JSON
 */
+(NSDictionary *)dictionaryFromJSON:(NSString *)JSON;
```

## Functions of string operations:
> NSString+CUString.h

```
/**
 Determine whether the string is empty, such as: "" or "    "
 @warning when the instance string is nil,this method will return NO, that must be handled by yourself

 @return YES: empty, NO: otherwise
 */
-(BOOL)isEmpty;

/**
 Judge whether the string starts with given string

 @param string The string to judge with
 @return Starts with the given string: YES, otherwise: NO
 */
-(BOOL)startsWith:(NSString *)string;

/**
 Judge whether the string ends with given string
 
 @param string The string to judge with
 @return Ends with the given string: YES, otherwise: NO
 */
-(BOOL)endsWith:(NSString *)string;

/**
 Return the substring cut with given indexes.

 @param beginIndex The index where to begin, the characher at this index is included in the cut string.
 @param endIndex The index where to end, the characher at this index is NOT included in the cut string.
 @return The cut string.
 */
-(NSString *)substring:(NSUInteger)beginIndex to:(NSUInteger)endIndex;

/**
 Return the clean string which deleted the blank characters at the beginning and the ending.

 @return The string without blank charachers at the beginning or ending
 */
-(NSString *)trim;

/**
 Return an array split from a string with given separator.

 @param pattern The separator's pattern
 @return The array split from the string.
 */
-(NSArray<NSString *> *)splitBy:(NSString *)pattern;

/**
 Return the first index where matches the pattern.

 @param pattern The string's pattern to match
 @return The first index of the matched string.
 */
-(NSUInteger)indexOf:(NSString *)pattern;

/**
 Return the last index where matches the pattern.
 
 @param pattern The string's pattern to match
 @return The last index of the matched string.
 */
-(NSUInteger)lastIndexOf:(NSString *)pattern;

/**
 Replace the first matched characters with the replacement.

 @param pattern The string's pattern to match.
 @param replacement The replacement string.
 @return The new string replaced the first match.
 */
-(NSString *)replaceFirst:(NSString *)pattern with:(NSString *)replacement;

/**
 Replace the last matched characters with the replacement.
 
 @param pattern The string's pattern to match.
 @param replacement The replacement string.
 @return The new string replaced the last match.
 */
-(NSString *)replaceLast:(NSString *)pattern with:(NSString *)replacement;

/**
 Replace all the matched characters with the replacement.
 
 @param pattern The string's pattern to match.
 @param replacement The replacement string.
 @return The new string replaced the match.
 */
-(NSString *)replaceAll:(NSString *)pattern with:(NSString *)replacement;
```

## Functions of date operations:
> CUDate.h

```
/**
 Generate a millisecond value based on current time.
 
 @return The current milliseconds.
 */
+(long long)generateMillisecondTime;

/**
 Generate a millisecond value based on the given date.
 
 @param date The date which will be converted into milliseconds, current date will replace this parameter when the give date is nil
 @return The milliseconds based on the give date.
 */
+(long long)generateMillisecondTimeWithDate:(NSDate *)date;

/**
 Convert the milliseconds into a NSDate instance
 
 @param milliseconds The milliseconds to convert with.
 @return The NSDate instance based on the milliseconds.
 */
+(NSDate *)generateDateWithMilliseconds:(long long)milliseconds;

/**
 Format the date with a format string
 
 @param date   The NSDate instance to convert and format
 @param format The format string, "yyyy-MM-dd HH:mm:ss" will be used when parameter 'format' is nil.
 @return The formated string
 */
+(NSString *)stringOfDate:(NSDate *)date withFormat:(NSString *)format;
```

## Functions of system configurations:
> CUConfig.h

```
/**
 Return the preffered language as the language of the device
 @return The language currently used by the device
 */
+ (NSString *)getDeviceLanguage;

/**
 Return the language code of the device
 @return The language code. such as: en, zh, ar, fr and so on.
 */
+ (NSString *)getDeviceLanguageCode;

/**
 Return the country code of the device

 @return The country code. such as: CN, US, UK, AR, FR, TW, HK and so on.
 */
+ (NSString *)getDeviceCountryCode;

/**
 Return the language code and country code in the format of 'i18N'. such as: en_US, zh_CN, zh_TW, en_FR and so on.
 
 @return The mixed code of language and country. Mostly used in the communication protocol between the client and the server.
 */
+ (NSString *)getLocalStringIni18N;

/**
 Is the device using Chinese as the prefrered language.

 @return Chinese: YES, otherwise: NO
 */
+ (BOOL)isChineseLang;

/**
 Is the device using Arabic as the prefrered language.
 
 @return Arabic: YES, otherwise: NO
 */
+ (BOOL)isArabicLang;

/**
 Is the device using French as the prefrered language.
 
 @return French: YES, otherwise: NO
 */
+ (BOOL)isFrenchLang;
```

## Functions of UIView operations:
> CULabel.h

```
/**
 Caculate the size of an UILabel instance in it's super view. Usually used in condition where needs to change the size of UILable due to the texts in it.

 @param label The UILabel instance to caculate
 @param view The super view of the UILabel instance
 @warning You'd better set the text of the UILabel before invoke this method, otherwise you will get an useless size.
 @return The size of UILable instance.
 */
+(CGSize)sizeOfLabel:(UILabel *)label inView:(UIView *)view;
```

> CUTipsView.h

```
/**
 Show up a tost view (like on Android) with message and time.
 
 @param view     The super view of the toast view
 @param message  The message shown in the toast view
 @param _duration The time of disappearance, Unit: second
 @param _delay    The time of delay, means the time seconds of showing of the toast, Unit: second
 */
+ (void)showToastInView:(UIView *)view withMessage:(NSString *)message duration:(float)_duration delay:(float)_delay;

/**
 Show up a tost view (like on Android) with message, frame and time.
 
 @param view     The super view of the toast view
 @param frame    The frame of the toast view
 @param _message  The message shown in the toast view
 @param _duration The time of disappearance, Unit: second
 @param _delay    The time of delay, means the time seconds of showing of the toast, Unit: second
 */
+ (void)showToastInView:(UIView *)view withFrame:(CGRect)frame message:(NSString *)_message duration:(float)_duration delay:(float)_delay;

/**
 Show up an animating UIActivityIndicator in full screen with message.
 
 @param tag The tag of the view, for later use: hiding or removing
 @param _message The message to show
 @warning This method can NOT be used in Extension apps, because the UIWindow instance can NOT instantiated.
 */
+(void)showFullScreenWaitingViewWithTag:(NSUInteger)tag message:(NSString *)_message;

/**
 Show up an animating UIActivityIndicator view in full screen with a super view as container. The waiting view uses the default tag defined.
 The full screen here means the waiting view fills full of the super view. When you need to hide this waiting view, just call [CUTipsView hideWaitingViewInView:].

 @param view The super view of waiting view
 @param _message The message shows up.
 */
+(void)showFullScreenWaitingViewInView:(UIView *)view message:(NSString *)_message;

/**
 Show up a waiting view with a certain tag, frame, message and an UIActivityIndicator view.
 
 @param tag The tag of the waiting view, for later hiding or removing.
 @param _frame The frame of the waiting view.
 @param _message The message to show.
 @warning This method can NOT be used in Extension apps, because the UIWindow instance can NOT instantiated.
 */
+(void)showWaitingViewWithTag:(NSUInteger)tag frame:(CGRect)_frame message:(NSString *)_message;

/**
 Show up a waiting view with a certain tag, frame, message, theme and an UIActivityIndicator view.
 
 @param tag The tag of the waiting view, for later hiding or removing.
 @param _frame The frame of the waiting view.
 @param _message The message to show.
 @param _theme  The theme of the waiting view.
 @warning This method can NOT be used in Extension apps, because the UIWindow instance can NOT instantiated.
 */
+(void)showWaitingViewWithTag:(NSUInteger)tag frame:(CGRect)_frame message:(NSString *)_message theme:(CUTipsViewTheme)_theme;

/**
 Show up a waiting view in a given super view with frame and message.
 
 @param view The super view to contain the waiting view.
 @param _frame The frame of the waiting view.
 @param _message The message to show.
 */
+(void)showWaitingViewInView:(UIView *)view frame:(CGRect)_frame message:(NSString *)_message;

/**
 Show up a waiting view in a given super view with frame, message and theme.
 
 @param view The super view to contain the waiting view.
 @param _frame The frame of the waiting view.
 @param _message The message to show.
 @param _theme  The theme of the waiting view.
 */
+(void)showWaitingViewInView:(UIView *)view frame:(CGRect)_frame message:(NSString *)_message theme:(CUTipsViewTheme)_theme;

/**
 Show up an UIActivityIndicator view in a super view with a center point and theme

 @param view The super view of the waiting view
 @param _center The center point of the UIActivityIndicator view
 @param _theme The theme of the waiting view.
 */
+(void)showActivityIndicatorInView:(UIView *)view center:(CGPoint)_center theme:(CUTipsViewTheme)_theme;

/**
 Show a 'PopDown' alert tips view from the top of the given view with an optional image, a message and an offset of vertical.
 
 @param view The super view of the alert tips view.
 @param aImage The image of the alert tips view, placed at the left side of the message label.
 @param aMessage The message to show.
 @param _yOffset The vertical offset of the alert tips view, usually set it to be 0.0f.
 */
+(void)showPopDownTipsViewInView:(UIView *)view withImage:(UIImage *)aImage message:(NSString *)aMessage yOffset:(CGFloat)_yOffset;

/**
 Hide and remove a view from UIWindow with a tag.
 
 @param tag The tag of view to hide and remove.
 */
+(void)hideViewInWindowWithTag:(NSUInteger)tag;

/**
 Hide and remove the waiting view from super view

 @param view The super view of the waiting view.
 */
+(void)hideWaitingViewInView:(UIView *)view;

/**
 Hide the Activity Indicator view

 @param view The container view of Activity Indicator
 */
+(void)hideActivityIndicatorInView:(UIView *)view;

/**
 Return a centered frame's rect with the given width and height.

 @param width The width of the rect
 @param _height The height of the rect
 @return An centered frame's rect.
 */
+(CGRect)centeredFrameWithWidth:(float)width height:(float)_height;
```

> CUToastView.h (Duplicated from CUTipsView.h)
 
```
/**
 Show up a tost view (like on Android) with message and time.
 
 @param view     The super view of the toast view
 @param message  The message shown in the toast view
 @param _duration The time of disappearance, Unit: second
 @param _delay    The time of delay, means the time seconds of showing of the toast, Unit: second
 */
+ (void)showToastInView:(UIView *)view withMessage:(NSString *)message duration:(float)_duration delay:(float)_delay;

/**
 Show up a tost view (like on Android) with message, frame and time.
 
 @param view     The super view of the toast view
 @param frame    The frame of the toast view
 @param _message  The message shown in the toast view
 @param _duration The time of disappearance, Unit: second
 @param _delay    The time of delay, means the time seconds of showing of the toast, Unit: second
 */+ (void)showToastInView:(UIView *)view withFrame:(CGRect)frame message:(NSString *)_message duration:(float)_duration delay:(float)_delay;
```

> CUAlertView.h

```
/**
 Initialize a CUAlertView instance
 
 @param title The title texts in this alert view
 @param message The message texts in this alert view
 @param leftBtnText The texts of left button in this alert view
 @param leftClickedBlock The clicked-block of the left button in this alert view
 @param rightBtnText The texts of right button in this alert view
 @param rightClickedBlock The clicked-block of the right button in this alert view
 @return The instance of this CUAlertView.
 */
-(instancetype)initWithTitle:(NSString *)title
                     message:(NSString *)message
              leftButtonText:(NSString *)leftBtnText
                 leftClicked:(void(^)(void))leftClickedBlock
             rightButtonText:(NSString *)rightBtnText
                rightClicked:(void(^)(void))rightClickedBlock;

/**
 Initialize a CUAlertView instance
 
 @param title The title texts in this alert view
 @param image The image shows in the alert view between title and massage
 @param message The message texts in this alert view
 @param leftBtnText The texts of left button in this alert view
 @param leftClickedBlock The clicked-block of the left button in this alert view
 @param rightBtnText The texts of right button in this alert view
 @param rightClickedBlock The clicked-block of the right button in this alert view
 @return The instance of this CUAlertView.
 */
-(instancetype)initWithTitle:(NSString *)title
                       image:(UIImage *)image
                     message:(NSString *)message
              leftButtonText:(NSString *)leftBtnText
                 leftClicked:(void(^)(void))leftClickedBlock
             rightButtonText:(NSString *)rightBtnText
                rightClicked:(void(^)(void))rightClickedBlock;

/**
 Initialize a CUAlertView instance
 
 @param title The title texts in this alert view
 @param image The image shows in the alert view between title and massage
 @param message The message texts in this alert view
 @param leftBtnText The texts of left button in this alert view
 @param leftClickedBlock The clicked-block of the left button in this alert view
 @param rightBtnText The texts of right button in this alert view
 @param rightBtnColor The color of right button in this alert view, such as RED: dangerous operaction, BLUE:Operaction with will
 @param rightClickedBlock The clicked-block of the right button in this alert view
 @return The instance of this CUAlertView.
 */
-(instancetype)initWithTitle:(NSString *)title
                       image:(UIImage *)image
                     message:(NSString *)message
              leftButtonText:(NSString *)leftBtnText
                 leftClicked:(void(^)(void))leftClickedBlock
             rightButtonText:(NSString *)rightBtnText
             rightButtonColor:(CUAlertViewRightButtonColor)rightBtnColor
                rightClicked:(void(^)(void))rightClickedBlock;

/**
 Invoke this method to show up the alert view
 */
-(void)show;

/**
 Show up the alert view with a certain theme.
 
 @param theme The theme of CUAlertView
 */
-(void)showWithTheme:(CUAlertViewTheme)theme;

```

## Functions of encoding and decoding:
> CUCode.h

```
/**
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
 @warning The operactions associated with Keychain, please use it on real devices.
 */
+ (void)saveInKeychainWithIdentifier:(NSString *)identifier;

/**
 Load the unique identifier form Keychain

 @return nil or the identifier saved before
 @warning The operactions associated with Keychain, please use it on real devices.
 */
+ (NSString *)loadIdentifierFromKeychain;

/**
 Encode the given string with BASE64 encoding

 @param string The source string to encode with.
 @return Encoded BASE64 string
 */
+ (NSString*) BASE64EncodeWithString:(NSString*)string;

/**
 Decode the BASE64 string

 @param string The string to decode with.
 @return Decoded string
 */
+ (NSString*) BASE64DecodeWithString:(NSString*)string;

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
+ (NSString*) SHA1CodeWithData:(NSData*)data;

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
```

## The macros defined:
> CUDefine.h

```
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


/**
 Define Logger
 */
#ifdef DEBUG
#define Logger(...) NSLog(@"%s:%d %@", __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__])
#else
#define Logger(format, ...)
#endif
```

# License

[ [CUtil] ](https://github.com/acttos/CommonUtilities) is based on [ [The MIT License(MIT)] ](https://mit-license.org/) protocol.
<br/>
<br/>

> Thanks for visiting!
