//
//  DealDetailViewController.h
//  OfferBlast
//
//  Created by Chanikya Mandapathi on 12/9/15.
//  Copyright © 2015 Team Offer Blast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DealDetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSDictionary *dealArray;
- (void) showSuccessAlert;
- (void) showLoginAlert;

@end
