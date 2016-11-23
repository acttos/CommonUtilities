//
//  CUFile.m
//  CommonUtilities
//
//  Created by Acttos on 3/10/16.
//  Copyright © 2016 Acttos.org. All rights reserved.
//

#import "CUFile.h"

@implementation CUFile

+(NSURL *)getDocumentsDirectory {
    NSError *error;
    NSURL *documentsDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:&error];
    return error ? nil : documentsDirectory;
}

@end
