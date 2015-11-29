//
//  NearByDealsViewController.h
//  OfferBlast
//
//  Created by Chanikya on 19/11/2015.
//  Copyright © 2015 Team Offer Blast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NearByDealsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *dailyDealsTableView;

@property (weak, nonatomic) IBOutlet UITableView *weeklyDealsTableView;
@end
