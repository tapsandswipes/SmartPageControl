//
//  PageViewAppDelegate.h
//  PageView
//
//  Created by Antonio Cabezuelo Vivo on 24/03/09.
//  Copyright Taps and Swipes 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PageViewViewController;

@interface PageViewAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet PageViewViewController *viewController;

@end

