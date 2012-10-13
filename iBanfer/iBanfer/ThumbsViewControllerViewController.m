//
//  ThumbsViewControllerViewController.m
//  iBanfer
//
//  Created by Dal Maistro Gianmaria on 04/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ThumbsViewControllerViewController.h"
#import "Photo_full.h"
#import "PhotosDataModel.h"
#import "PhotoDataSource.h"
#import "KTPhotoBrowserDataSource.h"

@interface ThumbsViewControllerViewController ()
@property (nonatomic, strong) NSArray *objects;
@property (nonatomic, strong) NSString *gallerySelected;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndiecator;
@property (nonatomic, strong) PhotoDataSource *photoDS;

-(void) loadDataModel;
-(void) loadDataSource;
@end


@implementation ThumbsViewControllerViewController
@synthesize objects;
@synthesize gallerySelected;
@synthesize activityIndiecator;
@synthesize photoDS;

-(id) initWithgallery:(NSString *)aGallery; {
	self = [super init];
	if (self) {
		gallerySelected = aGallery;
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	[self loadDataModel];
	self.view.backgroundColor = [UIColor blackColor];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return ((interfaceOrientation == UIInterfaceOrientationPortrait) || (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (interfaceOrientation == UIInterfaceOrientationLandscapeRight));
}

-(void) loadDataModel {
	//carica il data model delle gallery
	[PhotosDataModel dataWithURLString:self.gallerySelected parameters:nil block:^(NSArray *results) {
		self.objects = results;
		NSLog(@"valore di results che ricevo %@", [results description]);
		[self loadDataSource];
		[self setDataSource:photoDS];
	}];
}

-(void) loadDataSource {
	photoDS = [[PhotoDataSource alloc] init];
	photoDS.images = self.objects;
}


#pragma mark -
#pragma mark Activity Indicator

- (UIActivityIndicatorView *)activityIndicator 
{
	if (activityIndiecator) {
		return activityIndiecator;
	}
	
	activityIndiecator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
	CGPoint center = [[self view] center];
	[activityIndiecator setCenter:center];
	[activityIndiecator setHidesWhenStopped:YES];
	[activityIndiecator startAnimating];
	[[self view] addSubview:activityIndiecator];
	
	return activityIndiecator;
}

- (void)showActivityIndicator 
{
	[[self activityIndicator] startAnimating];
}

- (void)hideActivityIndicator 
{
	[[self activityIndicator] stopAnimating];
}

@end
