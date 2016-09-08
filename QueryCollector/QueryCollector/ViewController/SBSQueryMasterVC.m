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
#import "SBSSlide3Query1VC.h"
#import "SBSSlide4Query1VC.h"

#import "SBSSlide1Query2VC.h"
#import "SBSSlide2Query2VC.h"
#import "SBSSlide3Query2VC.h"

#import "SBSSyncroData.h"


@interface SBSQueryMasterVC ()

@end

@implementation SBSQueryMasterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Singleton
    SBSSessionActivityModel *sessionActivity = [SBSSessionActivityModel sessionHandler];
    
    //Styles
    [self setBorderToButton:self.backHomeBtn];
    [self setBorderToButton: self.sendAnswersBtn];
    
    if (sessionActivity.currentQuery == 1) {
        self.query1SlidesArray = [[NSMutableArray alloc]init];
        [self query1Selected]; //Build the slides in the scroll view
        //Set masterScroll size to content the views
        [self.masterScroll setContentSize:CGSizeMake(1024 * self.query1SlidesArray.count, 768)];
        self.masterScroll.delegate = self;
        self.bullets.numberOfPages = [self.query1SlidesArray count];
        [self renderLastVisited]; //Show directly the last view visited in the masterScroll.
        
    } else if (sessionActivity.currentQuery == 2) {
        self.query2SlidesArray = [[NSMutableArray alloc]init];
        [self query2Selected]; //Build the slides in the scroll view
        //Set masterScroll size to content the views
        [self.masterScroll setContentSize:CGSizeMake(1024 * self.query2SlidesArray.count, 768)];
        self.masterScroll.delegate = self;
        self.bullets.numberOfPages = [self.query2SlidesArray count];
        [self renderLastVisited]; //Show directly the last view visited in the masterScroll.
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
    self.bullets.currentPage = self.currentSlide;
}

-(void)setBorderToButton:(UIButton*)btn {
    btn.layer.borderWidth = 3.0f;
    [[btn layer] setBorderColor: [UIColor blackColor].CGColor];
}

#pragma mark - Queries ViewController Selected

-(void)query1Selected {
    SBSSlide1Query1VC *slide1 = [[SBSSlide1Query1VC alloc]initWithNibName:@"SBSSlide1Query1VC" bundle:nil];
    SBSSlide2Query1VC *slide2 = [[SBSSlide2Query1VC alloc]initWithNibName:@"SBSSlide2Query1VC" bundle:nil];
    SBSSlide3Query1VC *slide3 = [[SBSSlide3Query1VC alloc]initWithNibName:@"SBSSlide3Query1VC" bundle:nil];
    SBSSlide4Query1VC *slide4 = [[SBSSlide4Query1VC alloc]initWithNibName:@"SBSSlide4Query1VC" bundle:nil];
    
    [self.query1SlidesArray addObject:slide1];
    [self.query1SlidesArray addObject:slide2];
    [self.query1SlidesArray addObject:slide3];
    [self.query1SlidesArray addObject:slide4];
    
    CGFloat xPos = 0;
    for (SBSSlideBaseVC *slide in self.query1SlidesArray) {
        [self builderViews:slide inXPosition:xPos];
        xPos += 1024;
    }
}

-(void)query2Selected {
    SBSSlide1Query2VC *slide1 = [[SBSSlide1Query2VC alloc]initWithNibName:@"SBSSlide1Query2VC" bundle:nil];
    SBSSlide2Query2VC *slide2 = [[SBSSlide2Query2VC alloc]initWithNibName:@"SBSSlide2Query2VC" bundle:nil];
    SBSSlide3Query2VC *slide3 = [[SBSSlide3Query2VC alloc]initWithNibName:@"SBSSlide3Query2VC" bundle:nil];
    
    [self.query2SlidesArray addObject:slide1];
    [self.query2SlidesArray addObject:slide2];
    [self.query2SlidesArray addObject:slide3];
    
    CGFloat xPos = 0;
    for (SBSSlideBaseVC *slide in self.query2SlidesArray) {
        [self builderViews:slide inXPosition:xPos];
        xPos += 1024;
    }
}

#pragma mark - Navigation

- (IBAction)backHome:(id)sender {
    //Singleton
    SBSSessionActivityModel *sessionHandler = [SBSSessionActivityModel sessionHandler];
    if (sessionHandler.currentQuery == 1) {
        sessionHandler.currentSlide = self.currentSlide;
    } else if (sessionHandler.currentQuery == 2) {
        sessionHandler.currentSlide2 = self.currentSlide;
    }
    
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:true];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = self.masterScroll.frame.size.width;
    int page = floor((self.masterScroll.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    self.currentSlide = page;
    NSLog(@"current slide %d",self.currentSlide);
    self.bullets.currentPage = self.currentSlide;
}

#pragma mark - Data Management

- (IBAction)sendAnswersAction:(id)sender {
    if ([[SBSSyncroData new] sendAnswersPendingToServer]) {
        self.sendAnswersBtn.enabled = false;
        self.sendAnswersBtn.alpha = 0.5;
    } else {
        self.sendAnswersBtn.enabled = true;
        self.sendAnswersBtn.alpha = 1;
    }
}

@end
