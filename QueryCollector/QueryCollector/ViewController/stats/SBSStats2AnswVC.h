//
//  SBSStats2AnswVC.h
//  QueryCollector
//
//  Created by Sandra on 10/9/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBSStatsBaseVC.h"

@interface SBSStats2AnswVC : SBSStatsBaseVC

//View elements arrays
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *answerLabels;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *percentNumLabel;
@property (strong, nonatomic) IBOutletCollection(UIProgressView) NSArray *percentBar;

-(id)initWithAnswers:(NSDictionary*)json
         forQuestion:(int)number
            andTexts:(NSArray*) texts;
@end