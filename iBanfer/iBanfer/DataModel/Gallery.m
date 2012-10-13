//
//  Created by Cocoa JSON Editor
//  http://www.cocoajsoneditor.com
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

// Import
#import "Gallery.h"

//
// 
@implementation Gallery

// JSON Properties
@synthesize name;
@synthesize url;
@synthesize thumbnail;
@synthesize section;

// 

- (void) dealloc
{
	// JSON properties
	[name release];
	[url release];
	[thumbnail release];
	[section release];

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
	id name_ = [dic objectForKey:@"name"];
	if([name_ isKindOfClass:[NSString class]])
	{
		self.name = name_;
	}

	id url_ = [dic objectForKey:@"url"];
	if([url_ isKindOfClass:[NSString class]])
	{
		self.url = url_;
	}

	id thumbnail_ = [dic objectForKey:@"thumbnail"];
	if([thumbnail_ isKindOfClass:[NSString class]])
	{
		self.thumbnail = thumbnail_;
	}

	id section_ = [dic objectForKey:@"section"];
	if([section_ isKindOfClass:[NSString class]])
	{
		self.section = section_;
	}


	
}

@end
