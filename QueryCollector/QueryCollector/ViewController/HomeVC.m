//
//  HomeVC.m
//  QueryCollector
//
//  Created by Sandra Basquero on 6/7/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "HomeVC.h"
#import <QuartzCore/QuartzCore.h>
#import "SBSQueryMasterVC.h"
#import "SBSApiDataManager.h"
#import "SBSSessionActivityModel.h"

@interface HomeVC ()
@property int querySelected;
@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Styles
    [self setBorderToButton:self.cityBtn];
    [self setBorderToButton:self.query1Btn];
    [self setBorderToButton:self.query2Btn];
    self.otherUserBtn.layer.borderWidth = 1.0f;
    [[self.otherUserBtn layer] setBorderColor: [UIColor blackColor].CGColor];
    self.cityBtn.titleLabel.font = [UIFont fontWithName:@"AvenirNext-DemiBold" size:22];
    
    //Sync data
    self.syncData = [SBSSyncroData new];
    [self startCityTableSettings];
}


#pragma mark - Cities Menu

-(void) startCityTableSettings {
    
    NSArray *workshopTemporal = [[NSArray alloc]init];
    workshopTemporal = [self.syncData getCitiesUpdated];
    self.citiesArray = [[NSMutableArray alloc]init];
    
    
    if (workshopTemporal.count > 0) {
        for (int i = 0; i < workshopTemporal.count; i++) {
            [self.citiesArray addObject:[[workshopTemporal objectAtIndex:i]name]];
        }
        self.cityBtn.enabled = true;
    } else {
        self.cityBtn.enabled = false;
    }
    
    [self.cityBtn setTitle:@"Selecciona la tuya" forState:UIControlStateNormal];
    
    self.cityTable.hidden = YES;
    self.cityTable.delegate = self;
    self.cityTable.dataSource = self;
    //Style
    self.cityTable.layer.borderWidth = 3.0f;
    [[self.cityTable layer] setBorderColor: [UIColor blackColor].CGColor];
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
        cell.textLabel.font =  [UIFont fontWithName:@"AvenirNext-DemiBold" size:20];
        
    }
    cell.textLabel.text = [self.citiesArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell =  [self.cityTable cellForRowAtIndexPath:indexPath];
    self.cityBtn.tintColor = [UIColor colorWithRed:0/255.0 green:84/255.0 blue:129/255.0 alpha:1.0];
    [self.cityBtn setTitle: cell.textLabel.text forState: UIControlStateNormal];
    self.cityTable.hidden = YES;
}

- (IBAction)cityAction:(id)sender {
    if (self.cityTable.hidden == YES) {
        self.cityTable.hidden = NO;
    } else {
        self.cityTable.hidden = YES;
    }
}

#pragma mark - Utils

-(void)setBorderToButton:(UIButton*)btn {
    btn.layer.borderWidth = 3.0f;
    [[btn layer] setBorderColor: [UIColor blackColor].CGColor];
}

- (IBAction)newUser:(UIButton*)sender {
    if (![self.cityBtn.currentTitle isEqualToString:@"Selecciona la tuya"]) {
        //Singleton
        SBSSessionActivityModel *sessionActivity = [SBSSessionActivityModel sessionHandler];
        NSUUID *sessionId = [NSUUID new]; //Generate id for new session
        sessionActivity.idForSession = sessionId;
        sender.enabled = false;
        sender.alpha = 0.5;
    }
}


#pragma mark - Navigation
 
-(IBAction)goToQueries:(UIButton*)sender {
    self.otherUserBtn.enabled = true;
    self.otherUserBtn.alpha = 1;
    
    self.querySelected = (int)sender.tag;
    
    if (![self.cityBtn.currentTitle isEqualToString:@"Selecciona la tuya"]) {
        
        //Singleton
        SBSSessionActivityModel *sessionActivity = [SBSSessionActivityModel sessionHandler];
        if (![self.cityBtn.currentTitle isEqualToString:sessionActivity.citySelected]) {
            NSUUID *sessionId = [NSUUID new]; //Generate id for new session
            sessionActivity.idForSession = sessionId;
        }
        sessionActivity.citySelected = self.cityBtn.currentTitle;
        sessionActivity.currentQuery = self.querySelected;
        
        [self performSegueWithIdentifier:@"goToMasterQuery"sender:self];
    }
}


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    SBSQueryMasterVC *queryMasterVC = segue.destinationViewController;
    
    //Singleton
    SBSSessionActivityModel *sessionActivity = [SBSSessionActivityModel sessionHandler];
    
    switch (self.querySelected) {
        case 1:
            queryMasterVC.currentSlide = sessionActivity.currentSlide;
            break;
        case 2:
            queryMasterVC.currentSlide = sessionActivity.currentSlide2;
            break;
        default:
            break;
    }
}

@end
