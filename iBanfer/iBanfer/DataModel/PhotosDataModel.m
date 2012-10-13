//
//  PhotosDataModel.m
//  iBanferDataModel
//
//  Created by Dal Maistro Gianmaria on 04/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhotosDataModel.h"
#import "Photo_full.h"
#import "AFPhotosAPICLient.h"

@implementation PhotosDataModel
+ (void)dataWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters block:(void (^)(NSArray *results))block {
    
    NSDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:parameters];
    
    [[AFPhotosAPICLient sharedClient] getPath:urlString parameters:mutableParameters success:^(__unused AFHTTPRequestOperation *operation, id JSON) {
        NSMutableArray *mutableRecords = [NSMutableArray array];
        for (NSDictionary *attributes in [JSON valueForKeyPath:@"photos"]){ 
            
            Photo_full *photo = [[Photo_full alloc] initWithJSONDictionary:attributes];
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
