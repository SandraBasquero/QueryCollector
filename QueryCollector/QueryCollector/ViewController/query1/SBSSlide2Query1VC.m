//
//  SBSSlide2Query1VC.m
//  QueryCollector
//
//  Created by Sandra on 26/7/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "SBSSlide2Query1VC.h"

@interface SBSSlide2Query1VC ()

@end

@implementation SBSSlide2Query1VC

- (void)viewDidLoad {
    [super viewDidLoad];
    //Styles
    [self customBorderStyles:self.answerBtnArray];
    
    self.syncData = [SBSSyncroData new];
    SBSAnswerModel *reqAnswer = [self.syncData getAnswerForAQuestion:[self checkAnswerForQuestion:2]];
    [self autoSelectAnsweredBtn:reqAnswer inColection:self.answerBtnArray];
}

- (IBAction)btnsAction:(UIButton*)sender {
    self.syncData = [SBSSyncroData new]; //Declarado en el padre CCCSlideBaseVC
    [self.syncData aQuestionIsAnswered:[self buildAnswer:sender.tag inQuestion:2]];
    [self selectOne:sender inCollection:self.answerBtnArray];
}

@end
