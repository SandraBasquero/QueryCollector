//
//  SBSSlide4Query1VC.h
//  QueryCollector
//
//  Created by Sandra on 2/8/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "SBSSlideBaseVC.h"

@interface SBSSlide4Query1VC : SBSSlideBaseVC

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *answerBtnArray;

//Buttons Actions
- (IBAction)btnAction:(id)sender;

@end
