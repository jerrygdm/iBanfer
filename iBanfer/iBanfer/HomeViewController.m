//
//  FirstViewController.m
//  iBanfer
//
//  Created by Dal Maistro Gianmaria on 16/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "HomeViewController.h"
#import "PotwDataModel.h"
#import "Photo.h"

#import "UIImageView+AFNetworking.h"

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet JSAnimatedImagesView *animatedImagesView;
-(void) loadDataModel;
-(void) setDelegateForAnimation;
@end

@implementation HomeViewController
@synthesize containerView;
@synthesize activityIndicator;
@synthesize objects;
@synthesize animatedImagesView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = NSLocalizedString(@"Home", @"Photo Of The Week");
		self.tabBarItem.image = [UIImage imageNamed:@"Home"];
    }
    return self;
}
							
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	[self loadDataModel];
	//self.animatedImagesView.delegate = self;
	
//	
//	datamodel = [[PhotosOfTheWeek alloc] initWithUrlPath:POTW];
//	datamodel.delegate = self;
//	datamodel.didFinishSelector = @selector(modelDidFinishLoad);
}

-(void) loadDataModel {
	//carica il data model dei team
	[PotwDataModel dataWithURLString:@"/mobile/POTW/potw.json" parameters:nil block:^(NSArray *results) {
		self.objects = results;
		NSLog(@"valore di results che ricevo %@", [results description]);
		[self setDelegateForAnimation];
	}];
}

//-(void) modelDidFinishLoad
//{
//	if (self.datamodel && [self.datamodel.elements count]>0) {
//		
//		[activityIndicator stopAnimating];
//		CGRect imgFrame = self.containerView.bounds;
//		UIImageView *photo = [[UIImageView alloc] initWithFrame:imgFrame];
//
//		NSMutableArray *arrayPhoto = [[NSMutableArray alloc]init];
//		for (Potw *potw in self.datamodel.elements) {
//			
//			NSString *photoString = potw.urlBig;
//			NSURL *url = [NSURL URLWithString:photoString];
//			NSData *img = [NSData dataWithContentsOfURL:url];
//			[arrayPhoto addObject:[UIImage imageWithData:img]];
//		}
//		
//		[photo setAnimationImages:arrayPhoto];
//		[photo setAnimationDuration:2.0f];
//		[photo setAnimationRepeatCount:0];
//		
//		[photo startAnimating];
//		[self.containerView addSubview:photo];
//	}
//}

- (void)viewDidUnload
{
    [super viewDidUnload];
	self.animatedImagesView = nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
	[activityIndicator startAnimating];
	if (!self.objects)
	{
		[self loadDataModel];
	}
	else {
		[self.animatedImagesView startAnimating];
	}
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
	[self.animatedImagesView stopAnimating];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
	    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
	} else {
	    return YES;
	}
}

#pragma mark - JSAnimatedImagesViewDelegate Methods

- (NSUInteger)animatedImagesNumberOfImages:(JSAnimatedImagesView *)animatedImagesView
{
	NSLog(@"COUNT %d",[self.objects count]);
    if (self.objects)
	{
		return [self.objects count];
	}
	return 0;
}

- (UIImage *)animatedImagesView:(JSAnimatedImagesView *)animatedImagesView imageAtIndex:(NSUInteger)index
{
	Photo *photo = [self.objects objectAtIndex:index];
	UIImageView *aimgView = [[UIImageView alloc] initWithFrame:self.animatedImagesView.bounds];
	[aimgView setImageWithURL:[NSURL URLWithString:photo.urlBig] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
	return aimgView.image;
}


#pragma mark 
#pragma METODI PRIVATI

-(void) setDelegateForAnimation
{
	self.animatedImagesView.delegate = self;
	[self.animatedImagesView startAnimating];
}

//-(void)performTransition
//{
//	// First create a CATransition object to describe the transition
//	CATransition *transition = [CATransition animation];
//	// Animate over 3/4 of a second
//	transition.duration = 0.75;
//	// using the ease in/out timing function
//	transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//	
//	// Now to set the type of transition. Since we need to choose at random, we'll setup a couple of arrays to help us.
//	NSString *types[4] = {kCATransitionMoveIn, kCATransitionPush, kCATransitionReveal, kCATransitionFade};
//	NSString *subtypes[4] = {kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom};
//	int rnd = random() % 4;
//	transition.type = types[rnd];
//	if(rnd < 3) // if we didn't pick the fade transition, then we need to set a subtype too
//	{
//		transition.subtype = subtypes[random() % 4];
//	}
//	
//	// Finally, to avoid overlapping transitions we assign ourselves as the delegate for the animation and wait for the
//	// -animationDidStop:finished: message. When it comes in, we will flag that we are no longer transitioning.
//	transitioning = YES;
//	transition.delegate = self;
//	
//	// Next add it to the containerView's layer. This will perform the transition based on how we change its contents.
//	[containerView.layer addAnimation:transition forKey:nil];
//	
//	// Here we hide view1, and show view2, which will cause Core Animation to animate view1 away and view2 in.
//	int counter = 0;
//	for (UIImageView *photo in self.containerView) {
//		if (currentPhoto == counter) {
//			photo.hidden = YES;
//		}
//		counter++;
//	}
//
//	
//	// And so that we will continue to swap between our two images, we swap the instance variables referencing them.
//	/*UIImageView *tmp = potwImage2;
//	potwImage2 = potwImage1;
//	potwImage1 = tmp;*/
//}
//
//-(void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag
//{
//	transitioning = NO;
//}
//
//-(void)nextTransition
//{
//	if(!transitioning)
//	{
//		[self performTransition];
//	}
//}
//
//-(void)updateTimer:(NSTimer *)theTimer
//{
//	[self nextTransition];
//}

@end
