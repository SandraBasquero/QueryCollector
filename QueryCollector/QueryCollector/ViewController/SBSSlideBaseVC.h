//
//  SBSSlideBaseVC.h
//  QueryCollector
//
//  Created by Sandra on 26/7/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBSQueryMasterVC.h"

#import "SBSSessionActivityModel.h"

@interface SBSSlideBaseVC : UIViewController

@property (nonatomic) SBSQueryMasterVC *masterVC;
@property SBSSessionActivityModel *sessionHandler;


@end
