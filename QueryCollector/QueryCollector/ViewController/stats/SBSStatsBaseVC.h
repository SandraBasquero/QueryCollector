//
//  SBSStatsBaseVC.h
//  QueryCollector
//
//  Created by Sandra on 10/9/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBSStaticsScrollVC.h"

@interface SBSStatsBaseVC : UIViewController

@property (nonatomic)SBSStaticsScrollVC *staticsScrollVC;

//Properties
@property NSDictionary *answerJson;
@property int number;
@property NSArray *questionTexts;

//Fill/Render with data and text
-(void)renderElements:(NSArray*)answerLabels
              andBars:(NSArray*) percentBar
           andNumbers:(NSArray*)percentNumLabel
             withText:(NSArray*)questionTexts
              andData:(NSDictionary*)answerJson;
@end
