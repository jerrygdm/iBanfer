//
//  Config.h
//  MatchTrackerDataModel
//
//  Created by andrea fanfani on 04/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define BASE_URL_TEST @"http://cdnumobo.dev.uefa3u.deltatre.com/"

@interface Config : NSObject
+ (Config *)sharedClient;



-(NSString *) returnConfigParamForKey:(NSString *)key;


@end
