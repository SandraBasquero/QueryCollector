//
//  SBSSlide2Query2VC.m
//  QueryCollector
//
//  Created by Sandra on 2/8/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "SBSSlide2Query2VC.h"

@interface SBSSlide2Query2VC ()

@property BOOL firstTime;
@property NSMutableArray *answersArray;

@end


@implementation SBSSlide2Query2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Styles
    [self customBorderStyles:self.answerBtnArray];
    self.firstTime = true;
    
    self.answersArray = [NSMutableArray new];
    
    self.syncData = [SBSSyncroData new];
    SBSAnswerModel *reqAnswer = [self.syncData getAnswerForAQuestion:[self checkAnswerForQuestion:2]];
    [self autoSelectAnsweredBtnsMulti:reqAnswer inColection:self.answerBtnArray];
}

- (IBAction)btnsAction:(UIButton*)sender {
    
    if (self.firstTime) {
        for (UIButton *btn in self.answerBtnArray) {
            btn.selected = false;
            [self buttonUnselectedStyle:btn];
        }
        self.firstTime = false;
    }
    [self selectOne:sender];
    
    
    [self answersList:sender.tag];
    //Save answer to local db
    self.syncData = [SBSSyncroData new]; //Declarado en el padre CCCSlideBaseVC
    [self.syncData aQuestionIsAnswered:[self buildMultiAnswers:self.answersArray inQuestion:2]];
}


-(void)answersList:(long)tagBtn {
    NSNumber *answ = [NSNumber numberWithLong:tagBtn];
    if (![self.answersArray containsObject:answ]) {
        [self.answersArray addObject:answ];
    } else {
        [self. answersArray removeObject:answ];
    }
}

@end
