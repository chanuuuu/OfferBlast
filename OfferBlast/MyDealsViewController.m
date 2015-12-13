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

@interface MyDealsViewController ()

@property WebServiceClient *wClient;
@property (atomic, strong) NSMutableArray *myDealsArray;
@property NSString *access_token;

@property (strong, nonatomic) CLBeaconRegion *myBeaconRegion;
@property (strong, nonatomic) CLLocationManager *locationManager;


@end

@implementation MyDealsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self.navigationItem setHidesBackButton:YES];
    [self setNeedsStatusBarAppearanceUpdate];
    self.title = @"OfferBlast";
    
    self.access_token = [[NSUserDefaults standardUserDefaults]
                         stringForKey:@"AccessToken"];
    
    self.wClient = [WebServiceClient sharedWebServiceClient];
    self.wClient.delegate = self;
    //[self.wClient getMyDealsWithToken:self.access_token];
    
    // Initialize location manager and set ourselves as the delegate
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    // Create a NSUUID with the same UUID as the broadcasting beacon
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"DCBF9CA2-53AD-49DF-AC57-64ACF2B95BB5"];
    
    // Setup a new region with that UUID and same identifier as the broadcasting beacon
    self.myBeaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid
                                                             identifier:@"com.offerblast.testregion"];
    
    // Tell location manager to start monitoring for the beacon region
    [self.locationManager startMonitoringForRegion:self.myBeaconRegion];
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

- (void)locationManager:(CLLocationManager*)manager didEnterRegion:(CLRegion*)region
{
    [self.locationManager startRangingBeaconsInRegion:self.myBeaconRegion];
}

-(void)locationManager:(CLLocationManager*)manager didExitRegion:(CLRegion*)region
{
    [self.locationManager stopRangingBeaconsInRegion:self.myBeaconRegion];
    //self.beaconFoundLabel.text = @"No";
}

-(void)locationManager:(CLLocationManager*)manager
       didRangeBeacons:(NSArray*)beacons
              inRegion:(CLBeaconRegion*)region
{
    // Beacon found!
    //self.statusLabel.text = @"Beacon found!";
    NSLog(@"Beacon found!");
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"iBeacon found"
                                          message:@"You are in the Chanu's home"
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   [self dismissViewControllerAnimated:YES completion:nil];
                               }];
    [alertController addAction:okAction];

    
    CLBeacon *foundBeacon = [beacons firstObject];
    
    // You can retrieve the beacon data from its properties
    //NSString *uuid = foundBeacon.proximityUUID.UUIDString;
    //NSString *major = [NSString stringWithFormat:@"%@", foundBeacon.major];
    //NSString *minor = [NSString stringWithFormat:@"%@", foundBeacon.minor];
}



@end
