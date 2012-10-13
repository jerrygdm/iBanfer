//
//  Config.m
//  MatchTrackerDataModel
//
//  Created by andrea fanfani on 04/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Config.h"

NSString * const ApplicationSettingsPlistName = @"ApplicationSettings.plist";

@interface  Config() 

@property (nonatomic, strong) NSDictionary *localSettings;
-(id) initWithLocalSettings;

@end

@implementation Config

@synthesize localSettings;

+ (Config *)sharedClient {
    static Config *_sharedClient = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedClient = [[self alloc] initWithLocalSettings];
    });
    
    return _sharedClient;
}

-(id) initWithLocalSettings {
    self = [super init];
    if (!self)  {
        
        return nil;
    }
    NSString *path = [[NSBundle mainBundle] pathForResource:ApplicationSettingsPlistName ofType:@"plist"];
    NSDictionary *aSettings = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.localSettings = aSettings;
    
    return self;
}

-(NSString *)returnConfigParamForKey:(NSString *)key {
    if ([self.localSettings objectForKey:key]) {
        return [self.localSettings objectForKey:key];
    }
    return nil;
}
    

/*
- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    return self;
}

+ (void)dataWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters block:(void (^)(NSArray *results))block {
    
    NSDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:parameters];
    
    [[AFConfigAPIClient sharedClient] getPath:urlString parameters:mutableParameters success:^(__unused AFHTTPRequestOperation *operation, id JSON) {
        NSMutableArray *mutableRecords = [NSMutableArray array];
        for (NSDictionary *attributes in [JSON valueForKeyPath:@"competition_list"]){ 
            
            AllTeamsCompetition *competition = [[AllTeamsCompetition alloc] initWithJSONDictionary:attributes];
            [mutableRecords addObject:competition];
        }     
        
        if (block) {
            block(mutableRecords);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error connection %@", [error description]);
        if (block) {
            block([NSArray array]);
        }
    }];
}

*/


@end