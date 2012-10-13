//
//  iBanferBrowser.m
//  iBanfer
//
//  Created by Jerry on 26/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "iBanferBrowser.h"

@implementation iBanferBrowser
@synthesize webView;
@synthesize stringUrl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor blackColor];
	CGRect webFrame = [[UIScreen mainScreen] applicationFrame];
	firstLoad = YES;
	webView = [[UIWebView alloc] initWithFrame:webFrame];
	webView.backgroundColor = [UIColor blackColor];
	webView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	webView.scalesPageToFit = YES;
	webView.autoresizesSubviews = YES;
	
    webView.delegate = self;
    webView.alpha = 0.0;
	NSString *urlAddress = self.stringUrl;
	NSURL *url = [NSURL URLWithString:urlAddress];
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];

	[self.view addSubview:self.webView];
	[self.webView loadRequest:requestObj];

}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
	if (firstLoad) {
		firstLoad = NO;
		[UIView beginAnimations:@"webView	" context:nil];
		self.webView.alpha = 1.0;
		[UIView commitAnimations];
    }
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
