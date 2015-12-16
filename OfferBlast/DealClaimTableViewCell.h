//
//  DealClaimTableViewCell.h
//  
//
//  Created by Chanikya Mandapathi on 12/9/15.
//
//

#import <UIKit/UIKit.h>
#import "WebServiceClient.h"
#import "DealDetailViewController.h"

@interface DealClaimTableViewCell : UITableViewCell <WebServiceClientDelegate>

@property (nonatomic, weak) id delegate;
@property (nonatomic) NSInteger itemID;
@property (nonatomic) NSInteger couponID;
- (IBAction)claimDeal:(id)sender;

@end
