//
//  CUtilTests.m
//  CUtilTests
//
//  Created by Acttos on 28/11/2016.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.
//

#import <XCTest/XCTest.h>

#import "CUtil.h"

@interface CUtilTests : XCTestCase

@end

@implementation CUtilTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCUCode {
    NSString *identifier = [CUCode uniqueIdentifier];
    XCTAssertNotNil(identifier);
    
//    Codes with Keychain can NOT be tested here because we can only test logic on simulators which is not supporting Keychain.
//    [CUCode saveInKeychainWithIdentifier:identifier];
//    XCTAssertTrue([identifier isEqualToString:[CUCode loadIdentifierFromKeychain]]);
    
    NSString *sourceString = @"HelloSourceStringWhichIsGoingToBeEncodedAsBASE64.";
    XCTAssertTrue([@"abad2da070f76f70e3494bf0880d195a" isEqualToString:[CUCode MD5CodeWithString:sourceString]]);
    XCTAssertTrue([@"b37faee2bce0691b66aceb391fa05644082e926e" isEqualToString:[CUCode SHA1CodeWithString:sourceString]]);
    
    NSString *encodedString = [CUCode BASE64EncodeWithString:sourceString];
    XCTAssertTrue([@"SGVsbG9Tb3VyY2VTdHJpbmdXaGljaElzR29pbmdUb0JlRW5jb2RlZEFzQkFTRTY0Lg==" isEqualToString:encodedString]);
    
    NSString *decodedString = [CUCode BASE64DecodeWithString:encodedString];
    XCTAssertTrue([decodedString isEqualToString:sourceString]);
    
    NSString *path = @"/Volumes/Data/Documents/GitHub_Code/personal/iOS/CUtilDev/CUtilDev/images/cut.png";
    NSURL *url = [NSURL URLWithString:path];
    NSData *data = [NSData dataWithContentsOfFile:path];
    XCTAssertTrue([@"48ee371f2994ef69e5cd5bb5d1835d51" isEqualToString:[CUCode MD5CodeWithData:data]]);
    XCTAssertTrue([@"22df248ead75d4a95cae001344417fb464168582" isEqualToString:[CUCode SHA1CodeWithData:data]]);
    XCTAssertTrue([@"48ee371f2994ef69e5cd5bb5d1835d51" isEqualToString:[CUCode MD5CodeWithFileAtPath:path]]);
    XCTAssertTrue([@"22df248ead75d4a95cae001344417fb464168582" isEqualToString:[CUCode SHA1CodeWithFileAtPath:path]]);
    XCTAssertTrue([@"48ee371f2994ef69e5cd5bb5d1835d51" isEqualToString:[CUCode MD5CodeWithFileAtURL:url]]);
    XCTAssertTrue([@"22df248ead75d4a95cae001344417fb464168582" isEqualToString:[CUCode SHA1CodeWithFileAtURL:url]]);
    
    path = @"file:///Volumes/Data/Documents/GitHub_Code/personal/iOS/CUtilDev/CUtilDev/images/cut.png";
    url = [NSURL URLWithString:path];
    data = [NSData dataWithContentsOfFile:path];
    XCTAssertFalse([@"48ee371f2994ef69e5cd5bb5d1835d51" isEqualToString:[CUCode MD5CodeWithData:data]]);
    XCTAssertFalse([@"22df248ead75d4a95cae001344417fb464168582" isEqualToString:[CUCode SHA1CodeWithData:data]]);
    XCTAssertTrue([@"48ee371f2994ef69e5cd5bb5d1835d51" isEqualToString:[CUCode MD5CodeWithFileAtPath:path]]);
    XCTAssertTrue([@"22df248ead75d4a95cae001344417fb464168582" isEqualToString:[CUCode SHA1CodeWithFileAtPath:path]]);
    XCTAssertTrue([@"48ee371f2994ef69e5cd5bb5d1835d51" isEqualToString:[CUCode MD5CodeWithFileAtURL:url]]);
    XCTAssertTrue([@"22df248ead75d4a95cae001344417fb464168582" isEqualToString:[CUCode SHA1CodeWithFileAtURL:url]]);
    
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
    NSString *arrayJSON = [CUJSON JSONStringFromArray:array];
    XCTAssertNotNil(arrayJSON);
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:4];
    [dic setValue:@"Value1" forKey:@"key1"];
    [dic setValue:[NSNumber numberWithInt:2] forKey:@"key2"];
    [dic setValue:array forKey:@"key3"];
    [dic setValue:@"Value4" forKey:@"key4"];
    
    NSMutableDictionary *subDic = [NSMutableDictionary dictionaryWithCapacity:4];
    [subDic setValue:@"SubValue1" forKey:@"SubKey1"];
    [subDic setValue:[NSNumber numberWithInt:2] forKey:@"SubKey2"];
    [subDic setValue:array forKey:@"SubKey3"];
    [subDic setValue:@"Value4" forKey:@"SubKey4"];
    [dic setValue:subDic forKey:@"subDic"];
    NSString *dicJSON = [CUJSON JSONStringFromDictionary:dic];
    XCTAssertNotNil(dicJSON);
    
    NSArray *parsedArray = [CUJSON arrayFromJSON:arrayJSON];
    XCTAssertNotNil(parsedArray);
    NSDictionary *parsedDic = [CUJSON dictionaryFromJSON:dicJSON];
    XCTAssertNotNil(parsedDic);
}

