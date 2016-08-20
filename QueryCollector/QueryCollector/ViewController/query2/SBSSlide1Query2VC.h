//
//  SBSSlide1Query2VC.h
//  QueryCollector
//
//  Created by Sandra on 2/8/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "SBSSlideBaseVC.h"

@interface SBSSlide1Query2VC : SBSSlideBaseVC


@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *answerBtnArray;

- (IBAction)btnsAction:(id)sender;

@end
