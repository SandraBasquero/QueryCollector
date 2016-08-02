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

//Slides Array Query 1
@property NSMutableArray * query1SlidesArray;

- (IBAction)backHome:(id)sender;

@end
