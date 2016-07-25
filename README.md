# CommonUtilities

日常iOS开发通用工具类。
以下代码来源于平时工作中，并且会不定期更新。

## 使用方法
引入CommonUtilities.h即可使用各个工具所包含的方法

```
#import "CommonUtilities.h"

```

## 功能介绍

### 存储功能相关
##### CUStorage.h

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
##### CUColor.h

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
##### CUFile.h

```
/**
 *  返回当前App的Documents路径
 *
 *  @return Documents的URL
 */
+(NSURL *)getDocumentsDirectory;


```

### JSON解析相关
##### CUJSON.h

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
##### CUDate.h

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

# 开源协议

****

基于[GPL(General Public License)](https://en.wikipedia.org/wiki/GNU_General_Public_License)协议开源。


