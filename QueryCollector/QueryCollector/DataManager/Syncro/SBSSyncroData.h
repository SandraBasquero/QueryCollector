//
//  SBSSyncroData.h
//  QueryCollector
//
//  Created by Sandra on 19/7/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBSAnswerModel.h"

@interface SBSSyncroData : NSObject

-(NSArray*)getCitiesUpdated;
-(void)aQuestionIsAnswered:(SBSAnswerModel*)answerModel;
-(SBSAnswerModel*)getAnswerForAQuestion:(SBSAnswerModel*)answerModel;
-(BOOL)sendAnswersPendingToServer;

@end
