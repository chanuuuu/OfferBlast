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
- (void) getMyDealsWithToken: (NSString *) token;
- (void) validatedLoginWithUsername: (NSString *) username andPassword: (NSString *) password;
- (void) createAccountWithName: (NSString *) name withEmail: (NSString *) email withCity:(NSString *) city withState:(NSString *) state withZipcode: (NSString *) zipcode withPassword:(NSString *) pwd withRetypedPassword:(NSString *) pwd1;
//- (void) addDeal: (NSDictionary *) params;

@end

@protocol WebServiceClientDelegate <NSObject>

@optional
- (void)webServiceClient:(WebServiceClient *)client didUpdateWithDailyDeals:(id)deals;
- (void)webServiceClient:(WebServiceClient *)client didUpdateWithWeeklyDeals:(id)deals;
- (void)webServiceClient:(WebServiceClient *)client didUpdateWithMyDeals:(id)deals;
- (void)webServiceClient:(WebServiceClient *)client didUpdateWithToken:(id)response;
- (void)webServiceClient:(WebServiceClient *)client didUpdateServerResponseForRegister:(id)response;

//-(void)webServiceClient:(WebServiceClient *)client didAddDeal:(id)deal;
- (void)webServiceClient:(WebServiceClient *)client didFailWithError:(NSError *)error;

@end
