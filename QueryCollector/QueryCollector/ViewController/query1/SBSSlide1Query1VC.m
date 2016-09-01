//
//  SBSSlide1Query1VC.m
//  QueryCollector
//
//  Created by Sandra on 26/7/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "SBSSlide1Query1VC.h"

@interface SBSSlide1Query1VC ()

@end

@implementation SBSSlide1Query1VC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customBorderStyles:self.answerBtnArray];
    
    self.syncData = [SBSSyncroData new];
    SBSAnswerModel *reqAnswer = [self.syncData getAnswerForAQuestion:[self checkAnswerForQuestion:1]];
    for (UIButton *btn in self.answerBtnArray) {
        if (btn.tag == [reqAnswer.answer intValue]) {
            btn.selected = true;
        }
    }
}


- (IBAction)btnsAction:(UIButton*)sender {
    self.syncData = [SBSSyncroData new]; //Declarado en el padre CCCSlideBaseVC
    [self.syncData aQuestionIsAnswered:[self buildAnswer:sender.tag inQuestion:1]];
    [self selectOne:sender inCollection:self.answerBtnArray];
}

@end
