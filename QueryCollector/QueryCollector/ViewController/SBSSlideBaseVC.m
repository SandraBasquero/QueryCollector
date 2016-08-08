//
//  SBSSlideBaseVC.m
//  QueryCollector
//
//  Created by Sandra on 26/7/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "SBSSlideBaseVC.h"

@interface SBSSlideBaseVC ()

@end

@implementation SBSSlideBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Singleton
    self.sessionHandler = [SBSSessionActivityModel sessionHandler];
}

#pragma mark - Utils

-(void)customBorderStyles:(NSArray*)elements {
    for (UIButton *btn in elements) {
        btn.layer.borderWidth = 3.0f;
        [[btn layer] setBorderColor: [UIColor blackColor].CGColor];
    }
}

@end
