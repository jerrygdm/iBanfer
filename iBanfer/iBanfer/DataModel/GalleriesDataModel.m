//
//  GalleriesDataModel.m
//  iBanferDataModel
//
//  Created by Dal Maistro Gianmaria on 04/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GalleriesDataModel.h"
#import "Gallery.h"
#import "AFGalleriesAPIClient.h"

@implementation GalleriesDataModel
+ (void)dataWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters block:(void (^)(NSArray *results))block {
    
    NSDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:parameters];
    
    [[AFGalleriesAPIClient sharedClient] getPath:urlString parameters:mutableParameters success:^(__unused AFHTTPRequestOperation *operation, id JSON) {
        NSMutableArray *mutableRecords = [NSMutableArray array];
        for (NSDictionary *attributes in [JSON valueForKeyPath:@"galleries"]){ 
            
            Gallery *gallery = [[Gallery alloc] initWithJSONDictionary:attributes];
            [mutableRecords addObject:gallery];
        }     
        
        if (block) {
            block(mutableRecords);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error connection %@", [error description]);
        if (block) {
            block([NSArray array]);
        }
    }];
}

@end
