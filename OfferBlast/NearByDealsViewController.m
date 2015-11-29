//
//  NearByDealsViewController.m
//  OfferBlast
//
//  Created by Chanikya on 19/11/2015.
//  Copyright © 2015 Team Offer Blast. All rights reserved.
//

#import "NearByDealsViewController.h"
#import "DailyDealsTableViewCell.h"
#import "WeeklyDealsTableViewCell.h"
#import "SeeMoreTableViewCell.h"

@interface NearByDealsViewController ()

@end

@implementation NearByDealsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self.navigationItem setHidesBackButton:YES];
    [self setNeedsStatusBarAppearanceUpdate];
    self.title = @"OfferBlast";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 2:
        {
            return 43;
            break;
        }
        default:
            return 110;
            break;
    }
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([tableView isEqual:self.dailyDealsTableView])
    {
        switch (indexPath.row) {
            case 0:
            {
                static NSString *CellIdentifier = @"dealCell";
                DailyDealsTableViewCell *cell = (DailyDealsTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                cell.imageView.image = [UIImage imageNamed:@"images.jpeg"];
                cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
                cell.mainTitleLabel.text = @"Coin 2.0";
                cell.subtitleLabel.text = @"A smart device for all cards";
                cell.priceLabel.text = @"$99.00";
                return cell;
                
                break;
            }
            
            case 1:
            {
                static NSString *CellIdentifier = @"dealCell";
                DailyDealsTableViewCell *cell = (DailyDealsTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                cell.imageView.image = [UIImage imageNamed:@"81S6SuC1NHL._SL1500_.jpg"];
                cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
                cell.mainTitleLabel.text = @"Aroma Simply Stainless Rice Cooker";
                cell.subtitleLabel.text = @"14-Cup cooked (7-cup) unccoked";
                cell.priceLabel.text = @"$39.00";
                return cell;
                
                break;
            }
                
            case 2:
            {
                static NSString *CellIdentifier = @"seeMore";
                SeeMoreTableViewCell *cell = (SeeMoreTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                return cell;
                
                break;
            }
                
            default:
            {
                static NSString *CellIdentifier = @"dealCell";
                DailyDealsTableViewCell *cell = (DailyDealsTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                return cell;
                
                break;
            }
        }
    }
    
    if([tableView isEqual:self.weeklyDealsTableView])
    {
        switch (indexPath.row) {
            case 0:
            {
                static NSString *CellIdentifier = @"dealCell";
                WeeklyDealsTableViewCell *cell = (WeeklyDealsTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                cell.imageView.frame = CGRectMake(0,0,32,32);
                cell.imageView.image = [UIImage imageNamed:@"SurfaceBook_206x130px.png"];
                cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
                cell.titleLabel.text = @"Surface Book";
                cell.subtitleLabel.text = @"A hybrid laptop for all the needs";
                cell.priceLabel.text = @"$499.00";
                return cell;
                
                break;
            }
                
            case 1:
            {
                static NSString *CellIdentifier = @"dealCell";
                WeeklyDealsTableViewCell *cell = (WeeklyDealsTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                cell.imageView.frame = CGRectMake(0,0,32,32);
                cell.imageView.image = [UIImage imageNamed:@"House_of_Cards_Season_1_Poster.jpg"];
                cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
                cell.titleLabel.text = @"House of Cards";
                cell.subtitleLabel.text = @"Season 03";
                cell.priceLabel.text = @"$19.40";
                return cell;
                
                break;
            }
                
            case 2:
            {
                static NSString *CellIdentifier = @"seeMore";
                SeeMoreTableViewCell *cell = (SeeMoreTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                return cell;
                
                break;
            }
                
            default:
            {
                static NSString *CellIdentifier = @"dealCell";
                WeeklyDealsTableViewCell *cell = (WeeklyDealsTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                return cell;
                
                break;
            }
        }
    }
    
    static NSString *CellIdentifier = @"dealCell";
    DailyDealsTableViewCell *cell = (DailyDealsTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    return cell;
    
}



@end
