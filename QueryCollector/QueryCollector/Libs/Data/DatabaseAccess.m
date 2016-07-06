//
//  DatabaseAccess.m
//  Kernel
//
//  Created by Juan Benavides Romero on 23/09/13.
//  Copyright (c) 2013 Letshealth. All rights reserved.
//

#import "DatabaseAccess.h"
#import "DatabaseHelper.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "FMResultSet.h"

@implementation DatabaseAccess

-(FMDatabase *)getConnection {
    FMDatabase *database = [FMDatabase databaseWithPath:[DatabaseHelper getDatabasePath]];
    
    database.logsErrors = TRUE;
    
#ifdef DEBUG
    database.traceExecution = FALSE;
#else
    database.traceExecution = FALSE;
#endif
    
    database.columnsLowerCaseActivate = TRUE;
    
    [database open];
    
    return database;
}

@end