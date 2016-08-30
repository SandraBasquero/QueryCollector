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

@end


@implementation SBSSlide2Query2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Styles
    [self customBorderStyles:self.answerBtnArray];
    self.firstTime = true;
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
    
    //Save answer to local db
    self.syncData = [SBSSyncroData new]; //Declarado en el padre CCCSlideBaseVC
    [self.syncData aQuestionIsAnswered:[self buildAnswer:sender.tag inQuestion:2]];
}

@end
