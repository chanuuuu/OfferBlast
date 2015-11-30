//
//  NearByDealsViewController.h
//  OfferBlast
//
//  Created by Chanikya on 19/11/2015.
//  Copyright © 2015 Team Offer Blast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebServiceClient.h"

@interface NearByDealsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, WebServiceClientDelegate>
@property (weak, nonatomic) IBOutlet UITableView *dealsTableView;
@property NSArray *headerTitles;

@end
