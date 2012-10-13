//
//  ThumbsViewControllerViewController.h
//  iBanfer
//
//  Created by Dal Maistro Gianmaria on 04/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KTThumbsViewController.h"
#import "KTPhotoView+SDWebImage.h"
#import "KTThumbView+SDWebImage.h"

#define FULL_SIZE_INDEX 0
#define THUMBNAIL_INDEX 1

@interface ThumbsViewControllerViewController : KTThumbsViewController

-(id) initWithgallery:(NSString *) aGallery;
@end
