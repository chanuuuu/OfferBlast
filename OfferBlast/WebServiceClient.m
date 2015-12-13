//
//  WebServiceClient.m
//  OfferBlast
//
//  Created by Chanikya on 15/11/2015.
//  Copyright © 2015 Team Offer Blast. All rights reserved.
//

#import "WebServiceClient.h"

static NSString * const BaseURLString = @"http://ec2-52-8-44-22.us-west-1.compute.amazonaws.com:8088/";
@implementation WebServiceClient

NSMutableArray *resultArray;


//provides access to singleton object of the class
+ (WebServiceClient *)sharedWebServiceClient
{
    static WebServiceClient *_sharedWebServiceClient = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedWebServiceClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:BaseURLString]];
    });
    
    return _sharedWebServiceClient;
}

// Initializes the object with prolific web service base url
- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    
    if (self) {
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    return self;
}

- (void) getWeeklyDeals {
    
    //AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    
    [self GET:@"api/Weeklydeals"
   parameters:nil
      success:^(NSURLSessionDataTask *task, id responseObject) {
          NSLog(@"JSON: %@", responseObject);
          
          if ([self.delegate respondsToSelector:@selector(webServiceClient:didUpdateWithWeeklyDeals:)]) {
              [self.delegate webServiceClient:self didUpdateWithWeeklyDeals:responseObject];
              
          }
          
      } failure:^(NSURLSessionDataTask *task, NSError *error) {
          if ([self.delegate respondsToSelector:@selector(webServiceClient:didFailWithError:)]) {
              [self.delegate webServiceClient:self didFailWithError:error];
          }
      }];
    
}

- (void) getDailyDeals {
    
    //AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    
    [self GET:@"api/Dailydeals"
   parameters:nil
      success:^(NSURLSessionDataTask *task, id responseObject) {
          NSLog(@"JSON: %@", responseObject);
          
          if ([self.delegate respondsToSelector:@selector(webServiceClient:didUpdateWithDailyDeals:)]) {
              [self.delegate webServiceClient:self didUpdateWithDailyDeals:responseObject];
              
          }
          
      } failure:^(NSURLSessionDataTask *task, NSError *error) {
          if ([self.delegate respondsToSelector:@selector(webServiceClient:didFailWithError:)]) {
              [self.delegate webServiceClient:self didFailWithError:error];
          }
      }];
    
}

- (void) getMyDealsWithToken:(NSString *)token {
    [self POST:@"api/Randomdeals"
    parameters:@{@"Authorization":token}
            success:^(NSURLSessionDataTask *task, id responseObject) {
                NSLog(@"My Deal JSON: %@", responseObject);
     
                if ([self.delegate respondsToSelector:@selector(webServiceClient:didUpdateWithMyDeals:)]) {
                    //[self retrieveBooks];
                    [self.delegate webServiceClient:self didUpdateWithMyDeals:responseObject];
                }
     
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                NSLog(@"Error with My Deals: %@", error);
                if ([self.delegate respondsToSelector:@selector(webServiceClient:didFailWithError:)]) {
                    [self.delegate webServiceClient:self didFailWithError:error];
                }
            }];
}

- (void) validatedLoginWithUsername:(NSString *)username andPassword:(NSString *)password {
    //self.responseSerializer.acceptableStatusCodes = [NSIndexSet indexSetWithIndex:400];
    //self.requestSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/x-www-form-urlencoded"];
    [self POST:@"api/Token"
    parameters:@{@"UserName": @"cmpe298@sjsu.com", @"Password": @"Abcd1234*", @"grant_type":@"password"}
       success:^(NSURLSessionDataTask *task, id responseObject) {
           NSLog(@"Login JSON: %@", responseObject);
           
           if ([self.delegate respondsToSelector:@selector(webServiceClient:didUpdateWithToken:)]) {
               [self.delegate webServiceClient:self didUpdateWithToken:responseObject];
           }
           
       } failure:^(NSURLSessionDataTask *task, NSError *error) {
           NSLog(@"Error with Login: %@", error);
           if ([self.delegate respondsToSelector:@selector(webServiceClient:didFailWithError:)]) {
               [self.delegate webServiceClient:self didFailWithError:error];
           }
       }];
}

- (void) createAccountWithName:(NSString *)name withEmail:(NSString *)email withCity:(NSString *)city withState:(NSString *)state withZipcode:(NSString *)zipcode withPassword:(NSString *)pwd withRetypedPassword:(NSString *)pwd1 {
    [self POST:@"api/Account/Register"
    parameters:@{@"Cust_name": name, @"Email": email, @"City": city, @"State": state, @"Zipcode": zipcode, @"Password":pwd, @"ConfirmPassword": pwd1}
       success:^(NSURLSessionDataTask *task, id responseObject) {
           NSLog(@"Login JSON: %@", responseObject);
           
           if ([self.delegate respondsToSelector:@selector(webServiceClient:didUpdateServerResponseForRegister:)]) {
               [self.delegate webServiceClient:self didUpdateServerResponseForRegister:responseObject];
           }
           
       } failure:^(NSURLSessionDataTask *task, NSError *error) {
           NSLog(@"Error with Login: %@", error);
           if ([self.delegate respondsToSelector:@selector(webServiceClient:didFailWithError:)]) {
               [self.delegate webServiceClient:self didFailWithError:error];
           }
       }];
}

- (void) claimDeal {
    
}


@end

