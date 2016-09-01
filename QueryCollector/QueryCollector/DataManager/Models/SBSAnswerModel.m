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


@end
