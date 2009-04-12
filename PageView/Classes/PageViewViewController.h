//
//  PageViewViewController.h
//  PageView
//
//  Created by Antonio Cabezuelo Vivo on 24/03/09.
//  Copyright Taps and Swipes 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PageView;

@interface PageViewViewController : UIViewController {
	PageView *pageView;
}

@property (nonatomic, retain) IBOutlet PageView *pageView;

@end

