//
//  SBSSyncroData.m
//  QueryCollector
//
//  Created by Sandra on 19/7/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "SBSSyncroData.h"
#import "SBSApiDataManager.h"
#import "SBSCityData.h"

@implementation SBSSyncroData

#pragma mark - City
-(NSArray*)getCitiesUpdated {
    SBSCityData *cityData = [SBSCityData new];
    NSArray *cityTemporal = [[NSArray alloc]initWithArray:[[SBSApiDataManager new] getCitiesFromServer]];
    NSArray *listBack;
    if (cityTemporal != nil && cityTemporal.count > 0) {
        [cityData emptyCityTable];
        [cityData AllCitiesFromServerToLocal: cityTemporal];
    }
    listBack = [[NSArray alloc]initWithArray:[cityData getCitiesFromLocal]];
    return listBack;
}


@end
