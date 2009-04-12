//
//  PageViewAppDelegate.h
//  PageView
//
//  Created by Antonio Cabezuelo Vivo on 24/03/09.
//  Copyright Taps and Swipes 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PageViewViewController;

@interface PageViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PageViewViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PageViewViewController *viewController;

@end

