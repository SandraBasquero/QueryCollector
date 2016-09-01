//
//  SBSAnswerData.h
//  QueryCollector
//
//  Created by Sandra on 24/8/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "DatabaseAccess.h"
#import "SBSAnswerModel.h"

@interface SBSAnswerData : DatabaseAccess

-(void)createTable;


-(BOOL)insertNewAnswer:(SBSAnswerModel*)answer;
-(BOOL)isAnswerInLocalDB:(SBSAnswerModel*)answer;
-(BOOL)updateAnswerAndPendingInLocalDBFor:(SBSAnswerModel*)answer;
-(SBSAnswerModel*)getAnswerOfAQuestionFromLocalDB:(SBSAnswerModel*)answer ;
@end
