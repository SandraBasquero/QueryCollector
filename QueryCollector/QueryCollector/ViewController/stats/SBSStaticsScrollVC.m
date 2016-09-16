//
//  SBSStaticsScrollVC.m
//  QueryCollector
//
//  Created by Sandra Basquero on 8/9/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "SBSStaticsScrollVC.h"

#import "SBSStats2AnswVC.h"
#import "SBSStats3AnswVC.h"
#import "SBSStats4AnswVC.h"
#import "SBSStats6AnswVC.h"
#import "SBSStatsBaseVC.h"

@interface SBSStaticsScrollVC ()

@property NSString *city;
@property int currentQuery;

@end

@implementation SBSStaticsScrollVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //Singleton
    self.sessionHandler = [SBSSessionActivityModel sessionHandler];
    self.city = self.sessionHandler.citySelected;
    self.currentQuery = self.sessionHandler.currentQuery;
    
    //Styles Buttons
    [self setBorderToButton:self.cityFilterBtn];
    self.cityFilterBtn.titleLabel.font = [UIFont fontWithName:@"AvenirNext-DemiBold" size:19];
    [self setBorderToButton:self.closeStatsBtn];
    self.closeStatsBtn.titleLabel.font = [UIFont fontWithName:@"AvenirNext-DemiBold" size:15];
    
    
    self.statSlideArray = [NSMutableArray new];
    [self loadStatsForCity:self.city andQuery:self.currentQuery];
    
    //Set scrollViewParent size to content the views
    [self.statsContentScroll setContentSize:CGSizeMake(1024 * self.statSlideArray.count, 768)];
    self.statsContentScroll.delegate = self;
    
    //Cities filter menu
    self.syncrData = [[SBSSyncroData alloc]init];
    [self startCityTableSettings];
}

#pragma mark - Answers


-(void)loadStatsForCity:(NSString*)city andQuery:(int)queryNum {
    if (queryNum == 1) {
        [self loadQuery1StatsForCity:city];
    } else if (queryNum == 2) {
        [self loadQuery2StatsForCity:city];
    }
    
    CGFloat xPos = 0;
    for (SBSStatsBaseVC *slide in self.statSlideArray) {
        [self builderViews:slide inXPosition:xPos];
        xPos += 1024;
    }
    self.bulletsMarkStatics.numberOfPages = [self.statSlideArray count];
}

-(void)loadQuery1StatsForCity:(NSString*)city {
    SBSStats2AnswVC *statSlide1 = [[SBSStats2AnswVC alloc] initWithAnswers:@{@"1":@"20",@"2":@"80"} forQuestion:1 andTexts:@[@"¿Eres fumador/a?",@"Sí",@"No"]];
    
    SBSStats3AnswVC *statSlide2 = [[SBSStats3AnswVC alloc] initWithAnswers:@{@"1":@"20",@"2":@"20", @"3":@"60"} forQuestion:2 andTexts:@[@"¿Cuantos días a la semana haces ejercicio?",@"Ningún día",@"De 1 a 3 días",@"4 días o más"]];
    
    SBSStats3AnswVC *statSlide3 = [[SBSStats3AnswVC alloc] initWithAnswers:@{@"1":@"20",@"2":@"20", @"3":@"60"} forQuestion:3 andTexts:@[@"¿Cuantas horas duermes normalmente por las noches?",@"5 horas o menos",@"De 6 a 8 horas",@"Más de 8 horas"]];
    
    SBSStats4AnswVC *statSlide4 = [[SBSStats4AnswVC alloc] initWithAnswers:@{@"1":@"20",@"2":@"20", @"3":@"30",  @"4":@"30"} forQuestion:4 andTexts:@[@"¿Con qué frecuencia sufres situaciones de mucho estrés?",@"A diario",@"Cada 1 o 2 semanas",@"Cada 1 o 2 meses",@"De 1 a 3 veces al año"]];
    
    
    [self.statSlideArray addObject:statSlide1];
    [self.statSlideArray addObject:statSlide2];
    [self.statSlideArray addObject:statSlide3];
    [self.statSlideArray addObject:statSlide4];
}

