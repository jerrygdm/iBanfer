//
//  Created by Cocoa JSON Editor
//  http://www.cocoajsoneditor.com
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

// Import
#import "Photo_full.h"

//
// 
@implementation Photo_full

// JSON Properties
@synthesize caption;
@synthesize urlMedium;
@synthesize urlSmall;
@synthesize urlThumb;
@synthesize urlLarge;
@synthesize width;
@synthesize height;

// 

- (void) dealloc
{
	// JSON properties
	[caption release];
	[urlMedium release];
	[urlSmall release];
	[urlThumb release];
	[urlLarge release];
	[width release];
	[height release];

	// 
	
	[super dealloc];
}

- (id) initWithJSONDictionary:(NSDictionary *)dic
{
	if(self = [super init])
	{
		[self parseJSONDictionary:dic];
	}
	
	return self;
}

- (void) parseJSONDictionary:(NSDictionary *)dic
{
	// PARSER
	id caption_ = [dic objectForKey:@"caption"];
	if([caption_ isKindOfClass:[NSString class]])
	{
		self.caption = caption_;
	}

	id urlMedium_ = [dic objectForKey:@"urlMedium"];
	if([urlMedium_ isKindOfClass:[NSString class]])
	{
		self.urlMedium = urlMedium_;
	}

	id urlSmall_ = [dic objectForKey:@"urlSmall"];
	if([urlSmall_ isKindOfClass:[NSString class]])
	{
		self.urlSmall = urlSmall_;
	}

	id urlThumb_ = [dic objectForKey:@"urlThumb"];
	if([urlThumb_ isKindOfClass:[NSString class]])
	{
		self.urlThumb = urlThumb_;
	}

	id urlLarge_ = [dic objectForKey:@"urlLarge"];
	if([urlLarge_ isKindOfClass:[NSString class]])
	{
		self.urlLarge = urlLarge_;
	}

	id width_ = [dic objectForKey:@"width"];
	if([width_ isKindOfClass:[NSNumber class]])
	{
		self.width = width_;
	}

	id height_ = [dic objectForKey:@"height"];
	if([height_ isKindOfClass:[NSNumber class]])
	{
		self.height = height_;
	}


	
}

@end
