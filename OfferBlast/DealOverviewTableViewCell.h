//
//  DealOverviewTableViewCell.h
//  OfferBlast
//
//  Created by Chanikya Mandapathi on 12/9/15.
//  Copyright © 2015 Team Offer Blast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DealOverviewTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dealTitle;
@property (weak, nonatomic) IBOutlet UILabel *dealOwnerLabel;
@property (weak, nonatomic) IBOutlet UILabel *dealPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *dealSavedPriceLabel;

@end
