//
//  ContactViewController.m
//  iBanfer
//
//  Created by Dal Maistro Gianmaria on 19/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController () <MFMailComposeViewControllerDelegate>

@property (nonatomic, strong) IBOutlet UIButton *mailButton;
@property (nonatomic, strong) IBOutlet UIButton *webButton;

-(IBAction)sendEmail:(id)sender;
-(IBAction)visitWebSite:(id)sender;
-(IBAction)visitFacebook:(id)sender;
@end
@implementation ContactViewController
@synthesize mailButton;
@synthesize webButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.title = NSLocalizedString(@"Contact", @"Contact");
		self.tabBarItem.image = [UIImage imageNamed:@"ContactMe"];
    }
    return self;
}

// delegate of MFMailcomposer
- (void)mailComposeController:(MFMailComposeViewController*)controller  
          didFinishWithResult:(MFMailComposeResult)result 
                        error:(NSError*)error;
{
	if (result == MFMailComposeResultSent) {
		NSLog(@"It's away!");
	}
	[self dismissModalViewControllerAnimated:YES];
}

-(void)visitWebSite:(id)sender
{
	iBanferBrowser *browser = [[iBanferBrowser alloc] init];
	browser.stringUrl = IBANFER_URL;
	[self.navigationController pushViewController:browser animated:YES];
}

-(void)visitFacebook:(id)sender
{
	iBanferBrowser *browser = [[iBanferBrowser alloc] init];
	browser.stringUrl = IBANFER_FACEBOOK_URL;
	[self.navigationController pushViewController:browser animated:YES];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

}

-(IBAction)sendEmail:(id)sender
{
	MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
	controller.mailComposeDelegate = self;
	[controller setSubject:@"Messaggio inviato da iPhone"];
	[controller setMessageBody:@"" isHTML:NO]; 
	if (controller) [self presentModalViewController:controller animated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
