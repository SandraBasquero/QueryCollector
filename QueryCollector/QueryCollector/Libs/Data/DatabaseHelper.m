//
//  DatabaseHelper.m
//  Kernel
//
//  Created by Juan Benavides Romero on 23/09/13.
//  Copyright (c) 2013 Letshealth. All rights reserved.
//

#import "DatabaseHelper.h"

@implementation DatabaseHelper

+(DatabaseHelper*)instance {
    static DatabaseHelper* _instance = nil;
    
    if( _instance == nil ) {
        _instance = [DatabaseHelper new];
    }
    
    return _instance;
}


+(void)configureDatabase:(NSString *)databaseName {
    [self.instance setDatabaseName:databaseName];
    
    BOOL exitsDatabase;
    BOOL success;
    NSError *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    exitsDatabase = [fileManager fileExistsAtPath:self.instance.databasePath];
    
    if(!exitsDatabase) {
        NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:self.instance.databaseName];
        success = [fileManager removeItemAtPath:self.instance.databasePath error:NULL];
        
        NSLog(databasePathFromApp);
        NSLog(@"-------");
        NSLog(self.instance.databasePath);
        NSLog(@"#######");
        
        success = [fileManager copyItemAtPath:databasePathFromApp toPath:self.instance.databasePath error:&error ];
        
        if (!success) {
            NSLog( @"Error al crear la base de datos '%@'.", [error localizedDescription]);
        }
    }
}


+(void)setDatabaseName:(NSString *)databaseName {
    self.instance.databaseName = databaseName;
    
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentDir = [documentPaths objectAtIndex:0];
    
    NSLog(@"DOCUMENTS %@", documentDir);
    
    self.instance.databasePath = [documentDir stringByAppendingPathComponent:self.instance.databaseName];
}


+(NSString *) getDatabasePath {
    return self.instance.databasePath;
}


+ (NSString *) generateUUID {
    CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
    NSString *uuidStr = (__bridge_transfer NSString *)CFUUIDCreateString(kCFAllocatorDefault, uuid);
    CFRelease(uuid);
    
    return uuidStr;
}


@end