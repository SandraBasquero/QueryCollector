//
//  SBSSessionActivityModel.m
//  QueryCollector
//
//  Created by Sandra on 20/7/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "SBSSessionActivityModel.h"

@implementation SBSSessionActivityModel

@synthesize idForSession;
@synthesize citySelected;

#pragma mark - Singleton Methods

+(id)sessionHandler {
    static SBSSessionActivityModel *idsHandler = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        idsHandler = [[self alloc]init];
    });
    return idsHandler;
}

//Designado
-(id)initSession:(NSUUID*) idSession
      inCity:(NSString*) city
  andCurrentQuery:(int) currentQuery
 andCurrentSlide:(int) currentSlide {
    if (self = [super init]) {
        self.idForSession = idSession;
        self.citySelected = city;
        self.currentQuery = currentQuery;
        self.currentSlide = currentSlide;
    }
    return self;
}


- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

@end
