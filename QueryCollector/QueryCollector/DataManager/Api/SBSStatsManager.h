//
//  SBSStatsManager.h
//  QueryCollector
//
//  Created by Sandra on 1/10/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SBSStatsManager : NSObject

-(void)saveJSON:(NSDictionary*)json;
-(NSDictionary*)getStats:(NSString*)city withQuery:(int)theQuery withQuestion:(int)question;

@end
