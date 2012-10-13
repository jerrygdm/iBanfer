//
//  PhotoDataSource.m
//  iBanfer
//
//  Created by Dal Maistro Gianmaria on 04/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhotoDataSource.h"
#import "Photo_full.h"
#import "KTPhotoView+SDWebImage.h"
#import "KTThumbView+SDWebImage.h"

@implementation PhotoDataSource
@synthesize images;

- (id)init
{
    self = [super init];
    if (self) {
        images = [[NSArray alloc] init];
    }
    return self;
}

#pragma mark -
#pragma mark KTPhotoBrowserDataSource

- (NSInteger)numberOfPhotos {
	NSInteger count = [self.images count];
	return count;
}

- (void)imageAtIndex:(NSInteger)index photoView:(KTPhotoView *)photoView {
	Photo_full *imageUrls = [self.images objectAtIndex:index];
	NSString *url = imageUrls.urlLarge;
	[photoView setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"photoDefault.png"]];
}

- (void)thumbImageAtIndex:(NSInteger)index thumbView:(KTThumbView *)thumbView {
	Photo_full *imageUrls = [self.images objectAtIndex:index];
	NSString *url = imageUrls.urlSmall;
	[thumbView setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"photoDefault.png"]];
}

- (CGSize)thumbSize {
	return CGSizeMake(200.0, 200.0);
}

- (NSInteger)thumbsPerRow {
	return 4;
}

- (BOOL)thumbsHaveBorder {
	return NO;
}
- (UIColor *)imageBackgroundColor {
	return [UIColor blackColor];
}

@end
