//
//  CUFile.m
//  CUtil
//
//  Created by Acttos on 3/10/16.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.
//

#import "CUFile.h"

#import "CUDefine.h"

@implementation CUFile

+ (NSURL *)getDocumentsDirectory {
    NSError *error;
    NSURL *documentsDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:&error];
    return error ? nil : documentsDirectory;
}

+ (BOOL)createDirectoryAtPath:(NSString *)path {
    if (path == nil || [path isEqualToString:@""]) {
        Logger(@"The param 'path' can NOT be nil or empty.");
        return NO;
    }
    
    Logger(@"path:%@", path);
    
    BOOL isDirectory = YES;
    
    NSError *error;
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDirectory]) {
        Logger(@"Directory exists at: %@", path);
        return YES;
    }
    
    if ([[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error]) {
        Logger(@"Directory created at:%@", path);
        return YES;
    }
    
    return NO;
}

+ (BOOL)saveFile:(NSData *)data atPath:(NSString *)path {
    if (data == nil) {
        Logger(@"The param 'data' to be saved can NOT be nil");
        return NO;
    }
    
    if (path == nil || [path isEqualToString:@""]) {
        Logger(@"The param 'path' can NOT be nil or empty.");
        return NO;
    }
    
    if ([path hasSuffix:@"/"]) {
        Logger(@"The param 'path' can NOT end with '/'.");
        return NO;
    }
    
    BOOL result = NO;
    Logger(@"path:%@", path);
    
    NSURL *url = [NSURL URLWithString:path];
    NSURL *parentPath = [url URLByDeletingLastPathComponent];
    
    Logger(@"parentPath:%@", parentPath.path);
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:parentPath.path]) {
        if ([[NSFileManager defaultManager] createDirectoryAtPath:parentPath.path withIntermediateDirectories:YES attributes:nil error:nil]) {
            [data writeToFile:path atomically:YES];
            result = YES;
        } else {
            Logger(@"We can NOT write this data:%@ to the path:%@", data, path);
        }
    } else {
        [data writeToFile:path atomically:YES];
        result = YES;
    }
    
    return result;
}

+ (BOOL)saveFile:(NSData *)data atPath:(NSString *)path withName:(NSString *)fileName {
    if (data == nil) {
        Logger(@"The param 'data' to be saved can NOT be nil");
        return NO;
    }
    
    if (path == nil || [path isEqualToString:@""]) {
        Logger(@"The param 'path' can NOT be nil or empty.");
        return NO;
    }
    
    if ([path hasSuffix:@"/"]) {
        Logger(@"The param 'path' ends with '/'.");
        path = [path substringToIndex:path.length - 1];
    }
    
    if ([fileName hasSuffix:@"/"]) {
        Logger(@"The param 'fileName' can NOT end with '/'.");
        return NO;
    }
    
    BOOL result = NO;
    
    NSString *parentPath = path;
    NSString *absolutePath = path;
    
    if (fileName == nil || [fileName isEqualToString:@""]) {
        Logger(@"The param 'fileName' is nil or empty, we use the param 'path' be part of the file name.");
        parentPath = [[[NSURL URLWithString:path] URLByDeletingLastPathComponent] path];
    } else {
        absolutePath = [NSString stringWithFormat:@"%@/%@", path, fileName];
    }
    
    BOOL directoryCreated = [CUFile createDirectoryAtPath:parentPath];
    
    if (directoryCreated) {
        //创建成功
        result = [CUFile saveFile:data atPath:absolutePath];
    } else {
        //创建失败
        Logger(@"We can NOT create directory for this file.");
    }
    
    return result;
}

@end
