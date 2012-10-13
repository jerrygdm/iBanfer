//
//  FlickrViewCell.m
//  iBanfer
//
//  Created by Dal Maistro Gianmaria on 10/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FlickrViewCell.h"

@implementation FlickrViewCell
@synthesize galleryLabel;
@synthesize descriptionLabel;
@synthesize numPhotosLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
