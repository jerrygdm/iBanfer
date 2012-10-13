//
//  HomeViewController.h
//  iBanfer
//
//  Created by Dal Maistro Gianmaria on 16/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSAnimatedImagesView.h"

#define POTW @"http://www.ibanfer.com/mobile/POTW/potw.json"

@interface HomeViewController : UIViewController <JSAnimatedImagesViewDelegate>


@property (nonatomic, strong) NSArray *objects;
@property (nonatomic, weak) IBOutlet UIView *containerView;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
