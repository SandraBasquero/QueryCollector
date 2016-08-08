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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
