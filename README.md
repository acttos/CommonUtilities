## 介绍

CUtil是一个日常的、适用于iOS开发的、通用的、工具类的Framework，采用Objective-C编写。
所有代码来源并总结于平时，会不定期更新，欢迎[提出意见和建议](mailto:acttosma@gmail.com)。

## 使用方法

#### 使用CocoaPods：
CUtil已经支持通过Cocoapods进行安装：

在工程的Podfile中添加：

```
pod 'CUtil'
```

或者指定版本号，不指定版本号会默认安装最新版本

```
pod 'CUtil', '~> x.x.x'
```

CUtil在CocoaPods中的版本请参见：[[CUtil on CocoaPods.org]](https://cocoapods.org/pods/CUtil){:target="_blank"}。

然后在需要使用到CUtil的地方添加引入Module：

```
@import CUtil;
```

#### 未使用CocoaPods:
如果工程尚未支持CocoaPods，则需要将CUtil下的所有文件拖拽到项目的frameworks下，并添加到Xcode的groups中。在需要使用CUtil的文件中引入：


```
#import <CUtil/CUtil.h>
```


## 功能介绍

### 存储功能相关

> CUStorage.h

```
/**
 *  将自定义data的数据写入系统Keychain中，data的值不随app的卸载、重装而发生变化，常用于存储固定的UserId。
 *
 *  @param key  用来存储数据的Key
 *  @param data 需要存储的数据
 *  @warning 跟Keychain相关的读写操作，仅在真机上验证通过
 */
+ (void)storeInKeychainWithKey:(NSString *)key data:(id)data;

/**
 *  根据key名称获取写入系统Keychain的数据
 *
 *  @param key 获取数据对应的Key
 *
 *  @return 存储在keychain中的数据
 *  @warning 跟Keychain相关的读写操作，仅在真机上验证通过
 */
+ (id)loadFromKeychainWithKey:(NSString *)key;

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
+ (NSURL *)getDocumentsDirectory;

/**
 在指定路径创建目录，创建的目录包括父目录。

 @param path 给定的创建目录，需要直接写具体路径，如："/videos/2016/12/"
 
 @return 目录存在或创建成功：YES，否则：NO
 @warning 该方法的根目录为当前应用的data目录，所有目录的建立，均在此data目录下。PS：data目录可理解为沙河中可访问的顶层目录。
 */
+ (BOOL)createDirectoryAtPath:(NSString *)path;

/**
 在指定的path目录存储data数据

 @param data 要存储的数据
 @param path 存储数据的具体路径，注意这个路径是"包含文件名的"路径，不是存放文件的目录，不能以"/"结尾
 
 @return 保存成功：YES，否则：NO
 */
+ (BOOL)saveFile:(NSData *)data atPath:(NSString *)path;

/**
 在指定的path目录，按照fileName存储数据data。

 @param data 要存储的数据
 @param path 存储数据的具体目录，此处为文件存储的具体目录，不能以"/"结尾
 @param fileName 要存放的data的文件名称
 
 @return 保存成功：YES，否则：NO
 */
+ (BOOL)saveFile:(NSData *)data atPath:(NSString *)path withName:(NSString *)fileName;
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
 获取当前系统首选的语言标识

 @return 当前系统首选的语言，采用系统给出的值
 */
+ (NSString *)getDeviceLanguage;

/**
 获取当前系统的语言编码

 @return 语言编码，如：en,zh,ar,fr等
 */
+ (NSString *)getDeviceLanguageCode;

/**
 获取当先系统的国家或地区编码

 @return 国家或地区编码，如：CN,US,UK,AR,FR,TW,HK等
 */
+ (NSString *)getDeviceCountryCode;

/**
 以i18N的格式输出当前系统的语言和地域，如"en_US,zh_CN,zh_TW,en_FR"

 @return 将国家码和语言码组合后返回，是目前网络协议中常见的格式。
 */
+ (NSString *)getLocalStringIni18N;

/**
 是否为中文环境

 @return 中文：YES，否则：NO
 */
+ (BOOL)isChineseLang;

/**
 是否为阿拉伯语环境，因为阿拉伯语在界面布局时，需要从右向左设计，因此，这个方法有较高的使用率。
 
 @return 阿拉伯语：YES，否则：NO
 */
+ (BOOL)isArabicLang;

/**
 是否为法语环境
 
 @return 法语：YES，否则：NO
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
 *  在给定的view中显示一个类似于Android Toast效果的弹框。
 *
 *  @param view     弹框的父视图容器View
 *  @param message  弹框需要显示的文字内容
 *  @param _duration Toast消失过程持续的时间，单位：秒
 *  @param _delay    Toast持续显示的时间，单位：秒
 */
+ (void)showToastInView:(UIView *)view withMessage:(NSString *)message duration:(float)_duration delay:(float)_delay;

/**
 在给定的view中显示一个类似于Android Toast效果的弹框。该弹框支持自定义frame

 @param view 弹框的父视图容器view
 @param frame 弹框的frame
 @param _message 弹框要显示的消息
 @param _duration Toast消失过程持续的时间，单位：秒
 @param _delay Toast持续显示的时间，单位：秒
 */
+ (void)showToastInView:(UIView *)view withFrame:(CGRect)frame message:(NSString *)_message duration:(float)_duration delay:(float)_delay;

/**
 已全屏幕的方式展现出一个带有转动菊花的Waiting视图
 
 @param tag 视图对应的tag，方便隐藏时使用
 @param _message Waiting视图中显示的文字消息
 @warning 本方法不能应用在Extension中，因为获取不到UIWindow.keyWindow.
 */
+(void)showFullScreenWaitingViewWithTag:(NSUInteger)tag message:(NSString *)_message;

/**
 显示一个根据给定frame生成的带有转动菊花的Waiting视图
 
 @param tag 视图对应的tag，方便隐藏时使用
 @param _frame 视图整体的大小和位置参数
 @param _message Waiting视图中显示的文字消息
 @warning 本方法不能应用在Extension中，因为获取不到UIWindow.keyWindow.
 */
+(void)showWaitingViewWithTag:(NSUInteger)tag frame:(CGRect)_frame message:(NSString *)_message;

/**
 在指定的view中显示一个根据frame生成的带有转动菊花的Waiting视图
 
 @param view waiting视图的父视图
 @param tag 视图对应的tag，方便隐藏时使用
 @param _frame 视图整体的大小和位置参数
 @param _message Waiting视图中显示的文字消息
 */
+(void)showWaitingViewInView:(UIView *)view withTag:(NSUInteger)tag frame:(CGRect)_frame message:(NSString *)_message;

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


/**
 根据宽和高生成一个在屏幕（Screen）上下左右居中的CGRect结构体

 @param width 宽数值
 @param _height 高数值
 @return 全居中的frame数值
 */
+(CGRect)centeredFrameWithWidth:(float)width height:(float)_height;

```

> CUToastView.h (Duplicated from CUTipsView.h)
 
```
/**
 *  在给定的view中显示一个类似于Android Toast效果的弹框。
 *
 *  @param view     弹框的父视图容器View
 *  @param message  弹框需要显示的文字内容
 *  @param _duration Toast消失过程持续的时间，单位：秒
 *  @param _delay    Toast持续显示的时间，单位：秒
 */
+ (void)showToastInView:(UIView *)view withMessage:(NSString *)message duration:(float)_duration delay:(float)_delay;

/**
 在给定的view中显示一个类似于Android Toast效果的弹框。该弹框支持自定义frame

 @param view 弹框的父视图容器view
 @param frame 弹框的frame
 @param _message 弹框要显示的消息
 @param _duration Toast消失过程持续的时间，单位：秒
 @param _delay Toast持续显示的时间，单位：秒
 */
+ (void)showToastInView:(UIView *)view withFrame:(CGRect)frame message:(NSString *)_message duration:(float)_duration delay:(float)_delay;
```

### 编解码相关
> CUCode.h

```
/**
 生成一个全球唯一的Id ^_-，可结合

 @return 全球唯一的编号
 */
+ (NSString *)uniqueIdentifier;


/**
 采用Keychain来保存唯一ID,如果之前有保存过，则覆盖旧值

 @param identifier 用来保存的唯一ID
 @warning 跟Keychain相关的读写操作，仅在真机上验证通过
 */
+ (void)saveInKeychainWithIdentifier:(NSString *)identifier;


/**
 从Keychain中加载保存的唯一ID

 @return Key中保存的唯一ID，如果之前未保存过，返回nil
 @warning 跟Keychain相关的读写操作，仅在真机上验证通过
 */
+ (NSString *)loadIdentifierFromKeychain;

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
 根据给定的path对应的文件进行MD5摘要

 @param path 文件的path，需要直接写具体路径，如："/home/user/photo.png"
 @return 文件的MD5摘要
 */
+ (NSString *) MD5CodeWithFileAtPath:(NSString *) path;

/**
 根据给定的url对应的文件进行MD5摘要
 
 @param url 文件的url，url的构建需要符合文件头scheme，如："file:///home/user/photo.png"
 @return 文件的MD5摘要
 */
+ (NSString *) MD5CodeWithFileAtURL:(NSURL *) url;

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

/**
 根据给定的path对应的文件进行SHA1摘要
 
 @param path 文件的path，需要直接写具体路径，如："/home/user/photo.png"
 @return 文件的SHA1摘要
 */
+ (NSString *) SHA1CodeWithFileAtPath:(NSString *) path;

/**
 根据给定的url对应的文件进行SHA1摘要
 
 @param url 文件的url，url的构建需要符合文件头scheme，如："file:///home/user/photo.png"
 @return 文件的SHA1摘要
 */
+ (NSString *) SHA1CodeWithFileAtURL:(NSURL *) url;

```

## 开源协议

[ [CUtil] ](https://github.com/acttos/CommonUtilities){:target="_blank"} 基于 [ [The MIT License(MIT)] ](https://mit-license.org/) 协议开源。
<br/>
<br/>

> 感谢来访！
