//
//  CreateAccountViewController.m
//  OfferBlast
//
//  Created by Chanikya Mandapathi on 12/6/15.
//  Copyright © 2015 Team Offer Blast. All rights reserved.
//

#import "CreateAccountViewController.h"

@interface CreateAccountViewController ()
@property WebServiceClient *wClient;

@end

@implementation CreateAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self.navigationItem setHidesBackButton:YES];
    [self setNeedsStatusBarAppearanceUpdate];
    self.title = @"OfferBlast";
    
    self.wClient = [WebServiceClient sharedWebServiceClient];
    self.wClient.delegate = self;
}

- (void) viewWillAppear:(BOOL)animated {
    self.createBtn.layer.cornerRadius = round(self.createBtn.frame.size.height/2);
    self.createBtn.layer.masksToBounds = YES;
}

- (IBAction)createAccount:(id)sender {
    NSLog(@"Encrypted Password: %@", self.password.text);
    [self.wClient createAccountWithName:self.nameTextField.text withEmail:self.email.text withCity:self.city.text withState:self.state.text withZipcode:self.zipCode.text withPassword:self.password.text withRetypedPassword:self.retypedPassword.text];
}

- (IBAction)closeVC:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)webServiceClient:(WebServiceClient *)client didUpdateServerResponseForRegister:(id)response; {
    NSLog(@"Account creation successfull");
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Account Creation Successful"
                                          message:@"Your account has been successfully created. Please login into your account"
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   [self dismissViewControllerAnimated:YES completion:nil];
                               }];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
    
}

@end
