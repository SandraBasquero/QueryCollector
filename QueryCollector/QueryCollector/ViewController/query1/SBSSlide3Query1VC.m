//
//  SBSSlide3Query1VC.m
//  QueryCollector
//
//  Created by Sandra on 2/8/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "SBSSlide3Query1VC.h"

@interface SBSSlide3Query1VC ()

@end

@implementation SBSSlide3Query1VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Styles
    [self customBorderStyles:self.answerBtnArray];
}

- (IBAction)btnsAction:(UIButton*)sender {
    self.syncData = [SBSSyncroData new]; //Declarado en el padre CCCSlideBaseVC
    [self.syncData aQuestionIsAnswered:[self buildAnswer:sender.tag inQuestion:3]];
    [self selectOne:sender inCollection:self.answerBtnArray];
}


@end
