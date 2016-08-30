//
//  SBSSlide4Query1VC.m
//  QueryCollector
//
//  Created by Sandra on 2/8/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "SBSSlide4Query1VC.h"

@interface SBSSlide4Query1VC ()

@end

@implementation SBSSlide4Query1VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Styles
    [self customBorderStyles:self.answerBtnArray];
}

- (IBAction)btnAction:(UIButton*)sender {
    self.syncData = [SBSSyncroData new]; //Declarado en el padre CCCSlideBaseVC
    [self.syncData aQuestionIsAnswered:[self buildAnswer:sender.tag inQuestion:4]];
    [self selectOne:sender inCollection:self.answerBtnArray];
}

@end
