//
//  CUtilTests.m
//  CUtilTests
//
//  Created by Acttos on 28/11/2016.
//  Copyright © 2016 Acttos.org. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "CUtil.h"

@interface CUtilTests : XCTestCase

@end

@implementation CUtilTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    // 初始化的代码，在测试方法调用之前调用
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    // 释放测试用例的资源代码，这个方法会每个测试用例执行后调用
    [super tearDown];
}

- (void)testCUCode {
    NSString *identifier = [CUCode uniqueIdentifier];
    Logger(@"%@",identifier);
    XCTAssertNotNil(identifier);
    
    //    [CUCode saveInKeychainWithIdentifier:identifier];
    //    NSString *loadedIdeitifier = [CUCode loadIdentifierFromKeychain];
    
    //    XCTAssertEqual(identifier, loadedIdeitifier, @"YES, They are equal");
}

- (void)testCUColor {
    UIColor *stringColor = [CUColor colorWithHexString:@"#00FF00"];
    XCTAssertTrue(CGColorEqualToColor(stringColor.CGColor, [UIColor greenColor].CGColor));
    
    UIColor *stringColorWithAlpha = [CUColor colorWithHexString:@"#00FF00" alpha:1];
    XCTAssertTrue(CGColorEqualToColor(stringColorWithAlpha.CGColor, [UIColor greenColor].CGColor));
    
    UIColor *hexColor = [CUColor colorWithHex:0x00FF00];
    XCTAssertTrue(CGColorEqualToColor(hexColor.CGColor, [UIColor greenColor].CGColor));
    
    UIColor *hexColorWithAlpha = [CUColor colorWithHex:0x00FF00 alpha:1];
    XCTAssertTrue(CGColorEqualToColor(hexColorWithAlpha.CGColor, [UIColor greenColor].CGColor));
}

- (void)testCUDate {
    long long timestamp = [CUDate generateMillisecondTime];
    XCTAssertEqual((long)[NSDate dateWithTimeIntervalSince1970:timestamp].timeIntervalSince1970 * 1000, (long)[CUDate generateDateWithMilliseconds:timestamp].timeIntervalSince1970 * 1000);
    
    NSDate *now = [NSDate date];
    XCTAssertEqual([CUDate generateMillisecondTimeWithDate:now], (long long)([now timeIntervalSince1970] * 1000));
    
    NSString *nilDateString = [CUDate stringOfDate:now withFormat:nil];
    XCTAssertTrue([nilDateString isEqualToString:[CUDate stringOfDate:now withFormat:@"yyyy-MM-dd HH:mm:ss"]]);
}

- (void)testCUFile {
    NSString *docPath = [CUFile getDocumentsDirectory].path;
    NSLog(@"%@", docPath);
    XCTAssertTrue([docPath rangeOfString:@"data/Documents"].length == NSMakeRange(docPath.length - @"data/Documents".length, @"data/Documents".length).length);
    XCTAssertTrue([docPath rangeOfString:@"data/Documents"].location == NSMakeRange(docPath.length - @"data/Documents".length, @"data/Documents".length).location);
    
    BOOL result = [CUFile createDirectoryAtPath:[NSString stringWithFormat:@"%@/majinshou/videos/", docPath]];
    XCTAssertTrue(result);
    
    result = [CUFile saveFile:[NSData dataWithBytes:[docPath UTF8String] length:docPath.length] atPath:[NSString stringWithFormat:@"%@/stringBytes.txts", docPath]];
    XCTAssertTrue(result);
    
    result = [CUFile saveFile:[NSData dataWithBytes:[docPath UTF8String] length:docPath.length] atPath:docPath withName:@"anotherStringBytes.txtddd"];
    XCTAssertTrue(result);
}

- (void)testCUConfig {
    NSString *lang = [CUConfig getDeviceLanguage];
    XCTAssertTrue([lang isEqualToString:@"en"]);
    
    NSString *langCode = [CUConfig getDeviceLanguageCode];
    XCTAssertTrue([langCode isEqualToString:@"en"]);
    
    NSString *countryCode = [CUConfig getDeviceCountryCode];
    XCTAssertTrue([countryCode isEqualToString:@"US"]);
    
    NSString *i18N = [CUConfig getLocalStringIni18N];
    XCTAssertTrue([i18N isEqualToString:@"en_US"]);
    
    XCTAssertTrue(![CUConfig isChineseLang]);
    XCTAssertTrue(![CUConfig isArabicLang]);
    XCTAssertTrue(![CUConfig isFrenchLang]);
}

- (void)testCUJSON {
    NSArray *array = @[@"A", @"B", @"C", @"D", @"E"];
    XCTAssertNotNil([CUJSON JSONStringFromArray:array]);
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:4];
    [dic setValue:@"Value1" forKey:@"key1"];
    [dic setValue:[NSNumber numberWithInt:2] forKey:@"key2"];
    [dic setValue:array forKey:@"key3"];
    [dic setValue:@"Value4" forKey:@"key4"];
    XCTAssertNotNil([CUJSON JSONStringFromDictionary:dic]);
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    // 测试用例的例子，注意测试用例一定要test开头
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    // 测试性能例子
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        // 需要测试性能的代码
    }];
}
@end