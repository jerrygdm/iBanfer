//
//  iBanferBrowser.h
//  iBanfer
//
//  Created by Jerry on 26/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iBanferBrowser : UIViewController <UIWebViewDelegate>
{
	BOOL firstLoad;
}
@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) NSString *stringUrl;

@end
