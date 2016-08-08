//
//  SBSQueryMasterVC.h
//  QueryCollector
//
//  Created by Sandra Basquero on 6/7/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBSSessionActivityModel.h"

@interface SBSQueryMasterVC : UIViewController<UIScrollViewDelegate>


@property (weak, nonatomic) IBOutlet UIScrollView *masterScroll;
@property int currentSlide;
@property (weak, nonatomic) IBOutlet UIPageControl *bullets;


//Slides Array Query 1
@property NSMutableArray * query1SlidesArray;
//Slides Array Query 2
@property NSMutableArray * query2SlidesArray;

- (IBAction)backHome:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *backHomeBtn;

@end
