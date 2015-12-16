//
//  NearByDealsViewController.m
//  OfferBlast
//
//  Created by Chanikya on 19/11/2015.
//  Copyright © 2015 Team Offer Blast. All rights reserved.
//

#import "NearByDealsViewController.h"
#import "DailyDealsTableViewCell.h"
#import "WeeklyDealsTableViewCell.h"
#import "SeeMoreTableViewCell.h"
#import "WebServiceClient.h"
#import "AllDealsViewController.h"
#import "DealViewController.h"
#import "DealDetailViewController.h"
#import <Parse/Parse.h>

@interface NearByDealsViewController ()

@property WebServiceClient *wClient;
@property (atomic, strong) NSMutableArray *dailyDealsArray;
@property (atomic, strong) NSMutableArray *weeklyDealsArray;
@property BOOL isDailyDealsSelected;
@property NSInteger selectedRow;

@end

@implementation NearByDealsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self.navigationItem setHidesBackButton:YES];
    [self setNeedsStatusBarAppearanceUpdate];
    //self.title = @"OfferBlast";
    [self.navigationItem setTitle:@"OfferBlast"];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.23 green:0.35 blue:0.60 alpha:1.0]];
    [self.navigationController.navigationBar setTitleTextAttributes:
      @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.headerTitles = [NSArray arrayWithObjects:@"Daily Deals", @"Weakly Deals", nil];
    
    self.wClient = [WebServiceClient sharedWebServiceClient];
    self.wClient.delegate = self;
    [self.wClient getDailyDeals];
    [self.wClient getWeeklyDeals];
    
    // Create our Installation query
    PFQuery *pushQuery = [PFInstallation query];
    [pushQuery whereKey:@"deviceType" equalTo:@"ios"];
    
    // Send push notification to query
    [PFPush sendPushMessageToQueryInBackground:pushQuery
                                   withMessage:@"Hello World!"];
}

-(void)webServiceClient:(WebServiceClient *)client didUpdateWithDailyDeals:(id)deals {
    NSLog(@"DailyDeals: %@", deals);
    self.dailyDealsArray = deals;
    [self.dealsTableView reloadData];
}

