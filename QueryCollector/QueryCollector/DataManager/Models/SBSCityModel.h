//
//  SBSCityModel.h
//  QueryCollector
//
//  Created by Sandra on 19/7/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMResultSet.h"

@interface SBSCityModel : NSObject

@property NSString *name;

//Designado
-(id)initWithName:(NSString*) aName;


-(NSMutableArray*)hydrateCitiesArrayWith:(NSDictionary*)json;
-(void)hydrateFromLocal:(FMResultSet*)results;

@end
