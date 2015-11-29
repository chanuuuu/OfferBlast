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
    
    UIImage *fbImage = [UIImage imageNamed:@"facebookbtn.png"];
    UIImageView *fbImageView = [[UIImageView alloc] initWithImage:fbImage];
    
    fbImageView.frame = CGRectMake(32, 10, fbImageView.frame.size.width, fbImageView.frame.size.height);
    [self.facebookLoginBtn addSubview:fbImageView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated
{
    self.facebookLoginBtn.layer.cornerRadius = round(self.facebookLoginBtn.frame.size.height/2);
    self.facebookLoginBtn.layer.masksToBounds = YES;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
@end
