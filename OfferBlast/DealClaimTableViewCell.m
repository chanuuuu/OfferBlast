//
//  DealClaimTableViewCell.m
//  
//
//  Created by Chanikya Mandapathi on 12/9/15.
//
//

#import "DealClaimTableViewCell.h"
#import "WebServiceClient.h"

@implementation DealClaimTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)claimDeal:(id)sender {
    if ([[NSUserDefaults standardUserDefaults]
        stringForKey:@"AccessToken"]) {
      //WebServiceClient *wClient = [WebServiceClient sharedWebServiceClient];
      //[wClient claimDealWithItemID:self.itemID andCouponID:self.couponID andToken:[[NSUserDefaults standardUserDefaults]
                                                                                // stringForKey:@"AccessToken"]];
    [((DealDetailViewController *)self.delegate) showSuccessAlert];
    }
    else {
        [((DealDetailViewController *)self.delegate) showLoginAlert];
    }
    
}

- (void)webServiceClient:(WebServiceClient *)client didClaimedDeal:(id) response {
    [((DealDetailViewController *)self.delegate) showSuccessAlert];
}

@end
