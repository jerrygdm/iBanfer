//
//  ViewPhoto.h
//  iBanfer
//
//  Created by Dal Maistro Gianmaria on 19/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageView.h"

@interface ViewPhoto : UIViewController
@property (nonatomic, weak) IBOutlet UIView* containerView;
@property (nonatomic, weak) IBOutlet UIScrollView* scrollView;
@property (nonatomic, weak) IBOutlet EGOImageView* imageView;
@property (nonatomic, assign) CGSize imgSize;

@end
