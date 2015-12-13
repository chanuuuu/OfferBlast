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
    WebServiceClient *wClient = [WebServiceClient sharedWebServiceClient];
    [wClient getDailyDeals];

}
@end
