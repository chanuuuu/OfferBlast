//
//  GlobalLoginViewController.m
//  OfferBlast
//
//  Created by Chanikya on 15/11/2015.
//  Copyright © 2015 Team Offer Blast. All rights reserved.
//

#import "GlobalLoginViewController.h"
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

@interface GlobalLoginViewController ()

@end

@implementation GlobalLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self.navigationItem setHidesBackButton:YES];
    [self setNeedsStatusBarAppearanceUpdate];
    self.title = @"OfferBlast";
    
    UIImage *fbImage = [UIImage imageNamed:@"facebookbtn.png"];
    UIImageView *fbImageView = [[UIImageView alloc] initWithImage:fbImage];
    
    fbImageView.frame = CGRectMake(32, 10, fbImageView.frame.size.width, fbImageView.frame.size.height);
    [self.facebookLoginBtn addSubview:fbImageView];
    
}

- (void) viewWillAppear:(BOOL)animated
{
    self.facebookLoginBtn.layer.cornerRadius = round(self.facebookLoginBtn.frame.size.height/2);
    self.facebookLoginBtn.layer.masksToBounds = YES;
    
    if ([[NSUserDefaults standardUserDefaults]
         stringForKey:@"AccessToken"]) {
        [self.loginBtn setTitle:@"Log Out" forState:UIControlStateNormal];
        //[self.signUpBtn setBackgroundColor:[UIColor whiteColor]];
    }
    else {
        [self.loginBtn setTitle:@"Log In" forState:UIControlStateNormal];
        //[self.signUpBtn setBackgroundColor:[UIColor colorWithRed:219 green:219 blue:219 alpha:0]];  //DBDBDB
    }
    
}

- (IBAction)_loginWithFacebook:(id)sender {
    // Set permissions required from the facebook user account
    NSArray *permissionsArray = @[ @"user_about_me", @"user_relationships", @"user_birthday", @"user_location"];
    
    // Login PFUser using Facebook
    //logInWithPermissionsInBackground
    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
        if (!user) {
            NSLog(@"Uh oh. The user cancelled the Facebook login.");
        } else if (user.isNew) {
            NSLog(@"User signed up and logged in through Facebook!");
        } else {
            NSLog(@"User logged in through Facebook!");
        }
    }];
}

- (IBAction)login:(id)sender {
    if ([[NSUserDefaults standardUserDefaults]
        stringForKey:@"AccessToken"]) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"AccessToken"];
        [self.loginBtn setTitle:@"Log In" forState:UIControlStateNormal];
        //[self.signUpBtn setBackgroundColor:[UIColor colorWithRed:219 green:219 blue:219 alpha:0]];
    }
    else {
        [self performSegueWithIdentifier:@"loginSegue" sender:self];
    }
}

- (IBAction)signup:(id)sender {
    if (![[NSUserDefaults standardUserDefaults] stringForKey:@"AccessToken"]) {
        [self performSegueWithIdentifier:@"signupSegue" sender:self];
    }
}

- (IBAction)closeVC:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
