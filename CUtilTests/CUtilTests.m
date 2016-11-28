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
