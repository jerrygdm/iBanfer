//
//  GalleryTableViewController.h
//  iBanfer
//
//  Created by Jerry on 27/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GalleryCell.h"
#import "GridViewCell.h"

#define GALLERY_URL @"http://www.ibanfer.com/mobile/galleries/galleries.json"

@interface GalleriesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
	UINib *cellLoader;
}
@property (nonatomic, strong) NSArray *objects;
@property (nonatomic, strong) IBOutlet UITableView *myTableView;
@property (nonatomic, weak) IBOutlet GalleryCell *nibLoadedCell;

@end
