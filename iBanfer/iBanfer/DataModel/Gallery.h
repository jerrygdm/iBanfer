//
//  Created by Cocoa JSON Editor
//  http://www.cocoajsoneditor.com
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface Gallery : NSObject
{
	// -----------------------------------------------------------------------------
	// JSON Properties 
	// -----------------------------------------------------------------------------
	NSString *name;
	NSString *url;
	NSString *thumbnail;
	NSString *section;

	// -----------------------------------------------------------------------------
	// 
	// -----------------------------------------------------------------------------

}
// JSON Properties
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *thumbnail;
@property (nonatomic, retain) NSString *section;

// 

- (id) initWithJSONDictionary:(NSDictionary *)dic;
- (void) parseJSONDictionary:(NSDictionary *)dic;


@end
