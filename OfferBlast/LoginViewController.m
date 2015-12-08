//
//  LoginViewController.m
//  
//
//  Created by Chanikya Mandapathi on 12/6/15.
//
//

#import "LoginViewController.h"
#import "WebServiceClient.h"

@interface LoginViewController ()
@property WebServiceClient *wClient;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self.navigationItem setHidesBackButton:NO];
    [self setNeedsStatusBarAppearanceUpdate];
    self.title = @"OfferBlast";
    
    self.wClient = [WebServiceClient sharedWebServiceClient];
    self.wClient.delegate = self;
    
    self.loginOutlet.layer.cornerRadius = round(self.loginOutlet.frame.size.height/2);
    self.loginOutlet.layer.masksToBounds = YES;
}

- (void) webServiceClient:(WebServiceClient *)client didUpdateWithToken:(id)response {
    NSDictionary *tempDict = (NSDictionary *) response;
    self.token = [tempDict valueForKey:@"access_token"];
    NSLog(@"Token: %@", self.token);
    
    [[NSUserDefaults standardUserDefaults] setObject:self.token forKey:@"AccessToken"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self.loginOutlet setTitle:@"Logout" forState:UIControlStateNormal];
}

- (IBAction)loginBtn:(id)sender {
    [self.wClient validatedLoginWithUsername:self.userNameTextField.text andPassword:self.passwordTextField.text];
}

- (IBAction)closeVC:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
