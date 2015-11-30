//
//  WebServiceClient.m
//  OfferBlast
//
//  Created by Chanikya on 15/11/2015.
//  Copyright © 2015 Team Offer Blast. All rights reserved.
//

#import "WebServiceClient.h"

static NSString * const BaseURLString = @"http://ec2-52-8-44-22.us-west-1.compute.amazonaws.com:8088/api/";
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
        //self.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    return self;
}

- (void) getWeeklyDeals {
    
    //AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    
    [self GET:@"Weeklydeals"
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
    
    
    [self GET:@"Dailydeals"
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

//- (void) addBook:(NSDictionary *) params {
//    
//    [self POST:@"books"
//    parameters:params
//       success:^(NSURLSessionDataTask *task, id responseObject) {
//           NSLog(@"addBook JSON: %@", responseObject);
//           
//           if ([self.delegate respondsToSelector:@selector(webServiceClient:didUpdateWithBooks:)]) {
//               [self retrieveBooks];
//               //[self.delegate webServiceClient:self didUpdateWithBooks:responseObject];
//               //[[NSNotificationCenter defaultCenter] postNotificationName: @"bookAdded" object:nil userInfo:nil];
//           }
//           
//       } failure:^(NSURLSessionDataTask *task, NSError *error) {
//           if ([self.delegate respondsToSelector:@selector(webServiceClient:didFailWithError:)]) {
//               [self.delegate webServiceClient:self didFailWithError:error];
//           }
//       }];
//    
//}
//
////CheckOut a book -- request to PUT /books/id
//- (void) updateBookCheckoutWithParams: (NSDictionary *) params withBookID: (NSString *) bookID
//{
//    [self PUT:[NSString stringWithFormat:@"books/%@",bookID]
//   parameters:params
//      success:^(NSURLSessionDataTask *task, id responseObject) {
//          NSLog(@"updateBook JSON: %@", responseObject);
//          
//          if ([self.delegate respondsToSelector:@selector(webServiceClient:didUpdateWithBooks:)]) {
//              [self retrieveBooks];
//              //[[NSNotificationCenter defaultCenter] postNotificationName: @"bookCheckedOut" object:nil userInfo:nil];
//              
//          }
//          
//      } failure:^(NSURLSessionDataTask *task, NSError *error) {
//          if ([self.delegate respondsToSelector:@selector(webServiceClient:didFailWithError:)]) {
//              [self.delegate webServiceClient:self didFailWithError:error];
//          }
//      }];
//}


@end

