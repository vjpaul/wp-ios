//
//  WBDHTTPClient.h
//  Wordpressio
//
//  Created by Bram Plessers on 06/06/13.
//  Copyright (c) 2013 Bram Plessers. All rights reserved.
//

#import "AFHTTPClient.h"

@interface WBDHTTPClient : AFHTTPClient

+ (WBDHTTPClient *)sharedClient;

- (void) postsWithSuccess:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

@end
