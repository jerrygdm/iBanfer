//
//  PotwDataModel.m
//  iBanferDataModel
//
//  Created by Dal Maistro Gianmaria on 27/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PotwDataModel.h"
#import "AFPotwAPIClient.h"
#import "Photo.h"

@implementation PotwDataModel
+ (void)dataWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters block:(void (^)(NSArray *results))block {
    
    NSDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:parameters];
    
    [[AFPotwAPIClient sharedClient] getPath:urlString parameters:mutableParameters success:^(__unused AFHTTPRequestOperation *operation, id JSON) {
        NSMutableArray *mutableRecords = [NSMutableArray array];
        for (NSDictionary *attributes in [JSON valueForKeyPath:@"photos"]){ 
            
            Photo *photo = [[Photo alloc] initWithJSONDictionary:attributes];
            [mutableRecords addObject:photo];
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
