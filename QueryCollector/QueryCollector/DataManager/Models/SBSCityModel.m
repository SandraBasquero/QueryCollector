//
//  SBSCityModel.m
//  QueryCollector
//
//  Created by Sandra on 19/7/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "SBSCityModel.h"

@implementation SBSCityModel

//Designado
-(id)initWithName:(NSString*) aName {
    if (self = [super init]) {
        self.name = aName;
    }
    return self;
}

#pragma mark - Hydrates

//Hydrate City models with json taken from server.
-(NSMutableArray*)hydrateCitiesArrayWith:(NSDictionary*)json {
    
    NSMutableArray * citiesList = [[NSMutableArray alloc]init];
    for (int i = 0; i < json.count; i++) {
        SBSCityModel * work = [[SBSCityModel alloc]initWithName:[json objectForKey:[NSString stringWithFormat:@"city%i",i+1]]];
        [citiesList addObject:work];
    }
    return citiesList;
}

-(void)hydrateFromLocal:(FMResultSet*)results {
    self.name = [results stringForColumn:@"name"];
}

@end
