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
    cell.textLabel.text = [fakeTableRows objectAtIndex:indexPath.row];
    return cell;
}

- (IBAction)signUpLoginBtn:(id)sender {
}
@end
