//
//  FlickrAlbumViewController.m
//  iBanfer
//
//  Created by Dal Maistro Gianmaria on 10/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FlickrAlbumViewController.h"
#import "FlickrPhotosDataSource.h"

@interface FlickrAlbumViewController ()
@property (nonatomic, retain) UIActivityIndicatorView *activityIndicator;
- (FlickrPhotosDataSource *)photos;
@end

@implementation FlickrAlbumViewController

@synthesize activityIndicator = activityIndicator_;
@synthesize titleForSet;

- (void)dealloc
{
	photos_ = nil;
	activityIndicator_ = nil;
}

- (void)viewDidLoad 
{
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor blackColor];
	UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
	[activityIndicator setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin];
	[activityIndicator setCenter:[[self view] center]];
	[activityIndicator startAnimating];
	[self setActivityIndicator:activityIndicator];
	
	[[self view] addSubview:[self activityIndicator]];
	
	// Label back button as "Back".
	UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Back", @"Back button title") style:UIBarButtonItemStylePlain target:nil action:nil];
	[[self navigationItem] setBackBarButtonItem:backButton];

	if (!self.titleForSet) {
		self.titleForSet = [[NSString alloc] init];
	}
}

- (void)viewDidAppear:(BOOL)animated
{
	[self setDataSource:[self photos]];
	[self setTitle:[NSString stringWithFormat:@"%i Photos", [[self photos] numberOfPhotos]]];
	[[self activityIndicator] stopAnimating];
}

- (FlickrPhotosDataSource *)photos
{
	if (photos_) {
		return photos_;
	}
	
	photos_ = [[FlickrPhotosDataSource alloc] init];
	photos_.titleForPhotoSet = self.titleForSet;
	[photos_ fetchPhotos];
	
	return photos_;
}


@end


