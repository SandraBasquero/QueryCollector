//
//  DatabaseAccess.h
//  Kernel
//
//  Created by Juan Benavides Romero on 23/09/13.
//  Copyright (c) 2013 Letshealth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface DatabaseAccess : NSObject

@property NSString* tableName;

- (FMDatabase *) getConnection;

@end
