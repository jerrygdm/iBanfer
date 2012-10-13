//
//  FlickrViewController.m
//  iBanfer
//
//  Created by Dal Maistro Gianmaria on 19/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "FlickrViewController.h"
#import "SimpleFlickrAPI.h"
#import "FlickrViewCell.h"
#import "FlickrAlbumViewController.h"
#import "UIImageView+AFNetworking.h"

@interface FlickrViewController ()
@property (nonatomic, weak) IBOutlet UITableView *listTableView;
@property (nonatomic, strong) NSArray *photoSets;
@property (nonatomic, weak) IBOutlet FlickrViewCell *nibLoadedFlickrCell;

@end
@implementation FlickrViewController
@synthesize listTableView;
@synthesize photoSets;
@synthesize nibLoadedFlickrCell;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.title = NSLocalizedString(@"Flickr", @"Flickr iBanfer Photos");
		self.tabBarItem.image = [UIImage imageNamed:@"Ballon"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

	listTableView.backgroundColor = [UIColor clearColor];
	listTableView.opaque = NO;
	listTableView.backgroundView = nil;
	listTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	
	SimpleFlickrAPI *flickr = [[SimpleFlickrAPI alloc] init];
	NSString *userId = [flickr userIdForUsername:@"iBanfer"];
	photoSets = [flickr photoSetListWithUserId:userId];

	NSLog(@"PHOTOS__________%@",[photoSets description]);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
	self.photoSets = nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
	NSLog(@"NUM GALL: %d",[photoSets count]);
	return [photoSets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"flickrCellIdentifier";
	FlickrViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil) {
		[[NSBundle mainBundle] loadNibNamed:@"FlickrViewCell" owner:self options:nil];
		cell = nibLoadedFlickrCell;
		self.nibLoadedFlickrCell = nil;
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
	
	// per il titolo
	NSDictionary *dictForTitle = [[self.photoSets objectAtIndex:indexPath.row] objectForKey:@"title"];
	NSString *title = [dictForTitle objectForKey:@"_content"];
	// per l'immagine
	NSDictionary *dictForDesc = [[self.photoSets objectAtIndex:indexPath.row] objectForKey:@"description"];
	NSString *description = [dictForDesc objectForKey:@"_content"];
	NSString *numPhotos = [[self.photoSets objectAtIndex:indexPath.row] objectForKey:@"photos"];
	
	cell.galleryLabel.text = title;
	cell.descriptionLabel.text = description;
	cell.numPhotosLabel.text = [NSString stringWithFormat:@"(%@)",numPhotos];
	
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
	NSDictionary *dictForTitle = [[self.photoSets objectAtIndex:indexPath.row] objectForKey:@"title"];
	NSString *title = [dictForTitle objectForKey:@"_content"];
	
	FlickrAlbumViewController *album = [[FlickrAlbumViewController alloc] init];
	album.titleForSet = title;
	[self.navigationController pushViewController:album animated:YES];
	[self.listTableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
