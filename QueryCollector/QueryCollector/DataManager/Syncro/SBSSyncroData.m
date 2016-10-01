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
#import "SBSAnswerData.h"
#import "SBSStatsManager.h"

#import "Reachability.h"

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

#pragma mark - Answer

//Check if an answer was created and insert it to local db and update Pending
-(void)aQuestionIsAnswered:(SBSAnswerModel*)answerModel {
    answerModel.pending = @"true";
    SBSAnswerData *answData = [SBSAnswerData new];
    if ([answData isAnswerInLocalDB:answerModel]) {
        [answData updateAnswerAndPendingInLocalDBFor:answerModel];
    } else {
        [answData insertNewAnswer:answerModel]; //in local DB
    }
}


-(SBSAnswerModel*)getAnswerForAQuestion:(SBSAnswerModel*)answerModel {
    SBSAnswerModel *dataAnswer;
    SBSAnswerData *answData = [SBSAnswerData new];
    if ([answData isAnswerInLocalDB:answerModel]) {
        dataAnswer = [answData getAnswerOfAQuestionFromLocalDB:answerModel];
    } else {
        dataAnswer = nil;
    }
    return dataAnswer;
}

//Send pending answers to Server if there's Internet connection
-(BOOL)sendAnswersPendingToServer {
    if ([self internetState]) {
        SBSAnswerData *answData = [SBSAnswerData new];
        NSMutableArray *answersPendingArray = [answData getAnswersPending];
        //NSLog(@"number of trues %lu ",(unsigned long)answersPendingArray.count);
        
        //Sending all answers to Server
        BOOL success = [[SBSApiDataManager new]sendAnwers:answersPendingArray];
        if (success) {
            for (int i = 0; i < answersPendingArray.count; i++) {
                SBSAnswerModel *an = [SBSAnswerModel new];
                [an hydrateFromJson:[answersPendingArray objectAtIndex:i]];
                an.pending = @"false";
                [answData updatePendingStateOf:an];
            }
            NSLog(@"YEEEEEEEEEES");
        } else {
            // no se envia o no entrega bien en el server
            NSLog(@"NOOOOOOOOO");
            success = false;
        }
        return success;
    } else {
        return  false;
    }
}

#pragma mark - Stats
-(void) getStats {
    SBSApiDataManager *apiData = [[SBSApiDataManager alloc]init];
    NSDictionary* allStats = [apiData getStatsFromServer];
    
    SBSStatsManager *manager = [SBSStatsManager new];
    [manager saveJSON:allStats];
}

#pragma mark - Internet

-(BOOL)internetState {
    if ([[Reachability reachabilityForInternetConnection]currentReachabilityStatus]==NotReachable) {
        NSLog(@"NO TENGO INTERNET");
        return  false;
    }
    else {
        NSLog(@"SI TENGO INTERNET");
        return true;
    }
}
@end
