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
@property SBSAnswerModel *reqAnswer;

@end


@implementation SBSSlide2Query2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Styles
    [self customBorderStyles:self.answerBtnArray];
    self.firstTime = true;
    
    self.answersArray = [NSMutableArray new];
    
    self.syncData = [SBSSyncroData new];
    self.reqAnswer = [self.syncData getAnswerForAQuestion:[self checkAnswerForQuestion:2]];
    [self autoSelectAnsweredBtnsMulti:self.reqAnswer inColection:self.answerBtnArray];
}

- (IBAction)btnsAction:(UIButton*)sender {
    
    if (self.firstTime) {
        NSArray *temporal =[[self.reqAnswer.answer componentsSeparatedByString:@"-"]copy];
        if ([temporal count] == 0 || [[temporal objectAtIndex:0] isEqualToString:@""] || [temporal objectAtIndex:0] == nil) {
            for (UIButton *btn in self.answerBtnArray) {
                btn.selected = false;
                [self buttonUnselectedStyle:btn];
            }
        } else {
            for (NSString *answString in temporal) {
                [self answersList:[answString intValue]];
            }
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
