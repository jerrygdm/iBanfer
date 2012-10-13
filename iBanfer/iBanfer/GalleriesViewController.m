//
//  GalleryTableViewController.m
//  iBanfer
//
//  Created by Jerry on 27/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "GalleriesViewController.h"
#import "Gallery.h"
#import "GalleriesDataModel.h"
#import "UIImageView+AFNetworking.h"
#import "ThumbsViewControllerViewController.h"
#import "KTPhotoBrowserDataSource.h"
#import "KTThumbsViewController.h"
#import "PhotoDataSource.h"

@interface GalleriesViewController ()

-(void) loadDataModel;

@end
@implementation GalleriesViewController
@synthesize myTableView;
@synthesize nibLoadedCell;
@synthesize objects;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = NSLocalizedString(@"Gallery", @"Gallery");
		self.tabBarItem.image = [UIImage imageNamed:@"Gallery"];
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

- (void)viewDidLoad
{
    [super viewDidLoad];

	[self loadDataModel];
	
	myTableView.backgroundColor = [UIColor clearColor];
	myTableView.opaque = NO;
	myTableView.backgroundView = nil;
	myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	
	// Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void) loadDataModel {
	//carica il data model dei team
	[GalleriesDataModel dataWithURLString:@"/mobile/galleries/galleries.json" parameters:nil block:^(NSArray *results) {
		self.objects = results;
		NSLog(@"valore di results che ricevo %@", [results description]);
		[self.myTableView reloadData];
	}];
}

	
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
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
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return YES;
}

#pragma mark - UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
		NSLog(@"NUM GALL: %d",[self.objects count]);
		return [self.objects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"galleryCellIdentifier";
	GalleryCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil) {
		[[NSBundle mainBundle] loadNibNamed:@"GalleryCell" owner:self options:nil];
		cell = nibLoadedCell;
		self.nibLoadedCell = nil;
    }
	
	// background view
	cell.backgroundView = nil;
	UIView *bgView = [[UIView alloc] initWithFrame:cell.bounds];
	if (indexPath.row %2 != 0) {
		bgView.backgroundColor = [UIColor colorWithRed:28.0/255.0 green:28.0/255.0 blue:29.0/255.0 alpha:1.0];
	}
	else {
		bgView.backgroundColor = [UIColor colorWithRed:39.0/255.0 green:39.0/255.0 blue:40.0/255.0 alpha:1.0];
	}
	cell.backgroundView = bgView;
	
	// accessory view
	UIView *accessory = [[UIView alloc] initWithFrame:CGRectMake(290.0, 20.0, 16.0, 23.0)];
	UIImageView *imgArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
	[accessory addSubview:imgArrow];
	cell.accessoryView = accessory;
	
	Gallery *gallery = [self.objects objectAtIndex:indexPath.row];
	cell.galleryName.text = gallery.name;
	NSURL *galleryUrl = [NSURL URLWithString:gallery.thumbnail];
	[cell.galleryImage setImageWithURL:galleryUrl placeholderImage:nil];
	

	
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate
//- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//	
//	if (indexPath.row %2 == 0) {
//		cell.backgroundView.backgroundColor = [UIColor blackColor];
//	}
//	else {
//		cell.backgroundView.backgroundColor = [UIColor darkGrayColor];
//	}
//}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 67;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.

	Gallery *galleryselected = [self.objects objectAtIndex:indexPath.row];
	
	ThumbsViewControllerViewController *thumbController = [[ThumbsViewControllerViewController alloc] initWithgallery:galleryselected.url];
	
	[self.navigationController pushViewController:thumbController animated:YES];
		
	[myTableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end