//
//  DealDetailViewController.m
//  OfferBlast
//
//  Created by Chanikya Mandapathi on 12/9/15.
//  Copyright © 2015 Team Offer Blast. All rights reserved.
//

#import "DealDetailViewController.h"
#import "DealDetailTableViewCell.h"
#import "DealClaimTableViewCell.h"
#import "DealImageTableViewCell.h"
#import "DealOverviewTableViewCell.h"

@interface DealDetailViewController ()

@end

@implementation DealDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            return 200;
            break;
        }
        case 1:
        {
            return 195;
            break;
        }
        case 2:
        {
            return 60;
            break;
        }
        case 3:
        {
            return 191;
            break;
        }
            
        default:
            return 200;
            break;
    }
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//- (NSString *)tableView:(UITableView *)tableView
//titleForHeaderInSection:(NSInteger)section
//{
//    return [self.headerTitles objectAtIndex:section];
//}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            static NSString *CellIdentifier = @"dealImageCell";
            DealImageTableViewCell *cell = (DealImageTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
            
            NSURL *imageURL = [NSURL URLWithString:[[self.dealArray objectForKey:@"Items"] objectForKey:@"Image_URL"]];
            NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
            UIImage *image = [UIImage imageWithData:imageData];
            
            cell.dealImage.image = image;
            cell.dealImage.contentMode = UIViewContentModeScaleAspectFit;
            return cell;
            break;
        }
            
        case 1:
        {
            static NSString *CellIdentifier = @"dealOverviewCell";
            DealOverviewTableViewCell *cell = (DealOverviewTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
            cell.dealTitle.text = [[self.dealArray objectForKey:@"Items"] objectForKey:@"ItemName"];
            cell.dealPriceLabel.text = [NSString stringWithFormat:@"%@",[[self.dealArray objectForKey:@"Items"] objectForKey:@"Unitprice"]];
            cell.dealOwnerLabel.text = [[self.dealArray objectForKey:@"Vendors"] objectForKey:@"Vendor_name"];
            cell.dealSavedPriceLabel.text = [NSString stringWithFormat:@"%@", [[self.dealArray objectForKey:@"Item_discount"] objectForKey:@"Item_Discount"]];

            return cell;
            break;
 
        }
        
        case 2:
        {
            static NSString *CellIdentifier = @"dealClaimCell";
            DealClaimTableViewCell *cell = (DealClaimTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
            return cell;
            break;
        }
        case 3:
        {
            static NSString *CellIdentifier = @"dealDetailCell";
            DealDetailTableViewCell *cell = (DealDetailTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
            cell.dealDescriptionLabel.text = [[self.dealArray objectForKey:@"Items"] objectForKey:@"ItemDescr"];
            
            return cell;
            break;
        }
        
        default:
        {
            static NSString *CellIdentifier = @"dealDetailCell";
            DealDetailTableViewCell *cell = (DealDetailTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
            cell.dealDescriptionLabel.text = [[self.dealArray objectForKey:@"Items"] objectForKey:@"ItemDescr"];
            
            return cell;
            break;
        }
    }
    
    static NSString *CellIdentifier = @"dealDetailCell";
    DealDetailTableViewCell *cell = (DealDetailTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.dealDescriptionLabel.text = [[self.dealArray objectForKey:@"Items"] objectForKey:@"ItemDescr"];
    
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2) {
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Deal Claimed"
                                              message:@"Deal has been Claimed. Please continue your purschase at the retailer"
                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {
                                       //[self dismissViewControllerAnimated:YES completion:nil];
                                   }];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}



@end
