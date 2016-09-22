//
//  SBSApiDataManager.h
//  QueryCollector
//
//  Created by Sandra on 19/7/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBSCityModel.h"

@interface SBSApiDataManager : NSObject

-(BOOL)sendAnwers:(NSMutableArray*)answerArray;
-(NSArray*) getCitiesFromServer;
-(NSDictionary*) getStatsFromServer;

@end
