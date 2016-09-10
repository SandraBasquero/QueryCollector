//
//  SBSStaticsScrollVC.h
//  QueryCollector
//
//  Created by Sandra Basquero on 8/9/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBSSyncroData.h"
#import "SBSSessionActivityModel.h"


@interface SBSStaticsScrollVC : UIViewController<UITableViewDataSource, UITableViewDelegate,UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *statsContentScroll;

//Singleton
@property SBSSessionActivityModel *sessionHandler;

@property SBSSyncroData* syncrData;
@property NSMutableArray *statSlideArray;

- (IBAction)closeStats:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *closeStatsBtn;

//Cities menu filter
- (IBAction)cityFilterAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *cityFilterBtn;
@property (weak, nonatomic) IBOutlet UITableView *citiesFilterList;

@property (strong, nonatomic) NSMutableArray *citiesArray;

@end
