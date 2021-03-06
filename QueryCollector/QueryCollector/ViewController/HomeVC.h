//
//  HomeVC.h
//  QueryCollector
//
//  Created by Sandra Basquero on 6/7/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBSSyncroData.h"

@interface HomeVC : UIViewController <UITableViewDataSource, UITableViewDelegate>


@property SBSSyncroData *syncData;

- (IBAction)cityAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *cityBtn;
@property (weak, nonatomic) IBOutlet UITableView *cityTable;
@property (strong, nonatomic) NSMutableArray *citiesArray;



@property (weak, nonatomic) IBOutlet UIButton *otherUserBtn;
- (IBAction)newUser:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *query1Btn;
@property (weak, nonatomic) IBOutlet UIButton *query2Btn;


- (IBAction)goToQueries:(id)sender;



@end
