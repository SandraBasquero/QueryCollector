//
//  SBSQueryMasterVC.m
//  QueryCollector
//
//  Created by Sandra Basquero on 6/7/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "SBSQueryMasterVC.h"
#import "SBSSlide1Query1VC.h"
#import "SBSSlide2Query1VC.h"

@interface SBSQueryMasterVC ()

@end

@implementation SBSQueryMasterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Singleton
    SBSSessionActivityModel *sessionActivity = [SBSSessionActivityModel sessionHandler];
    
    if (sessionActivity.currentQuery == 1) {
        self.query1SlidesArray = [[NSMutableArray alloc]init];
        [self query1Selected]; //Build the slides in the scroll view
        
        [self renderLastVisited];
        
        //Set masterScroll size to content the views
        [self.masterScroll setContentSize:CGSizeMake(1024 * self.query1SlidesArray.count, 768)];
        self.masterScroll.delegate = self;
    }
}


#pragma mark - Utils

-(void)builderViews:(SBSSlideBaseVC*)slide
        inXPosition:(CGFloat)xPos {
    
    [self addChildViewController:slide];
    slide.masterVC = self;
    [self.masterScroll addSubview:slide.view];
    [slide.view setFrame:CGRectMake(xPos, 0, 1024, 768)];
}


-(void)renderLastVisited {
    [self.masterScroll setContentOffset:CGPointMake(1024*(self.currentSlide), 0)];
}


#pragma mark - Cases ViewController Selected

-(void)query1Selected {
    SBSSlide1Query1VC *slide1 = [[SBSSlide1Query1VC alloc]initWithNibName:@"SBSSlide1Query1VC" bundle:nil];
    SBSSlide2Query1VC *slide2 = [[SBSSlide2Query1VC alloc]initWithNibName:@"SBSSlide2Query1VC" bundle:nil];
    
    [self.query1SlidesArray addObject:slide1];
    [self.query1SlidesArray addObject:slide2];
    
    CGFloat xPos = 0;
    for (SBSSlideBaseVC *slide in self.query1SlidesArray) {
        [self builderViews:slide inXPosition:xPos];
        xPos += 1024;
    }
}


#pragma mark - Navigation

- (IBAction)backHome:(id)sender {
    //Singleton
    SBSSessionActivityModel *sessionHandler = [SBSSessionActivityModel sessionHandler];
    sessionHandler.currentSlide = self.currentSlide;
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:true];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = self.masterScroll.frame.size.width;
    int page = floor((self.masterScroll.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    self.currentSlide = page;
    NSLog(@"current slide %d",self.currentSlide);
}


@end
