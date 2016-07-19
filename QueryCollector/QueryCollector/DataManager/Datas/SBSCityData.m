//
//  SBSCityData.m
//  QueryCollector
//
//  Created by Sandra on 19/7/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "SBSCityData.h"

@implementation SBSCityData

-(void)createTable {
    FMDatabase *database = [self getConnection];
    [database executeUpdate:@"CREATE TABLE IF NOT EXISTS City (name VARCHAR(255))"];
}

//Insert all server cities to local db
-(BOOL)AllCitiesFromServerToLocal:(NSArray*)citiList {
    NSArray *citiesTemporal = [[NSArray alloc]initWithArray:citiList];
    FMDatabase *database = [ self getConnection];
    BOOL success = true;
    if (citiesTemporal != nil) {
        for (int i = 0; i < citiesTemporal.count; i++) {
            success = [database executeUpdate:@"INSERT INTO City (name) VALUES (?);", [[citiesTemporal objectAtIndex:i]name]];
        }
    } else {
        success = false;
    }
    [database close];
    return success;
}

//Get all cities from local db
-(NSMutableArray *)getCitiesFromLocal {
    FMDatabase *database = [self getConnection];
    FMResultSet *results = [database executeQuery:@"SELECT * FROM City"];
    NSMutableArray * citiesList = [[NSMutableArray alloc]init];
    
    while ([results next]) {
        SBSCityModel *model = [SBSCityModel new];
        [model hydrateFromLocal:results];
        [citiesList addObject:model];
    }
    [database close];
    return citiesList;
}

//Delete all cities from local db. Empty the table.
-(BOOL)emptyCityTable {
    FMDatabase *database = [self getConnection];
    BOOL success = true;
    success = [database executeUpdate:@"DELETE FROM City;"];
    [database close];
    return  success;
}

@end
