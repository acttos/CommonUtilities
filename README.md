## 介绍

CommonUtilities是一个日常iOS开发通用工具类的Framework，采用Objective-C开发。
所有代码来源并总结于平时工作中，会不定期更新，欢迎[提出意见和建议](mailto:acttosma@gmail.com)。

## 使用方法

CommonUtilities已经支持通过Cocoapods进行安装：

在工程的Podfile中添加：

```
pod 'CUtil', '~> 0.0.5'
```

或者省略版本号

```
pod 'CUtil'
```
然后在需要使用到CommonUtilities的地方添加引入Model：

```
@import CUtil;
```

如果工程并未支持Pod，可以手动引用头文件：

```
#import "CommonUtilities.h"
```


## 功能介绍

### 存储功能相关

> CUStorage.h

```
/**
 *  将自定义service的数据写入系统Keychain中，避免用户卸载软件后，data发生变化，用于IMEI或者UserId
 *
 *  @param key  用来存储数据的Key
 *  @param data 需要存储的数据
 */
- (void)storeInKeychainWithKey:(NSString *)key data:(id)data;
/**
 *  根据service名称获取写入系统Keychain的数据
 *
 *  @param key 获取数据对应的Key
 *
 *  @return 存储在keychain中的数据
 */
- (id)loadFromKeychainWithKey:(NSString *)key;

```

### 颜色设置相关
> CUColor.h

```
/**
 *  根据传递的16进制数据生成UIColor实例
 *
 *  @param hexValue 16进制的颜色表示方式。如：0xFF00FF
 *
 *  @return 对应色值的UIColor实例
 */
+ (UIColor *)colorWithHex:(NSInteger)hexValue;
/**
 *  根据传递的16进制数据生成UIColor实例，该UIColor包含指定的透明度
 *
 *  @param hexValue 16进制的颜色表示方式。如：0xFF00FF
 *  @param alpha    颜色的透明度
 *
 *  @return 对应色值的UIColor实例
 */
+ (UIColor *)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alpha;
/**
 *  根据传递的色值字符串生成UIColor实例
 *
 *  @param hexString 以##开头的16进制色值字符串。如：##FF00FF
 *
 *  @return 对应色值的UIColor实例
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;
/**
 *  根据传递的色值字符串生成UIColor实例，该UIColor包含指定的透明度
 *
 *  @param hexString 以##开头的16进制色值字符串。如：##FF00FF
 *  @param alpha     颜色的透明度
 *
 *  @return 对应色值的UIColor实例
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

```

### 文件目录相关
> CUFile.h

```
/**
 *  返回当前App的Documents路径
 *
 *  @return Documents的URL
 */
+(NSURL *)getDocumentsDirectory;
```

### JSON解析相关
> CUJSON.h

```
/**
 *  根据给定的NSArray实例生成JSON字符串
 *
 *  @param array NSArray实例
 *
 *  @return NSArray对应的JSON字符串
 */
+(NSString *)JSONStringFromArray:(NSArray *)array;
/**
 *  根据给定的NSDictionary实例生成JSON字符串
 *
 *  @param dictionary NSDictionary实例
 *
 *  @return NSDictionary对应的JSON字符串
 */
+(NSString *)JSONStringFromDictionary:(NSDictionary *)dictionary;
/**
 *  将任意对象转换成JSON字符串，当给定object为nil或者不可解析为JSON时，返回错误
 *
 *  @param object 任意NSObject对象
 *
 *  @return 解析的JSON或错误内容
 */
+(NSString *)parseJSONStringFromObject:(NSObject *)object;

```

### 日期操作相关
> CUDate.h

```
/**
 *  根据当前时间创建时间戳
 *
 *  @return 当前时间的时间戳，精确到毫秒
 */
+(long long)generateMillisecondTime;
/**
 *  根据给定日期创建时间戳
 *
 *  @param date 需要转换为时间戳的NSDate对象
 *
 *  @return 转换后的时间戳，精确到毫秒
 */
+(long long)generateMillisecondTimeWithDate:(NSDate *)date;
/**
 *  将毫秒的时间转化为NSDate实例
 *
 *  @param milliseconds 某个时间对应的毫秒值
 *
 *  @return 给定时间戳对应的NSDate对象
 */
+(NSDate *)generateDateWithMilliseconds:(long long)milliseconds;
/**
 *  将NSDate对象进行格式化，采用当前时区
 *
 *  @param date   NSDate对象
 *  @param format 格式化字符串，如果为空或者nil，采用“yyyy-MM-dd HH:mm:ss”
 *
 *  @return 格式化后的字符串
 */
+(NSString *)stringOfDate:(NSDate *)date withFormat:(NSString *)format;
```

