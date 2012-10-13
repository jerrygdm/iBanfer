//
//  GalleryCell.m
//  iBanfer
//
//  Created by Jerry on 27/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "GalleryCell.h"

@implementation GalleryCell
@synthesize backgroundCellView;
@synthesize galleryName;
@synthesize galleryImage;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void) awakeFromNib {
	/*
	self.galleryName.textColor = [UIColor whiteColor];
	self.numberOfPhotosInGallery.textColor = [UIColor whiteColor];
	self.backgroundColor = [UIColor blackColor];
	self.backgroundView.backgroundColor = [UIColor blackColor];*/
}

- (void)prepareForReuse
{	
	galleryImage.image = nil;
}


@end
