//
//  SBSStats4AnswVC.m
//  QueryCollector
//
//  Created by Sandra on 10/9/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "SBSStats4AnswVC.h"

@interface SBSStats4AnswVC ()

@end

@implementation SBSStats4AnswVC

-(id)initWithAnswers:(NSDictionary*)json
         forQuestion:(int)number
            andTexts:(NSArray*) texts {
    
    if (self = [super initWithNibName:@"SBSStats4AnswVC" bundle:nil]) {
        self.answerJson = json;
        self.number = number;
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
