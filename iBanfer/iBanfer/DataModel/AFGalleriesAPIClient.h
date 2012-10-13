//
//  AFGalleriesAPIClient.h
//  iBanferDataModel
//
//  Created by Dal Maistro Gianmaria on 04/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"
#import "JSONKit.h"


#define BASE_URL_TEST @"http://www.ibanfer.com/"

@interface AFGalleriesAPIClient : AFHTTPClient
+ (AFGalleriesAPIClient *)sharedClient;
@end
