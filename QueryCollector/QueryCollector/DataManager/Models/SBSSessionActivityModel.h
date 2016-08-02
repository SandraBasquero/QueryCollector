//
//  SBSSessionActivityModel.h
//  QueryCollector
//
//  Created by Sandra on 20/7/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SBSSessionActivityModel : NSObject

@property NSUUID *idForSession;
@property NSString *citySelected;
@property int currentQuery;
@property int currentSlide;
@property int currentSlide2;

+(id)sessionHandler;

@end
