//
//  SBSCityData.h
//  QueryCollector
//
//  Created by Sandra on 19/7/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "DatabaseAccess.h"
#import "SBSCityModel.h"

@interface SBSCityData : DatabaseAccess

-(void)createTable;

-(BOOL)AllCitiesFromServerToLocal:(NSArray*)citiList;
-(NSMutableArray *)getCitiesFromLocal;
-(BOOL)emptyCityTable;

@end
