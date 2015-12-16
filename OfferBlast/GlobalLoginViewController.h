//
//  GlobalLoginViewController.h
//  OfferBlast
//
//  Created by Chanikya on 15/11/2015.
//  Copyright © 2015 Team Offer Blast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GlobalLoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *signUpBtn;

@property (weak, nonatomic) IBOutlet UIButton *facebookLoginBtn;
- (IBAction)_loginWithFacebook:(id)sender;
- (IBAction)login:(id)sender;
- (IBAction)signup:(id)sender;

- (IBAction)closeVC:(id)sender;

@end
