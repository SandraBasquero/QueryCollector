//
//  SBSAnswerModel.h
//  QueryCollector
//
//  Created by Sandra on 24/8/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMResultSet.h"

@interface SBSAnswerModel : NSObject

@property NSString *city;
@property NSString *queryNumber;
@property NSString *questionNumber;
@property NSString *answer; //array/dictionary...
@property NSString *textAnswer;
@property NSString *userID;
@property NSString *pending; //BOOL

//Designado
-(id)initWithCity:(NSString*) aCity
         queryNum:(NSString*) aQueryNum
      questionNum:(NSString*) aQuestionNum
           answer:(NSString*) theAnswer
       textAnswer:(NSString*) text
           userID:(NSString*) aUser
          pending:(NSString*) pend;
/*
//Conveniencia
-(id)initWhithCity:(NSString*) aCity
       andQueryNum:(NSString*) queryNum
           forUser:(NSString*) userId;*/

-(void)hydrateFromLocalDB:(FMResultSet*)results;

@end
