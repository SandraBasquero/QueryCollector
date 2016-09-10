//
//  SBSStaticsScrollVC.m
//  QueryCollector
//
//  Created by Sandra Basquero on 8/9/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "SBSStaticsScrollVC.h"

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
    
    self.syncrData = [[SBSSyncroData alloc]init];
    [self startCityTableSettings];
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

#pragma mark - Utils

-(void)setBorderToButton:(UIButton*)btn {
    btn.layer.borderWidth = 2.0f;
    [[btn layer] setBorderColor: [UIColor blackColor].CGColor];
}

@end
