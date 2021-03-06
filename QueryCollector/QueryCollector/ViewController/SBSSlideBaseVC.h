//
//  SBSSlideBaseVC.h
//  QueryCollector
//
//  Created by Sandra on 26/7/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBSQueryMasterVC.h"
#import "SBSSessionActivityModel.h"
#import "SBSAnswerModel.h"

#import "SBSSyncroData.h"

@interface SBSSlideBaseVC : UIViewController

@property (nonatomic) SBSQueryMasterVC *masterVC;
@property SBSSessionActivityModel *sessionHandler;
@property SBSSyncroData *syncData;

//Styles
-(void)customBorderStyles:(NSArray*)elements;
-(void)buttonUnselectedStyle:(UIButton*)btn;
-(void)buttonSelectedStyle:(UIButton*)btn;
-(void) autoSelectAnsweredBtn:(SBSAnswerModel*)answerModel inColection:(NSArray*)answerBtnArray;
-(void) autoSelectAnsweredBtnsMulti:(SBSAnswerModel*)answerModel inColection:(NSArray*)answerBtnArray;

//Buttons Actions
-(void)selectOne:(UIButton*)sender inCollection:(NSArray*)collection;
-(void)selectOne:(UIButton*)sender;


-(SBSAnswerModel*)buildAnswer:(long)numAnswer
                   inQuestion:(int)numQuestion;
-(SBSAnswerModel*)buildMultiAnswers:(NSMutableArray*)numAnswers
                         inQuestion:(int)numQuestion;
-(SBSAnswerModel*)checkAnswerForQuestion:(int)numQuestion;
@end
