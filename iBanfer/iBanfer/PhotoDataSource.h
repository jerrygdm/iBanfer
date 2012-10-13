//
//  PhotoDataSource.h
//  iBanfer
//
//  Created by Dal Maistro Gianmaria on 04/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KTPhotoBrowserDataSource.h"

@interface PhotoDataSource : NSObject <KTPhotoBrowserDataSource>
@property (nonatomic, strong) NSArray *images;

@end
