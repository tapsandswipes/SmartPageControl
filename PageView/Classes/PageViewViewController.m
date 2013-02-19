//
//  PageViewViewController.m
//  PageView
//
//  Created by Antonio Cabezuelo Vivo on 24/03/09.
//  Copyright Taps and Swipes 2009. All rights reserved.
//

#import "PageViewViewController.h"
#import "PageView.h"

@implementation PageViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self.pageView addView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img1.jpg"]] forPage:0];
	[self.pageView addView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img2.jpg"]] forPage:1];
	[self.pageView addView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img3.jpg"]] forPage:2];
	[self.pageView addView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img1.jpg"]] forPage:3];
	[self.pageView addView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img2.jpg"]] forPage:4];
	[self.pageView addView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img3.jpg"]] forPage:5];
}

@end
