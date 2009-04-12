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

@synthesize pageView;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[pageView addView:[[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img1.jpg"]] autorelease] forPage:0];
	[pageView addView:[[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img2.jpg"]] autorelease] forPage:1];
	[pageView addView:[[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img3.jpg"]] autorelease] forPage:2];
	[pageView addView:[[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img1.jpg"]] autorelease] forPage:3];
	[pageView addView:[[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img2.jpg"]] autorelease] forPage:4];
	[pageView addView:[[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img3.jpg"]] autorelease] forPage:5];
	
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
