//
//  SBSSlide3Query1VC.h
//  QueryCollector
//
//  Created by Sandra on 2/8/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "SBSSlideBaseVC.h"

@interface SBSSlide3Query1VC : SBSSlideBaseVC

//Utils
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *answerBtnArray;

//Buttons Actions
- (IBAction)btnsAction:(id)sender;

@end
