//
//  MyDealsViewController.m
//  OfferBlast
//
//  Created by Chanikya Mandapathi on 12/5/15.
//  Copyright © 2015 Team Offer Blast. All rights reserved.
//

#import "MyDealsViewController.h"
#import "DailyDealsTableViewCell.h"
#import "WebServiceClient.h"
#import "DealDetailViewController.h"

@interface MyDealsViewController ()

@property WebServiceClient *wClient;
@property (atomic, strong) NSMutableArray *myDealsArray;
@property NSString *access_token;
@property NSInteger selectedRow;


@end

@implementation MyDealsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self.navigationItem setHidesBackButton:YES];
    [self setNeedsStatusBarAppearanceUpdate];
    [self.navigationItem setTitle:@"Targeted Deals"];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.23 green:0.35 blue:0.60 alpha:1.0]];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

- (void) viewWillAppear:(BOOL)animated {
    self.wClient = [WebServiceClient sharedWebServiceClient];
    self.wClient.delegate = self;
    
    self.access_token = [[NSUserDefaults standardUserDefaults]
                         stringForKey:@"AccessToken"];
    
    if (self.access_token) {
        NSLog(@"Access Token to get my deals %@", self.access_token);
        [self.wClient getMyDealsWithToken:self.access_token];
    }
    else {
        [self.myDealsArray addObject:@"Please login to access your customized deals"];
    }
}

-(void)webServiceClient:(WebServiceClient *)client didUpdateWithMyDeals:(id)deals {
    NSLog(@"MyDeals: %@", deals);
    self.myDealsArray = deals;
    [self.myDealsTableView reloadData];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
    return @"Deals For You";
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.myDealsArray.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"myDealCell";
    DailyDealsTableViewCell *cell = (DailyDealsTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSURL *imageURL = [NSURL URLWithString:[[self.myDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Image_URL"]];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage *image = [UIImage imageWithData:imageData];
    
    cell.imageView.image = image;
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    cell.mainTitleLabel.text = [[self.myDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"ItemName"];
    cell.subtitleLabel.text = [[self.myDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Item_Category"];
    cell.priceLabel.text = [NSString stringWithFormat:@"%@",[[self.myDealsArray[indexPath.row] objectForKey:@"Items"] objectForKey:@"Unitprice"]];
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedRow = indexPath.row;
    [self performSegueWithIdentifier:@"mydealDetailSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"mydealDetailSegue"])
    {
        DealDetailViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.dealArray = self.myDealsArray[self.selectedRow];
    }
}


@end
