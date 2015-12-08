//
//  AllDealsViewController.h
//  OfferBlast
//
//  Created by Chanikya Mandapathi on 12/6/15.
//  Copyright © 2015 Team Offer Blast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebServiceClient.h"

@interface AllDealsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, WebServiceClientDelegate>
@property (weak, nonatomic) IBOutlet UITableView *allDealsTableView;
@property (atomic, strong) NSMutableArray *allDealsArray;
@property BOOL isDailyDeal;

@end
