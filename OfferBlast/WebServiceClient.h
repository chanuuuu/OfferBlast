//
//  WebServiceClient.h
//  OfferBlast
//
//  Created by Chanikya on 15/11/2015.
//  Copyright © 2015 Team Offer Blast. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@protocol WebServiceClientDelegate;

@interface WebServiceClient : AFHTTPSessionManager

@property (nonatomic, weak) id<WebServiceClientDelegate>delegate;

+ (WebServiceClient *)sharedWebServiceClient;
- (instancetype)initWithBaseURL:(NSURL *)url;

- (void) getDailyDeals;
- (void) getWeeklyDeals;
//- (void) addDeal: (NSDictionary *) params;

@end

@protocol WebServiceClientDelegate <NSObject>

@optional
-(void)webServiceClient:(WebServiceClient *)client didUpdateWithDailyDeals:(id)deals;
-(void)webServiceClient:(WebServiceClient *)client didUpdateWithWeeklyDeals:(id)deals;
//-(void)webServiceClient:(WebServiceClient *)client didAddDeal:(id)deal;
-(void)webServiceClient:(WebServiceClient *)client didFailWithError:(NSError *)error;

@end
