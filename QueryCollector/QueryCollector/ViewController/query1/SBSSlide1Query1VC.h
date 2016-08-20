//
//  SBSSlide1Query1VC.h
//  QueryCollector
//
//  Created by Sandra on 26/7/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "SBSSlideBaseVC.h"

@interface SBSSlide1Query1VC : SBSSlideBaseVC


@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *answerBtnArray;
- (IBAction)btnsAction:(id)sender;

@end
