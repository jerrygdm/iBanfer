//
//  GalleryCell.h
//  iBanfer
//
//  Created by Jerry on 27/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GalleryCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *galleryName;
@property (nonatomic, weak) IBOutlet UIImageView *galleryImage;
@property (nonatomic, weak) IBOutlet UIView *backgroundCellView;

@end
