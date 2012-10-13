//
//  AFConfigAPIClient.m
//  MatchTrackerDataModel
//
//  Created by andrea fanfani on 19/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AFConfigAPIClient.h"
#import "AFJSONRequestOperation.h"

@implementation AFConfigAPIClient

+ (AFConfigAPIClient *)sharedClient {
    static AFConfigAPIClient *_sharedClient = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL_TEST]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    return self;
}

@end
