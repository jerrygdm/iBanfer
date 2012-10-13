//
//  Created by Cocoa JSON Editor
//  http://www.cocoajsoneditor.com
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface Photo : NSObject
{
	// -----------------------------------------------------------------------------
	// JSON Properties 
	// -----------------------------------------------------------------------------
	NSString *url;
	NSString *urlBig;

	// -----------------------------------------------------------------------------
	// 
	// -----------------------------------------------------------------------------

}
// JSON Properties
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *urlBig;

// 

- (id) initWithJSONDictionary:(NSDictionary *)dic;
- (void) parseJSONDictionary:(NSDictionary *)dic;


@end