### 系统配置操作相关
> CUConfig.h

```
/**
 * 获取当前系统首选的语言标识
 */
+ (NSString *)getDeviceLanguage;
/**
 * 获取当前系统的语言编码
 */
+ (NSString *)getDeviceLanguageCode;
/**
 * 获取当先系统的国家和地区编码
 */
+ (NSString *)getDeviceCountryCode;
/**
 * 以i18N的格式输出当前系统的语言和地域，如"en_US,zh_CN,zh_TW,en_FR"
 */
+ (NSString *)getLocalStringIni18N;
/**
 * 是否为中文环境
 */
+ (BOOL)isChineseLang;
/**
 * 是否为阿拉伯语环境
 */
+ (BOOL)isArabicLang;
/**
 * 是否为法语环境
 */
+ (BOOL)isFrenchLang;

```

### 视图相关
> CULabel.h

```
/**
 计算一个UILabel视图在父视图中的大小和位置，UILabel的高度和宽度在实际布局中，还是很有实际意义的。

 @param label 要用于计算的UILabel实例
 @param view UILabel实例的父视图
 @return UILabel在父视图中的大小和位置参数
 */
+(CGSize)sizeOfLabel:(UILabel *)label inView:(UIView *)view;
```

> CUTipsView.h

```
/**
 已全屏幕的方式展现出一个带有转动菊花的Waiting视图

 @param tag 视图对应的tag，方便隐藏时使用
 @param _message Waiting视图中显示的文字消息
 */
+(void)showFullScreenWaitingViewWithTag:(NSUInteger)tag message:(NSString *)_message;

/**
 显示一个根据给定frame生成的带有转动菊花的Waiting视图

 @param tag 视图对应的tag，方便隐藏时使用
 @param _frame 视图整体的大小和位置参数
 @param _message Waiting视图中显示的文字消息
 */
+(void)showWaitingViewWithTag:(NSUInteger)tag frame:(CGRect)_frame message:(NSString *)_message;

/**
 在视图顶部显示的一个Tips视图，可包含文字和图片，该Tips视图会自动以向上滑出的方式消失

 @param _yOffset Tips视图距离屏幕顶部的偏移量，一般为0.0f
 @param aImage Tips视图中的图片，位于aMessage的左侧
 @param aMessage Tips视图中显示的文字消息
 @param view Tips视图的父View
 */
+(void)showPopDownTipsViewWithImage:(UIImage *)aImage message:(NSString *)aMessage yOffset:(CGFloat)_yOffset inView:(UIView *)view;

/**
 隐藏某个tag对应的视图，并从父视图中移除

 @param tag 视图对应的tag
 */
+(void)hideViewInWindowWithTag:(NSUInteger)tag;
```

### 编解码相关
> CUCode.h

```
/**
 将给定的字符串进行BASE64编码

 @param string 源字符串
 @return 经过BASE64编码后的字符串
 */
+ (NSString*) BASE64EncodeWithString:(NSString*)string;

/**
 将给定的字符串进行BASE64解码

 @param string 源字符串
 @return 经过BASE64解码后的字符串
 */
+ (NSString*) BASE64DecodeWithString:(NSString*)string;

/**
 将给定的字符串进行MD5摘要
 
 @param sourceString 源字符串
 @return 进行了MD5摘要后的字符串
 */
+ (NSString *) MD5CodeWithString:(NSString *)sourceString;

/**
 将给定的NSData实例进行MD5摘要
 
 @param data 给定的NSData实例
 @return 进行了MD5摘要后的字符串
 */
+ (NSString *) MD5CodeWithData:(NSData *) data;

/**
 将给定的字符串进行SHA1摘要

 @param sourceString 源字符串
 @return 进行了SHA1摘要后的字符串
 */
+ (NSString *) SHA1CodeWithString:(NSString *)sourceString;

/**
 将给定的NSData实例进行SHA1摘要
 
 @param data 给定的NSData实例
 @return 进行了SHA1摘要后的字符串
 */
+ (NSString*) SHA1CodeWithData:(NSData*)data;
```

## 开源协议

[ [CommonUtilities] ](https://github.com/majinshou/CommonUtilities) 基于 [ [The MIT License(MIT)] ](https://mit-license.org/) 协议开源。
<br/>
<br/>

> 感谢来访！
