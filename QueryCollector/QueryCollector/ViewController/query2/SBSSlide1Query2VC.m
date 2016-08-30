//
//  SBSSlide1Query2VC.m
//  QueryCollector
//
//  Created by Sandra on 2/8/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "SBSSlide1Query2VC.h"

@interface SBSSlide1Query2VC ()

@end

@implementation SBSSlide1Query2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //Styles
    [self customBorderStyles:self.answerBtnArray];
}

- (IBAction)btnsAction:(UIButton*)sender {
    self.syncData = [SBSSyncroData new]; //Declarado en el padre CCCSlideBaseVC
    [self.syncData aQuestionIsAnswered:[self buildAnswer:sender.tag inQuestion:1]];
    [self selectOne:sender inCollection:self.answerBtnArray];
}

@end
