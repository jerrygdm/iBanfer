//
//  AppDelegate.m
//  iBanfer
//
//  Created by Dal Maistro Gianmaria on 16/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "GalleriesViewController.h"
#import "FlickrViewController.h"
#import "ContactViewController.h"
#import "SDURLCache.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:NO];
	[[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleBlackTranslucent];
	
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
	UIViewController *home, *gallery, *flickr, *contact;
	UINavigationController *homeNav, *galleryNav, *flickrNav, *contactNav;
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
	    home = [[HomeViewController alloc] initWithNibName:@"HomeViewController_iPhone" bundle:nil];
		homeNav = [[UINavigationController alloc] initWithRootViewController:home];
		homeNav.navigationBar.barStyle = UIBarStyleBlack;
	    gallery = [[GalleriesViewController alloc] initWithNibName:@"GalleriesViewController_iPhone" bundle:nil];
		galleryNav = [[UINavigationController alloc] initWithRootViewController:gallery];
		galleryNav.navigationBar.barStyle = UIBarStyleBlack;
		flickr = [[FlickrViewController alloc] initWithNibName:@"FlickrViewController_iPhone" bundle:nil];
		flickrNav = [[UINavigationController alloc] initWithRootViewController:flickr];
		flickrNav.navigationBar.barStyle = UIBarStyleBlack;
		contact = [[ContactViewController alloc] initWithNibName:@"ContactViewController_iPhone" bundle:nil];
		contactNav = [[UINavigationController alloc] initWithRootViewController:contact];
		contactNav.navigationBar.barStyle = UIBarStyleBlack;
	} else {
		// IPAD
	}
	SDURLCache *urlCache = [[SDURLCache alloc] initWithMemoryCapacity:1024*1024   // 1MB mem cache
                                                         diskCapacity:1024*1024*5 // 5MB disk cache
                                                             diskPath:[SDURLCache defaultCachePath]];
    [NSURLCache setSharedURLCache:urlCache];
	
	self.tabBarController = [[UITabBarController alloc] init];
	self.tabBarController.viewControllers = [NSArray arrayWithObjects:homeNav, galleryNav, flickrNav, contactNav, nil];
	self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	/*
	 Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	 Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	 */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	/*
	 Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	 If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	 */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	/*
	 Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	 */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	/*
	 Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	 */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	/*
	 Called when the application is about to terminate.
	 Save data if appropriate.
	 See also applicationDidEnterBackground:.
	 */
}

/*
 // Optional UITabBarControllerDelegate method.
 - (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
 {
 }
 */

/*
 // Optional UITabBarControllerDelegate method.
 - (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
 {
 }
 */

@end
