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

- (void) retrieveBooks;
- (void) addBook: (NSDictionary *) params;
- (void) deleteBook: (NSString *) book;
- (void) updateBookCheckoutWithParams: (NSDictionary *) params withBookID: (NSString *) bookID;
- (void) deleteAllBooks;

@end

@protocol WebServiceClientDelegate <NSObject>

@optional
-(void)webServiceClient:(WebServiceClient *)client didUpdateWithBooks:(id)books;
-(void)webServiceClient:(WebServiceClient *)client didAddBook:(id)book;
-(void)webServiceClient:(WebServiceClient *)client didFailWithError:(NSError *)error;

@end
