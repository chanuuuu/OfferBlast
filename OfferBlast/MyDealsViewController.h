//
//  MyDealsViewController.h
//  OfferBlast
//
//  Created by Chanikya Mandapathi on 12/5/15.
//  Copyright © 2015 Team Offer Blast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "WebServiceClient.h"

@interface MyDealsViewController : UIViewController <WebServiceClientDelegate, CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myDealsTableView;

@end
