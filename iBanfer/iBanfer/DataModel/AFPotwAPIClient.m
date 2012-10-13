//
//  AFPotwAPIClient.m
//  iBanferDataModel
//
//  Created by Dal Maistro Gianmaria on 27/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AFPotwAPIClient.h"
#import "AFJSONRequestOperation.h"
@implementation AFPotwAPIClient

+ (AFPotwAPIClient *)sharedClient {
    static AFPotwAPIClient *_sharedClient = nil;
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
