//
//  WeeklyDealsTableViewCell.h
//  OfferBlast
//
//  Created by Chanikya on 19/11/2015.
//  Copyright © 2015 Team Offer Blast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeeklyDealsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *dealImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end
