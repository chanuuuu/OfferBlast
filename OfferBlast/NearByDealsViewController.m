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

@interface NearByDealsViewController ()

@property WebServiceClient *wClient;
@property (atomic, strong) NSMutableArray *dailyDealsArray;
@property (atomic, strong) NSMutableArray *weeklyDealsArray;

@end

@implementation NearByDealsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self.navigationItem setHidesBackButton:YES];
    [self setNeedsStatusBarAppearanceUpdate];
    self.title = @"OfferBlast";
    
    self.headerTitles = [NSArray arrayWithObjects:@"Daily Deals", @"Weakly Deals", nil];
    
    self.wClient = [WebServiceClient sharedWebServiceClient];
    self.wClient.delegate = self;
    [self.wClient getDailyDeals];
    [self.wClient getWeeklyDeals];
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
            return 110;
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
                    NSURL *imageURL = [NSURL URLWithString:[[self.dailyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Image_URL"]];
                    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
                    UIImage *image = [UIImage imageWithData:imageData];
                    
                    cell.imageView.image = image;
                    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
                    cell.mainTitleLabel.text = [[self.dailyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"ItemName"];  //@"Coin 2.0";
                    cell.subtitleLabel.text = [[self.dailyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Item_Category"];
                    cell.priceLabel.text = [NSString stringWithFormat:@"%@",[[self.dailyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Unitprice"]];
                    return cell;
                    
                    break;
                }
                    
                case 1:
                {
                    static NSString *CellIdentifier = @"dealCell";
                    DailyDealsTableViewCell *cell = (DailyDealsTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                    NSURL *imageURL = [NSURL URLWithString:[[self.dailyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Image_URL"]];
                    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
                    UIImage *image = [UIImage imageWithData:imageData];
                    
                    cell.imageView.image = image;
                    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
                    cell.mainTitleLabel.text = [[self.dailyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"ItemName"];                    cell.subtitleLabel.text = [[self.dailyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Item_Category"];
                    cell.priceLabel.text = [NSString stringWithFormat:@"%@",[[self.dailyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Unitprice"]];
                    return cell;
                    
                    break;
                }
                    
                case 2:
                {
                    static NSString *CellIdentifier = @"seeMore";
                    SeeMoreTableViewCell *cell = (SeeMoreTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                    return cell;
                    
                    break;
                }
                    
                default:
                {
                    static NSString *CellIdentifier = @"dealCell";
                    DailyDealsTableViewCell *cell = (DailyDealsTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
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
                    NSURL *imageURL = [NSURL URLWithString:[[self.weeklyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Image_URL"]];
                    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
                    UIImage *image = [UIImage imageWithData:imageData];
                    
                    cell.imageView.image = image;
                    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
                    cell.mainTitleLabel.text = [[self.weeklyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"ItemName"];  //@"Coin 2.0";
                    cell.subtitleLabel.text = [[self.weeklyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Item_Category"];
                    cell.priceLabel.text = [NSString stringWithFormat:@"%@",[[self.weeklyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Unitprice"]];
                    return cell;
                    
                    break;
                }
                    
                case 1:
                {
                    static NSString *CellIdentifier = @"dealCell";
                    DailyDealsTableViewCell *cell = (DailyDealsTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                    NSURL *imageURL = [NSURL URLWithString:[[self.weeklyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Image_URL"]];
                    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
                    UIImage *image = [UIImage imageWithData:imageData];
                    
                    cell.imageView.image = image;
                    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
                    cell.mainTitleLabel.text = [[self.weeklyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"ItemName"];                    cell.subtitleLabel.text = [[self.weeklyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Item_Category"];
                    cell.priceLabel.text = [NSString stringWithFormat:@"%@",[[self.weeklyDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Unitprice"]];
                    return cell;
                    
                    break;
                }
                    
                case 2:
                {
                    static NSString *CellIdentifier = @"seeMore";
                    SeeMoreTableViewCell *cell = (SeeMoreTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                    return cell;
                    
                    break;
                }
                    
                default:
                {
                    static NSString *CellIdentifier = @"dealCell";
                    DailyDealsTableViewCell *cell = (DailyDealsTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                    return cell;
                    
                    break;
                }
            }
            break;
    }
    
    static NSString *cellIdentifier = @"dealCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    return cell;
}


@end
