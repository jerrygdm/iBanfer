//
//  GalleriesDataModel.h
//  iBanferDataModel
//
//  Created by Dal Maistro Gianmaria on 04/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GalleriesDataModel : NSObject
+ (void)dataWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters block:(void (^)(NSArray *results))block;

@end
