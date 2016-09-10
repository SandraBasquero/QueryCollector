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


@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *answerLabels;

@property NSDictionary *answerJson;
@property int number;
@property NSArray *questionTexts;


-(id)initWithAnswers:(NSDictionary*)json
         forQuestion:(int)number
            andTexts:(NSArray*)texts;
@end
