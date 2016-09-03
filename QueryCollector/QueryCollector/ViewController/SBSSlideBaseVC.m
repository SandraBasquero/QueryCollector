//
//  SBSSlideBaseVC.m
//  QueryCollector
//
//  Created by Sandra on 26/7/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "SBSSlideBaseVC.h"

@interface SBSSlideBaseVC ()

@end

@implementation SBSSlideBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Singleton
    self.sessionHandler = [SBSSessionActivityModel sessionHandler];
}

#pragma mark - Styles

-(void)customBorderStyles:(NSArray*)elements {
    for (UIButton *btn in elements) {
        btn.layer.borderWidth = 3.0f;
        [[btn layer] setBorderColor: [UIColor blackColor].CGColor];
    }
}

-(void)buttonSelectedStyle:(UIButton*)btn {
    [[btn layer] setBorderColor: [UIColor blackColor].CGColor];
    [btn setTitleColor: [UIColor blackColor] forState:UIControlStateNormal];
    [btn setAlpha:1.0];
}

-(void)buttonUnselectedStyle:(UIButton*)btn {
    [btn setAlpha:0.7];
    [[btn layer] setBorderColor: [UIColor grayColor].CGColor];
    [btn setTitleColor: [UIColor grayColor] forState:UIControlStateNormal];
}

#pragma mark - Buttons Actions

//Select only one button from a collection -> Choose one
-(void)selectOne:(UIButton*)sender inCollection:(NSArray*)collection {
    for (UIButton *btn in collection) {
        btn.selected = false;
        [self buttonUnselectedStyle:btn];
    }
    sender.selected = true;
    [self buttonSelectedStyle:sender];
}

//Acts in buttons individually -> Multichoice
-(void)selectOne:(UIButton*)sender {
    if (!sender.selected) {
        sender.selected = true;
        [self buttonSelectedStyle:sender];
    } else {
        sender.selected = false;
        [self buttonUnselectedStyle:sender];
    }
}

//Select the answer button already answered
-(void) autoSelectAnsweredBtn:(SBSAnswerModel*)answerModel inColection:(NSArray*)answerBtnArray {
    if (answerModel.answer.length != 0) {
        for (UIButton *btn in answerBtnArray) {
            if (btn.tag == [answerModel.answer intValue]) {
                btn.selected = true;
                [self buttonSelectedStyle:btn];
            } else {
                [self buttonUnselectedStyle:btn];
            }
        }
    } else {
        for (UIButton *btn in answerBtnArray) {
            [self buttonSelectedStyle:btn];
        }
    }
}

//Select the answer button already answered
-(void) autoSelectAnsweredBtnsMulti:(SBSAnswerModel*)answerModel inColection:(NSArray*)answerBtnArray {
    
    NSArray *answersArray = [NSArray new];
    answersArray = [answerModel.answer componentsSeparatedByString:@"-"];
    
    if (answerModel.answer.length != 0) {
        for (UIButton *btn in answerBtnArray) {
            [self buttonUnselectedStyle:btn];
            btn.selected = false;
        }
        for (UIButton *btn in answerBtnArray) {
            for (NSString *ansString in answersArray) {
                if (btn.tag == [ansString intValue]) {
                    btn.selected = true;
                    [self buttonSelectedStyle:btn];
                }
            }
        }
        
    } else {
        for (UIButton *btn in answerBtnArray) {
            [self buttonSelectedStyle:btn];
        }
    }
}

#pragma mark - Model Data Management

-(SBSAnswerModel*)buildAnswer:(long)numAnswer
                   inQuestion:(int)numQuestion {
    
    SBSAnswerModel *answer = [[SBSAnswerModel alloc] initWithCity:self.sessionHandler.citySelected queryNum:[NSString stringWithFormat:@"%d", self.sessionHandler.currentQuery] questionNum:[NSString stringWithFormat:@"%ld",(long)numQuestion] answer:[NSString stringWithFormat:@"%ld", (long)numAnswer] textAnswer:@"" userID:[self.sessionHandler.idForSession UUIDString] pending:@""];
    
    return answer;
}


-(SBSAnswerModel*)buildMultiAnswers:(NSMutableArray*)numAnswers
                   inQuestion:(int)numQuestion {
    
    NSString *answerString = @"";
    for (NSNumber *an in numAnswers) {
        if (![[numAnswers lastObject]isEqual:an]) {
            answerString = [answerString stringByAppendingFormat:@"%@-", an];
        } else {
            answerString = [answerString stringByAppendingFormat:@"%@", an];
        }
    }
    SBSAnswerModel *answer = [[SBSAnswerModel alloc] initWithCity:self.sessionHandler.citySelected queryNum:[NSString stringWithFormat:@"%d", self.sessionHandler.currentQuery] questionNum:[NSString stringWithFormat:@"%ld",(long)numQuestion] answer:answerString textAnswer:@"" userID:[self.sessionHandler.idForSession UUIDString] pending:@""];
    
    return answer;
}


-(SBSAnswerModel*)checkAnswerForQuestion:(int)numQuestion {
    
    SBSAnswerModel *answer = [[SBSAnswerModel alloc]initWithCity:self.sessionHandler.citySelected queryNum:[NSString stringWithFormat:@"%d", self.sessionHandler.currentQuery] questionNum:[NSString stringWithFormat:@"%ld",(long)numQuestion] answer:@"" textAnswer:@"" userID:[self.sessionHandler.idForSession UUIDString] pending:@""];
    return answer;
}



@end
