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
    NSLog(@"answer con ciudad... %@",answerModel.city);
    NSLog(@"answer con uuid... %@",answerModel.userID);
    NSLog(@"answer con query... %@",answerModel.queryNumber);
    NSLog(@"answer con question... %@",answerModel.questionNumber);
    
    SBSAnswerModel *dataAnswer;
    SBSAnswerData *answData = [SBSAnswerData new];
    if ([answData isAnswerInLocalDB:answerModel]) {
        dataAnswer = [answData getAnswerOfAQuestionFromLocalDB:answerModel];
        NSLog(@"está en la bd");
    } else {
        dataAnswer = nil;
        NSLog(@"NO ESTAAAAA"); 
    }
    return dataAnswer;
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
