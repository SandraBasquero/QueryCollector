//
//  SBSStats2AnswVC.m
//  QueryCollector
//
//  Created by Sandra on 10/9/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "SBSStats2AnswVC.h"

@interface SBSStats2AnswVC ()

@end

@implementation SBSStats2AnswVC

-(id)initWithAnswers:(NSDictionary*)json
         forQuestion:(int)number
            andTexts:(NSArray*) texts {
    
    if (self = [super initWithNibName:@"SBSStats2AnswVC" bundle:nil]) {
        self.answerJson = json;
        self.number = number;
        self.questionTexts = texts;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Fill labels with query texts
    for (int i = 0; i < self.answerLabels.count; i++) {
        UILabel *label = [self.answerLabels objectAtIndex:i];
        label.text = [self.questionTexts objectAtIndex:i];
    }
}


@end