-(void)loadQuery2StatsForCity:(NSString*)city {
    SBSStats4AnswVC *statSlide1 = [[SBSStats4AnswVC alloc] initWithAnswers:@{@"1":@"20",@"2":@"20", @"3":@"30", @"4":@"30"} forQuestion:1 andTexts:@[@"¿Qué destino prefieres para tus vacaciones de verano?",@"Costa",@"Montaña",@"Ciudad",@"El extranjero"]];
    
    SBSStats6AnswVC *statSlide2 = [[SBSStats6AnswVC alloc] initWithAnswers:@{@"1":@"20",@"2":@"20", @"3":@"10", @"4":@"10", @"5":@"40", @"6":@"0"} forQuestion:2 andTexts:@[@"Idiomas en los que puedes comunicarte:",@"Castellano",@"Inglés",@"Francés",@"Alemán",@"Italiano",@"Otros"]];
    
    SBSStats4AnswVC *statSlide3 = [[SBSStats4AnswVC alloc] initWithAnswers:@{@"1":@"20",@"2":@"20", @"3":@"30", @"4":@"30"} forQuestion:3 andTexts:@[@"¿Con quien sueles irte de vacaciones?",@"Familia",@"Amigos/as",@"Pareja",@"Solo/a"]];
    
    
    
    
    [self.statSlideArray addObject:statSlide1];
    [self.statSlideArray addObject:statSlide2];
    [self.statSlideArray addObject:statSlide3];
}

//Update views and data according with the new city selected
-(void)cityChanged:(NSString*)city {
    self.city = city;
    
   /* [self.statSlideArray removeAllObjects];
    for (UIView *i in self.statsContentScroll.subviews) {
        [i removeFromSuperview];
    }
    [self loadStatsForWorkshop:self.workshop andCase:self.currentCase];
    for (UIView *btnView in self.bulletsContent.subviews) {
        if ([btnView isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton*)btnView;
            btn.selected = false;
        }
    }
    [self buildBullets];*/
}

#pragma mark - City Table

-(void) startCityTableSettings {
    
    NSArray *citiesTemporal = [[NSArray alloc]init];
    citiesTemporal = [self.syncrData getCitiesUpdated];
    
    self.citiesArray = [[NSMutableArray alloc]init];
    
    if (citiesTemporal.count > 0) {
        for (int i = 0; i < citiesTemporal.count; i++) {
            [self.citiesArray addObject:[[citiesTemporal objectAtIndex:i]name]];
        }
        self.cityFilterBtn.enabled = true;
    } else {
        self.cityFilterBtn.enabled = false;
    }
    
    self.cityFilterBtn.tintColor = [UIColor redColor];
    [self.cityFilterBtn setTitle:self.city forState:UIControlStateNormal];
    
    self.citiesFilterList.hidden = YES;
    self.citiesFilterList.delegate = self;
    self.citiesFilterList.dataSource = self;
    //Style
    self.citiesFilterList.layer.borderWidth = 3.0f;
    [[self.citiesFilterList layer] setBorderColor: [UIColor blackColor].CGColor];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.citiesArray.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        cell.backgroundColor = [UIColor colorWithWhite:0.6 alpha:0.1];
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.font =  [UIFont fontWithName:@"AvenirNext-DemiBold" size:17];
        
    }
    cell.textLabel.text = [self.citiesArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell =  [self.citiesFilterList cellForRowAtIndexPath:indexPath];
    self.cityFilterBtn.tintColor = [UIColor colorWithRed:0/255.0 green:84/255.0 blue:129/255.0 alpha:1.0];
    [self.cityFilterBtn setTitle: cell.textLabel.text forState: UIControlStateNormal];
    [self cityChanged:self.cityFilterBtn.titleLabel.text];
    self.citiesFilterList.hidden = YES;
}

- (IBAction)cityFilterAction:(id)sender {
    if (self.citiesFilterList.hidden == YES) {
        self.citiesFilterList.hidden = NO;
    } else {
        self.citiesFilterList.hidden = YES;
    }
}

#pragma mark - Navigation

- (IBAction)closeStats:(id)sender {
    [self.navigationController popViewControllerAnimated:false];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = self.statsContentScroll.frame.size.width;
    int page = floor((self.statsContentScroll.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.bulletsMarkStatics.currentPage = page;
}

#pragma mark - Utils

-(void)builderViews:(SBSStatsBaseVC*)slide
        inXPosition:(CGFloat)xPos {
    
    [self addChildViewController:slide];
    slide.staticsScrollVC = self;
    [self.statsContentScroll addSubview:slide.view];
    [slide.view setFrame:CGRectMake(xPos, 0, 1024, 768)];
}


-(void)setBorderToButton:(UIButton*)btn {
    btn.layer.borderWidth = 2.0f;
    [[btn layer] setBorderColor: [UIColor blackColor].CGColor];
}


@end
