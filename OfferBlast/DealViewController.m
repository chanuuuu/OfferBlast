//
//  DealViewController.m
//  
//
//  Created by Chanikya on 29/11/2015.
//
//

#import "DealViewController.h"

@interface DealViewController ()

@end

@implementation DealViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void) viewWillAppear:(BOOL)animated {
    NSURL *imageURL = [NSURL URLWithString:[[self.dealArray objectForKey:@"Items"] objectForKey:@"Image_URL"]];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage *image = [UIImage imageWithData:imageData];
    
    self.dealImage.image = image;
    self.dealImage.contentMode = UIViewContentModeScaleAspectFit;
    self.dealTitle.text = [[self.dealArray objectForKey:@"Items"] objectForKey:@"ItemName"];
    self.itemPrice.text = [NSString stringWithFormat:@"%@",[[self.dealArray objectForKey:@"Items"] objectForKey:@"Unitprice"]];
    self.productOwner.text = [[self.dealArray objectForKey:@"Vendors"] objectForKey:@"Vendor_name"];
    self.savingPrice.text = [NSString stringWithFormat:@"%@", [[self.dealArray objectForKey:@"Item_discount"] objectForKey:@"Item_Discount"]];
    //self.stockAvailability.text = [[self.dealArray objectForKey:@"Items"] objectForKey:@"Image_URL"];
    self.itemDescription.text = [[self.dealArray objectForKey:@"Items"] objectForKey:@"ItemDescr"];
    
}

- (IBAction)claimDeal:(id)sender {
    
}

- (IBAction)saveDeal:(id)sender {
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Deal Saved"
                                          message:@"Deal has been saved!"
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   [self dismissViewControllerAnimated:YES completion:nil];
                               }];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void) showSuccessAlert {
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Deal Claimed"
                                          message:@"Deal has been Claimed. Please continue your purschase at the retailer"
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   [self dismissViewControllerAnimated:YES completion:nil];
                               }];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
