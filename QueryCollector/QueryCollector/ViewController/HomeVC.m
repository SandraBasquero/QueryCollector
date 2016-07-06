//
//  HomeVC.m
//  QueryCollector
//
//  Created by Sandra Basquero on 6/7/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "HomeVC.h"
#import "SBSQueryMasterVC.h"

@interface HomeVC ()
@property int querySelected;
@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
 
-(IBAction)goToQueries:(UIButton*)sender {
    self.querySelected = (int)sender.tag;
    [self performSegueWithIdentifier:@"goToMasterQuery"sender:self];
    
}


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    SBSQueryMasterVC *queryMasterVC = segue.destinationViewController;
    switch (self.querySelected) {
        case 1:
            queryMasterVC.view.backgroundColor = [UIColor blueColor];
            break;
        case 2:
            queryMasterVC.view.backgroundColor = [UIColor yellowColor];
            break;
        default:
            break;
    }
}


@end
