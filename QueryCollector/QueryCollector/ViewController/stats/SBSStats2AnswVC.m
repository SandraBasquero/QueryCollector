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
            andTexts:(NSArray*) texts {
    
    if (self = [super initWithNibName:@"SBSStats2AnswVC" bundle:nil]) {
        self.answerJson = json;
        self.questionTexts = texts;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Fill/Render with data and text
    [self renderElements:self.answerLabels andBars:self.percentBar andNumbers:self.percentNumLabel withText:self.questionTexts andData:self.answerJson];
}

@end
