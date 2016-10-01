//
//  SBSStatsManager.m
//  QueryCollector
//
//  Created by Sandra on 1/10/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "SBSStatsManager.h"

@implementation SBSStatsManager


-(NSString*)getJsonPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"stats.json"];
    
    return filePath;
}

-(void)saveJSON:(NSDictionary*)json {
    //[json writeToFile:[self getJsonPath] atomically:true];
    if(json != nil) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:json options:NSJSONWritingPrettyPrinted error:&error];
        [jsonData writeToFile:[self getJsonPath] atomically:true];
    }
}



-(NSDictionary*)getStats:(NSString*)city withQuery:(int)theQuery withQuestion:(int)question {
    NSDictionary *json = [self getJson];
    
    NSDictionary *jscity = [json objectForKey:city];
    if(!jscity) {
        return @{};
    }
    
    NSDictionary *jsquery = [[jscity objectForKey:@"query"] objectForKey:[NSString stringWithFormat:@"%i", theQuery]];
    if(!jsquery) {
        return @{};
    }
    
    NSDictionary *jsquestion = [[jsquery objectForKey:@"questions"] objectForKey:[NSString stringWithFormat:@"%i", question]];
    if(!jsquestion) {
        return @{};
    } else {
        return jsquestion;
    }
}


-(NSDictionary*)getJson {
    //return [NSDictionary dictionaryWithContentsOfFile:[self getJsonPath]];
    NSError *error;
    NSData *jsonData = [NSData dataWithContentsOfFile:[self getJsonPath]];
    return [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
}

@end
