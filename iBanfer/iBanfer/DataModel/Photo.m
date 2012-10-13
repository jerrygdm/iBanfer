//
//  Created by Cocoa JSON Editor
//  http://www.cocoajsoneditor.com
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

// Import
#import "Photo.h"

//
// 
@implementation Photo

// JSON Properties
@synthesize url;
@synthesize urlBig;

// 

- (void) dealloc
{
	// JSON properties
	[url release];
	[urlBig release];

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
	id url_ = [dic objectForKey:@"url"];
	if([url_ isKindOfClass:[NSString class]])
	{
		self.url = url_;
	}

	id urlBig_ = [dic objectForKey:@"urlBig"];
	if([urlBig_ isKindOfClass:[NSString class]])
	{
		self.urlBig = urlBig_;
	}


	
}

@end
