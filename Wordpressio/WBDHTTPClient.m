//
//  WBDHTTPClient.m
//  Wordpressio
//
//  Created by Bram Plessers on 06/06/13.
//  Copyright (c) 2013 Bram Plessers. All rights reserved.
//

#import "WBDHTTPClient.h"
#import "AFHTTPRequestOperation.h"
#import "JSONKit.h"
#import "AFJSONRequestOperation.h"

@implementation WBDHTTPClient

+(WBDHTTPClient *)sharedClient;
{
    static WBDHTTPClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[WBDHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://webdevotion.be/blog"]];
        _sharedClient.parameterEncoding = AFJSONParameterEncoding;
        [_sharedClient setDefaultHeader:@"Accept" value:@"application/json"];
        //[_sharedClient registerHTTPOperationClass:[AFJSONRequestOperation class]];

    });
    return _sharedClient;
}

- (void)postsWithSuccess:(void (^)(id))success failure:(void (^)(NSError *))failure;
{
    void (^successBlock)(NSURLRequest *, NSHTTPURLResponse *, id) = ^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        //NSDictionary *xml = [NSDictionary dictionaryWithXMLString:operation.responseString];
        NSArray *posts = (NSArray *)JSON;
        success(posts);
    };
    
    void (^failureBlock)(NSURLRequest *, NSHTTPURLResponse *, NSError *, id) = ^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"error: %@", error.description);
        failure(error);
    };

    NSURLRequest *request = [self requestWithMethod:@"GET" path:@"api" parameters:nil];


    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:successBlock failure:failureBlock];
    
    [self enqueueHTTPRequestOperation:operation];
    
}

@end