-(void)webServiceClient:(WebServiceClient *)client didUpdateWithWeeklyDeals:(id)deals {
    self.weeklyDealsArray = deals;
    [self.dealsTableView reloadData];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 2:
        {
            return 43;
            break;
        }
        default:
            return 120;
            break;
    }
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.headerTitles.count;
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
    return [self.headerTitles objectAtIndex:section];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                {
                    static NSString *CellIdentifier = @"dealCell";
                    DailyDealsTableViewCell *cell = (DailyDealsTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    NSURL *imageURL = [NSURL URLWithString:[[self.dailyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Image_URL"]];
                    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
                    UIImage *image = [UIImage imageWithData:imageData];
                    
                    cell.imageView.image = image;
                    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
                    cell.mainTitleLabel.text = [[self.dailyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"ItemName"];  //@"Coin 2.0";
                    cell.subtitleLabel.text = [[self.dailyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Item_Category"];
                    if ([[self.dailyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Unitprice"] == nil) {
                        cell.priceLabel.text = @"";
                    }
                    else {
                    cell.priceLabel.text = [NSString stringWithFormat:@"%@",[[self.dailyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Unitprice"]];
                    }
                    return cell;
                    break;
                }
                    
                case 1:
                {
                    static NSString *CellIdentifier = @"dealCell";
                    DailyDealsTableViewCell *cell = (DailyDealsTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    NSURL *imageURL = [NSURL URLWithString:[[self.dailyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Image_URL"]];
                    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
                    UIImage *image = [UIImage imageWithData:imageData];
                    
                    cell.imageView.image = image;
                    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
                    cell.mainTitleLabel.text = [[self.dailyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"ItemName"];                    cell.subtitleLabel.text = [[self.dailyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Item_Category"];
                    if ([[self.dailyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Unitprice"] == nil) {
                        cell.priceLabel.text = @"";
                    }
                    else {
                    cell.priceLabel.text = [NSString stringWithFormat:@"%@",[[self.dailyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Unitprice"]];
                    }
                    return cell;
                    
                    break;
                }
                    
                case 2:
                {
                    static NSString *CellIdentifier = @"seeMore";
                    SeeMoreTableViewCell *cell = (SeeMoreTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    return cell;
                    
                    break;
                }
                    
                default:
                {
                    static NSString *CellIdentifier = @"dealCell";
                    DailyDealsTableViewCell *cell = (DailyDealsTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    return cell;
                    
                    break;
                }
            }
            break;
            
        case 1:
            switch (indexPath.row) {
                case 0:
                {
                    static NSString *CellIdentifier = @"dealCell";
                    DailyDealsTableViewCell *cell = (DailyDealsTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    NSURL *imageURL = [NSURL URLWithString:[[self.weeklyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Image_URL"]];
                    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
                    UIImage *image = [UIImage imageWithData:imageData];
                    
                    cell.imageView.image = image;
                    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
                    cell.mainTitleLabel.text = [[self.weeklyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"ItemName"];  //@"Coin 2.0";
                    cell.subtitleLabel.text = [[self.weeklyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Item_Category"];
                    if ([[self.dailyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Unitprice"] == nil) {
                        cell.priceLabel.text = @"";
                    }
                    else {
                        cell.priceLabel.text = [NSString stringWithFormat:@"%@",[[self.weeklyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Unitprice"]];
                    }
                    return cell;
                    
                    break;
                }
                    
                case 1:
                {
                    static NSString *CellIdentifier = @"dealCell";
                    DailyDealsTableViewCell *cell = (DailyDealsTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    NSURL *imageURL = [NSURL URLWithString:[[self.weeklyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Image_URL"]];
                    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
                    UIImage *image = [UIImage imageWithData:imageData];
                    
                    cell.imageView.image = image;
                    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
                    cell.mainTitleLabel.text = [[self.weeklyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"ItemName"];                    cell.subtitleLabel.text = [[self.weeklyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Item_Category"];
                    if ([[self.dailyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Unitprice"] == nil) {
                        cell.priceLabel.text = @"";
                    }
                    else {
                        cell.priceLabel.text = [NSString stringWithFormat:@"%@",[[self.weeklyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Unitprice"]];
                    }
                    return cell;
                    
                    break;
                }
                    
                case 2:
                {
                    static NSString *CellIdentifier = @"seeMore";
                    SeeMoreTableViewCell *cell = (SeeMoreTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    return cell;
                    
                    break;
                }
                    
                default:
                {
                    static NSString *CellIdentifier = @"dealCell";
                    DailyDealsTableViewCell *cell = (DailyDealsTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    return cell;
                    
                    break;
                }
            }
            break;
    }
    
    static NSString *cellIdentifier = @"dealCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedRow = indexPath.row;
    if (indexPath.section == 0) {
        self.isDailyDealsSelected = YES;
        if (indexPath.row == 2) {
            [self performSegueWithIdentifier:@"allDealsSegue" sender:self];
        }
        else
        {
            [self performSegueWithIdentifier:@"dealDetailSegue" sender:self];
        }
    }
    
    else {
        self.isDailyDealsSelected = NO;
        if (indexPath.row == 2) {
            [self performSegueWithIdentifier:@"allDealsSegue" sender:self];
        }
        else {
            [self performSegueWithIdentifier:@"dealDetailSegue" sender:self];
        }
    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // making sure the correct logging in/out bool is passed when going to accounts
    if ([[segue identifier] isEqualToString:@"allDealsSegue"])
    {
        AllDealsViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.isDailyDeal = self.isDailyDealsSelected;
        if (self.isDailyDealsSelected) {
            destinationViewController.allDealsArray = self.dailyDealsArray;
        }
        else {
            destinationViewController.allDealsArray = self.weeklyDealsArray;
        }
        
    }
    
    if ([[segue identifier] isEqualToString:@"dealDetailSegue"])
    {
        DealDetailViewController *destinationViewController = segue.destinationViewController;
        if (self.isDailyDealsSelected) {
           destinationViewController.dealArray = self.dailyDealsArray[self.selectedRow];
        }
        else {
            destinationViewController.dealArray = self.weeklyDealsArray[self.selectedRow];
        }
    }
}


@end
