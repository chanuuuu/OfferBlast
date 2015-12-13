//
//  AllDealsViewController.m
//  OfferBlast
//
//  Created by Chanikya Mandapathi on 12/6/15.
//  Copyright © 2015 Team Offer Blast. All rights reserved.
//

#import "AllDealsViewController.h"
#import "DailyDealsTableViewCell.h"
#import "DealViewController.h"
#import "DealDetailViewController.h"

@interface AllDealsViewController ()

@property WebServiceClient *wClient;
@property NSInteger selectedRow;

@end

@implementation AllDealsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self.navigationItem setHidesBackButton:NO];
    [self setNeedsStatusBarAppearanceUpdate];
    self.title = @"OfferBlast";
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
    if (self.isDailyDeal) {
        return @"Daily Deals";
    }
    return @"Weekly Deals";
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 115;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.allDealsArray.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"dealCell";
    DailyDealsTableViewCell *cell = (DailyDealsTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSURL *imageURL = [NSURL URLWithString:[[self.allDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Image_URL"]];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage *image = [UIImage imageWithData:imageData];

    cell.imageView.image = image;
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    cell.mainTitleLabel.text = [[self.allDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"ItemName"];  //@"Coin 2.0";
    cell.subtitleLabel.text = [[self.allDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Item_Category"];
    cell.priceLabel.text = [NSString stringWithFormat:@"%@",[[self.allDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Unitprice"]];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // making sure the correct logging in/out bool is passed when going to accounts
    if ([[segue identifier] isEqualToString:@"dealFromAllDealsSegue"])
    {
        DealDetailViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.dealArray = self.allDealsArray[self.selectedRow];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedRow = indexPath.row;
    [self performSegueWithIdentifier:@"dealFromAllDealsSegue" sender:self];
    
}


@end
