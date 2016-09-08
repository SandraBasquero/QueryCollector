//
//  SBSStaticsScrollVC.m
//  QueryCollector
//
//  Created by Sandra Basquero on 8/9/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "SBSStaticsScrollVC.h"

@interface SBSStaticsScrollVC ()

@end

@implementation SBSStaticsScrollVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


#pragma mark - Navigation

- (IBAction)closeStats:(id)sender {
    [self.navigationController popViewControllerAnimated:false];
}

@end
