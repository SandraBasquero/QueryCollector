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

- (IBAction)btnAction:(id)sender {
    [self selectOne:sender inCollection:self.answerBtnArray];
}

@end
