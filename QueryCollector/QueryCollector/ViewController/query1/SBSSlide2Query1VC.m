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
}

- (IBAction)btnsAction:(id)sender {
    [self selectOne:sender inCollection:self.answerBtnArray];
}

@end
