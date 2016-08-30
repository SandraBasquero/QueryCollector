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
#import "SBSAnswerModel.h"

#import "SBSSyncroData.h"

@interface SBSSlideBaseVC : UIViewController

@property (nonatomic) SBSQueryMasterVC *masterVC;
@property SBSSessionActivityModel *sessionHandler;
@property SBSSyncroData *syncData;

//Styles
-(void)customBorderStyles:(NSArray*)elements;
-(void)buttonUnselectedStyle:(UIButton*)btn;

//Buttons Actions
-(void)selectOne:(UIButton*)sender inCollection:(NSArray*)collection;
-(void)selectOne:(UIButton*)sender;


-(SBSAnswerModel*)buildAnswer:(long)numAnswer
                   inQuestion:(int)numQuestion;
@end
