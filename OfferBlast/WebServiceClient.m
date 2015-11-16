//
//  WebServiceClient.m
//  OfferBlast
//
//  Created by Chanikya on 15/11/2015.
//  Copyright © 2015 Team Offer Blast. All rights reserved.
//

#import "WebServiceClient.h"

static NSString * const BaseURLString = @"http://prolific-interview.herokuapp.com/558d707e07c7b900097397ee/";
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

// Retrieves All books from Prolific WebService -- request to GET /books
- (void) retrieveBooks {
    
    //AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    
    [self GET:@"books"
   parameters:nil
      success:^(NSURLSessionDataTask *task, id responseObject) {
          NSLog(@"JSON: %@", responseObject);
          
          if ([self.delegate respondsToSelector:@selector(webServiceClient:didUpdateWithBooks:)]) {
              [self.delegate webServiceClient:self didUpdateWithBooks:responseObject];
              
          }
          
      } failure:^(NSURLSessionDataTask *task, NSError *error) {
          if ([self.delegate respondsToSelector:@selector(webServiceClient:didFailWithError:)]) {
              [self.delegate webServiceClient:self didFailWithError:error];
          }
      }];
    
}


//Add a Library Book -- request to POST /books/
- (void) addBook:(NSDictionary *) params {
    
    [self POST:@"books"
    parameters:params
       success:^(NSURLSessionDataTask *task, id responseObject) {
           NSLog(@"addBook JSON: %@", responseObject);
           
           if ([self.delegate respondsToSelector:@selector(webServiceClient:didUpdateWithBooks:)]) {
               [self retrieveBooks];
               //[self.delegate webServiceClient:self didUpdateWithBooks:responseObject];
               //[[NSNotificationCenter defaultCenter] postNotificationName: @"bookAdded" object:nil userInfo:nil];
           }
           
       } failure:^(NSURLSessionDataTask *task, NSError *error) {
           if ([self.delegate respondsToSelector:@selector(webServiceClient:didFailWithError:)]) {
               [self.delegate webServiceClient:self didFailWithError:error];
           }
       }];
    
}

//CheckOut a book -- request to PUT /books/id
- (void) updateBookCheckoutWithParams: (NSDictionary *) params withBookID: (NSString *) bookID
{
    [self PUT:[NSString stringWithFormat:@"books/%@",bookID]
   parameters:params
      success:^(NSURLSessionDataTask *task, id responseObject) {
          NSLog(@"updateBook JSON: %@", responseObject);
          
          if ([self.delegate respondsToSelector:@selector(webServiceClient:didUpdateWithBooks:)]) {
              [self retrieveBooks];
              //[[NSNotificationCenter defaultCenter] postNotificationName: @"bookCheckedOut" object:nil userInfo:nil];
              
          }
          
      } failure:^(NSURLSessionDataTask *task, NSError *error) {
          if ([self.delegate respondsToSelector:@selector(webServiceClient:didFailWithError:)]) {
              [self.delegate webServiceClient:self didFailWithError:error];
          }
      }];
}

// Delete a book -- request to DELETE /books/id
- (void) deleteBook:(NSString *) bookID
{
    [self DELETE:[NSString stringWithFormat:@"books/%@",bookID]
      parameters:nil
         success:^(NSURLSessionDataTask *task, id responseObject) {
             NSLog(@"addBook JSON: %@", responseObject);
             
             if ([self.delegate respondsToSelector:@selector(webServiceClient:didUpdateWithBooks:)]) {
                 [self retrieveBooks];
                 //[self.delegate webServiceClient:self didUpdateWithBooks:responseObject];
                 //[[NSNotificationCenter defaultCenter] postNotificationName: @"bookDeleted" object:nil userInfo:nil];
                 
             }
             
         } failure:^(NSURLSessionDataTask *task, NSError *error) {
             if ([self.delegate respondsToSelector:@selector(webServiceClient:didFailWithError:)]) {
                 [self.delegate webServiceClient:self didFailWithError:error];
             }
         }];
}

// Delete all the library books -- request to DELETE /clean
- (void) deleteAllBooks
{
    [self DELETE:@"clean"
      parameters:nil
         success:^(NSURLSessionDataTask *task, id responseObject) {
             
             if ([self.delegate respondsToSelector:@selector(webServiceClient:didUpdateWithBooks:)]) {
                 [self retrieveBooks];
                 //[self.delegate webServiceClient:self didUpdateWithBooks:responseObject];
                 //[[NSNotificationCenter defaultCenter] postNotificationName: @"booksDeleted" object:nil userInfo:nil];
                 
             }
             
         } failure:^(NSURLSessionDataTask *task, NSError *error) {
             if ([self.delegate respondsToSelector:@selector(webServiceClient:didFailWithError:)]) {
                 [self.delegate webServiceClient:self didFailWithError:error];
             }
         }];
}


@end

