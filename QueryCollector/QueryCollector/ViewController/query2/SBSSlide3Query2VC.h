//
//  SBSSlide3Query2VC.h
//  QueryCollector
//
//  Created by Sandra on 2/8/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "SBSSlideBaseVC.h"

@interface SBSSlide3Query2VC : SBSSlideBaseVC

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *answerBtnArray;

- (IBAction)bntsAction:(id)sender;


@end
