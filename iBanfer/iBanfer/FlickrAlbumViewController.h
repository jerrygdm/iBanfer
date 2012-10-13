//
//  FlickrAlbumViewController.h
//  iBanfer
//
//  Created by Dal Maistro Gianmaria on 10/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "KTThumbsViewController.h"

@class FlickrPhotosDataSource;

@interface FlickrAlbumViewController : KTThumbsViewController 
{
@private
	FlickrPhotosDataSource *photos_;
}
@property (nonatomic, strong) NSString *titleForSet;

@end
