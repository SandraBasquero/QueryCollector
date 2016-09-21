//
//  SBSStatsBaseVC.m
//  QueryCollector
//
//  Created by Sandra on 10/9/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "SBSStatsBaseVC.h"

@interface SBSStatsBaseVC ()

@end

@implementation SBSStatsBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//Fill/Render with data and text
-(void)renderElements:(NSArray*)answerLabels
              andBars:(NSArray*) percentBar
           andNumbers:(NSArray*)percentNumLabel
             withText:(NSArray*)questionTexts
              andData:(NSDictionary*)answerJson {
    
    //Fill labels with query texts
    for (int i = 0; i < answerLabels.count; i++) {
        UILabel *label = [answerLabels objectAtIndex:i];
        label.text = [questionTexts objectAtIndex:i];
        if (i != 0) {
            [self setBorderToLabel:label];
        }
    }
    
    if (self.answerJson) {
        //Fill Progress Bar with answer data numbers
        for (int i = 0; i < percentBar.count; i++) {
            UIProgressView *progr = [percentBar objectAtIndex:i];
            progr.progress = [[answerJson objectForKey:[NSString stringWithFormat:@"%.0d",i+1]] floatValue]/100.0f;
            progr.layer.borderWidth = 2.0f;
            [[progr layer] setBorderColor: [UIColor blackColor].CGColor];
        }
        //Fill labels with answer data numbers
        for (int i = 0; i < percentNumLabel.count; i++) {
            UILabel *label = [percentNumLabel objectAtIndex:i];
            label.text = [NSString stringWithFormat:@"%.0f%%", [[self.answerJson objectForKey:[NSString stringWithFormat:@"%.0d",i+1]] floatValue]];
            [self setBorderToLabel:label];
        }
    }
}

#pragma mark - Utils

-(void)setBorderToLabel:(UILabel*)label {
    label.layer.borderWidth = 2.0f;
    [[label layer] setBorderColor: [UIColor blackColor].CGColor];
}

@end
