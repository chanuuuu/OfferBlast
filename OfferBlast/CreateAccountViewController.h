//
//  CreateAccountViewController.h
//  OfferBlast
//
//  Created by Chanikya Mandapathi on 12/6/15.
//  Copyright © 2015 Team Offer Blast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebServiceClient.h"

@interface CreateAccountViewController : UIViewController <WebServiceClientDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UITextField *state;
@property (weak, nonatomic) IBOutlet UITextField *zipCode;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *retypedPassword;
@property (weak, nonatomic) IBOutlet UIButton *createBtn;

- (IBAction)createAccount:(id)sender;
- (IBAction)closeVC:(id)sender;

@end
