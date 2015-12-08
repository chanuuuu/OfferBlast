//
//  DealViewController.h
//  
//
//  Created by Chanikya on 29/11/2015.
//
//

#import <UIKit/UIKit.h>

@interface DealViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *dealTitle;
@property (weak, nonatomic) IBOutlet UIImageView *dealImage;
@property (weak, nonatomic) IBOutlet UILabel *productOwner;
@property (weak, nonatomic) IBOutlet UILabel *itemPrice;
@property (weak, nonatomic) IBOutlet UILabel *savingPrice;
@property (weak, nonatomic) IBOutlet UILabel *stockAvailability;
@property (weak, nonatomic) IBOutlet UILabel *itemDescription;
@property (weak, nonatomic) IBOutlet UIScrollView *dealScrollView;
@property (strong, nonatomic) NSDictionary *dealArray;

- (IBAction)claimDeal:(id)sender;
- (IBAction)saveDeal:(id)sender;

@end
