//
//  GlobalLoginViewController.m
//  OfferBlast
//
//  Created by Chanikya on 15/11/2015.
//  Copyright © 2015 Team Offer Blast. All rights reserved.
//

#import "GlobalLoginViewController.h"

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

@end
