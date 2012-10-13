//
//  FlickrViewCell.h
//  iBanfer
//
//  Created by Dal Maistro Gianmaria on 10/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlickrViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *galleryLabel;
@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, weak) IBOutlet UILabel *numPhotosLabel;

@end
