//
//  Created by Cocoa JSON Editor
//  http://www.cocoajsoneditor.com
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface Photo_full : NSObject
{
	// -----------------------------------------------------------------------------
	// JSON Properties 
	// -----------------------------------------------------------------------------
	NSString *caption;
	NSString *urlMedium;
	NSString *urlSmall;
	NSString *urlThumb;
	NSString *urlLarge;
	NSDecimalNumber *width;
	NSDecimalNumber *height;

	// -----------------------------------------------------------------------------
	// 
	// -----------------------------------------------------------------------------

}
// JSON Properties
@property (nonatomic, retain) NSString *caption;
@property (nonatomic, retain) NSString *urlMedium;
@property (nonatomic, retain) NSString *urlSmall;
@property (nonatomic, retain) NSString *urlThumb;
@property (nonatomic, retain) NSString *urlLarge;
@property (nonatomic, retain) NSDecimalNumber *width;
@property (nonatomic, retain) NSDecimalNumber *height;

// 

- (id) initWithJSONDictionary:(NSDictionary *)dic;
- (void) parseJSONDictionary:(NSDictionary *)dic;


@end
