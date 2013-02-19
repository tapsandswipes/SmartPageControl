//
//  PageViewAppDelegate.m
//  PageView
//
//  Created by Antonio Cabezuelo Vivo on 24/03/09.
//  Copyright Taps and Swipes 2009. All rights reserved.
//

#import "PageViewAppDelegate.h"
#import "PageViewViewController.h"

@implementation PageViewAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
