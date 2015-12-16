//
//  MoreViewController.m
//  OfferBlast
//
//  Created by Chanikya on 18/11/2015.
//  Copyright © 2015 Team Offer Blast. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

NSMutableArray *fakeTableRows;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self.navigationItem setHidesBackButton:YES];
    [self setNeedsStatusBarAppearanceUpdate];
    self.title = @"OfferBlast";
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.23 green:0.35 blue:0.60 alpha:1.0]];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    fakeTableRows = [NSMutableArray arrayWithObjects:@"Add a deal", @"Settings", @"Rate OfferBlast in App Store", @"Support", nil];
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
    return @"More";
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return fakeTableRows.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [fakeTableRows objectAtIndex:indexPath.row];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 3) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://ec2-54-67-58-180.us-west-1.compute.amazonaws.com:8086/"]];
    }
}

- (IBAction)signUpLoginBtn:(id)sender {
}
@end
