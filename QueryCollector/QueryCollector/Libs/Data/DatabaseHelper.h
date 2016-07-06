//
//  DatabaseHelper.h
//  Kernel
//
//  Created by Juan Benavides Romero on 23/09/13.
//  Copyright (c) 2013 Letshealth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DatabaseHelper : NSObject

@property NSString *databaseName;
@property NSString *databasePath;

+(void)configureDatabase:(NSString*)databaseName;
+(void)setDatabaseName:(NSString*)databaseName;
+(NSString*)getDatabasePath;
+(NSString*)generateUUID;

@end
