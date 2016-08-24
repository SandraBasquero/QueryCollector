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
-(id)initWithWorkshop:(NSString*) aCity
              caseNum:(NSString*) aQueryNum
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


@end
