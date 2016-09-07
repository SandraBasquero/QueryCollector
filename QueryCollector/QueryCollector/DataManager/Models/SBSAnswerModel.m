//
//  SBSAnswerModel.m
//  QueryCollector
//
//  Created by Sandra on 24/8/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "SBSAnswerModel.h"

@implementation SBSAnswerModel

//Designado
-(id)initWithCity:(NSString*) aCity
              queryNum:(NSString*) aQueryNum
          questionNum:(NSString*) aQuestionNum
               answer:(NSString*) theAnswer
           textAnswer:(NSString*) text
               userID:(NSString*) aUser
              pending:(NSString*) pend {
    
    if (self = [super init]) {
        self.city = aCity;
        self.queryNumber = aQueryNum;
        self.questionNumber = aQuestionNum;
        self.answer = theAnswer;
        self.textAnswer = text;
        self.userID = aUser;
        self.pending = pend;
    }
    return self;
}

/*
//Conveniencia
-(id)initWhithCity:(NSString*) aCity
       andQueryNum:(NSString*) queryNum
           forUser:(NSString*) userId {
    return [self initWithCity:aCity
                     queryNum:queryNum
                  questionNum:@""
                       answer:@""
                   textAnswer:@""
                       userID:userId
                      pending:@""];
}*/

#pragma mark - Hydrates

-(void)hydrateFromLocalDB:(FMResultSet*)results {
    self.city = [results stringForColumn:@"city"];
    self.queryNumber = [results stringForColumn:@"queryNumber"];
    self.questionNumber = [results stringForColumn:@"questionNumber"];
    self.answer = [results stringForColumn:@"answer"];
    self.textAnswer = [results stringForColumn:@"textAnswer"];
    self.userID = [results stringForColumn:@"userID"];
    self.pending = [results stringForColumn:@"pending"];
}

-(void)hydrateFromJson:(NSDictionary*)results {
    self.city = [results valueForKey:@"city"];
    self.queryNumber = [results valueForKey:@"queryNumber"];
    self.questionNumber = [results valueForKey:@"questionNumber"];
    self.answer = [results valueForKey:@"answer"];
    self.textAnswer = [results valueForKey:@"textAnswer"];
    self.userID = [results valueForKey:@"userID"];
    self.pending = [results valueForKey:@"pending"];
}

#pragma mark - To Json

/*-(NSDictionary*)toJson:(SBSAnswerModel*)answ {
    return @{
             @"city":answ.city,
             @"queryNumber":answ.queryNumber,
             @"questionNumber":answ.questionNumber,
             @"answer":answ.answer,
             @"textAnswer":answ.textAnswer,
             @"userID":answ.userID,
             @"pending":answ.pending
             };
}*/

-(NSDictionary*)toJson:(FMResultSet*)results {
    return @{
             @"city":[results stringForColumn:@"city"],
             @"queryNumber":[results stringForColumn:@"queryNumber"],
             @"questionNumber":[results stringForColumn:@"questionNumber"],
             @"answer":[results stringForColumn:@"answer"],
             @"textAnswer":[results stringForColumn:@"textAnswer"],
             @"userID":[results stringForColumn:@"userID"],
             @"pending":[results stringForColumn:@"pending"]
             };
}
@end
