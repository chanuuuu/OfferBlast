//
//  LoginViewController.h
//  
//
//  Created by Chanikya Mandapathi on 12/6/15.
//
//

#import <UIKit/UIKit.h>
#import "WebServiceClient.h"

@interface LoginViewController : UIViewController <WebServiceClientDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginOutlet;
@property NSString *token;

- (IBAction)loginBtn:(id)sender;

- (IBAction)closeVC:(id)sender;
@end
