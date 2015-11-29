//
//  MoreViewController.h
//  OfferBlast
//
//  Created by Chanikya on 18/11/2015.
//  Copyright © 2015 Team Offer Blast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)signUpLoginBtn:(id)sender;

@end
