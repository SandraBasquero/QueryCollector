//
//  SBSQueryMasterVC.m
//  QueryCollector
//
//  Created by Sandra Basquero on 6/7/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "SBSQueryMasterVC.h"

@interface SBSQueryMasterVC ()

@end

@implementation SBSQueryMasterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Singleton
    SBSSessionActivityModel *sessionActivity = [SBSSessionActivityModel sessionHandler];
    NSLog(@"%@ con id %@d, responde a query %d",sessionActivity.citySelected, sessionActivity.idForSession, sessionActivity.currentQuery);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Navigation

- (IBAction)backHome:(id)sender {
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:true];
}

/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