- (void)testCUString {
    NSString *source = @"Hello,Hello,Hello,How are you!";
    NSString *pattern = @"Hello";
    
    XCTAssertTrue([source indexOf:pattern] == 0);
    XCTAssertTrue([source lastIndexOf:pattern] == 12);
    
    XCTAssertTrue([[source replaceFirst:pattern with:@""] isEqualToString:@",Hello,Hello,How are you!"]);
    XCTAssertTrue([[source replaceLast:pattern with:@""] isEqualToString:@"Hello,Hello,,How are you!"]);
    XCTAssertTrue([[source replaceAll:pattern with:@""] isEqualToString:@",,,How are you!"]);
    
    XCTAssertTrue([@"" isEmpty]);
    XCTAssertTrue([@"   " isEmpty]);
    XCTAssertFalse([@"s" isEmpty]);
    
    NSString *fullString = @"0123456789";
    
    XCTAssertTrue([fullString startsWith:@"012"]);
    XCTAssertFalse([fullString startsWith:@"34"]);
    
    XCTAssertTrue([fullString endsWith:@"789"]);
    XCTAssertFalse([fullString endsWith:@"34"]);
    
    XCTAssertTrue([@"012" isEqualToString:[fullString substring:0 to:3]]);

    XCTAssertTrue([[@"  123  456  " trim] isEqualToString:@"123  456"]);
    Logger(@"%@", [@"1,2,3,4,5,6,7,8,9,,,,,," splitBy:@","]);
}

- (void)testCUData {
    NSString *sourceString = @"/Users/majinshou/Library/Developer/Xcode/DerivedData/CUtilDev-bntonewhxafmvchfbzmhidvthpkf/Logs/Test/C4106638-EFAF-42CF-882D-4C9FD29C3A4C/Session-CUtilTests-2017-01-05_173915-27sbPP.log";
    NSData *sourceData = [sourceString dataUsingEncoding:NSUTF8StringEncoding];
    NSData *compressedData = [sourceData zlibCompress];
    XCTAssertTrue(sourceData.length > compressedData.length);
    
    NSData *decompressedData = [compressedData zlibDecompress];
    XCTAssertTrue(sourceData.length == decompressedData.length);
    
    compressedData = [sourceData gzipCompress];
    XCTAssertTrue(sourceData.length > compressedData.length);
    
    decompressedData = [compressedData gzipDecompress];
    XCTAssertTrue(sourceData.length == decompressedData.length);
    
    NSData *encryptedData = [sourceData AES256EncryptWithKey:@"HULUCAT"];
    NSData *decryptedData = [encryptedData AES256DecryptWithKey:@"HULUCAT"];
    Logger(@"Encrypted:%@", [[NSString alloc] initWithData:encryptedData encoding:NSUTF8StringEncoding]);
    Logger(@"Decrypted:%@", [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding]);
    XCTAssertTrue(sourceData.length == decryptedData.length);
    XCTAssertTrue([sourceString isEqualToString:[[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding]]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}
@end
