//
//  SBSAnswerData.m
//  QueryCollector
//
//  Created by Sandra on 24/8/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "SBSAnswerData.h"

@implementation SBSAnswerData

-(void)createTable {
    FMDatabase *database = [self getConnection];
    [database executeUpdate:@"CREATE TABLE IF NOT EXISTS ANSWER (city VARCHAR(255), queryNumber VARCHAR(255), questionNumber VARCHAR(255), answer VARCHAR(255), textAnswer VARCHAR(255), userID VARCHAR(255), pending VARCHAR(255))"];
}

@end
