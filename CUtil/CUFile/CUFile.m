//
//  CUFile.m
//  CommonUtilities
//
//  Created by Acttos on 3/10/16.
//  Copyright © 2016 Acttos.org. All rights reserved.
//

#import "CUFile.h"

#import "CUDefine.h"

@implementation CUFile

+ (NSURL *)getDocumentsDirectory {
    NSError *error;
    NSURL *documentsDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:&error];
    return error ? nil : documentsDirectory;
}

+ (void)saveFile:(NSData *)data atPath:(NSString *)path {
    if (data == nil) {
        Logger(@"The param 'data' to be saved can NOT be nil");
        return;
    }
    
    if (path == nil || [path isEqualToString:@""]) {
        Logger(@"The param 'path' can NOT be nil or empty.");
        return;
    }
    
    NSURL *url = [NSURL URLWithString:path];
    NSURL *parentPath = [url URLByDeletingPathExtension];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:parentPath.path isDirectory:nil]) {
        if ([[NSFileManager defaultManager] createDirectoryAtPath:parentPath.path withIntermediateDirectories:YES attributes:nil error:nil]) {
            [data writeToFile:path atomically:YES];
        } else {
            Logger(@"We can NOT write this data:%@ to the path:%@", data, path);
        }
    } else {
        [data writeToFile:path atomically:YES];
    }
}

@end
