//
//  PageView.h
//  PageView
//
//  Created by Antonio Cabezuelo Vivo on 24/03/09.
//  Copyright 2009 Taps and Swipes. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SmartPageControl;

@interface PageView : UIView <UIScrollViewDelegate> {
	UIScrollView *scrollView;
    SmartPageControl *pageControl;
	BOOL pageControlUsed;
	NSInteger numberOfPages;
}

@property (nonatomic) NSInteger numberOfPages;

- (void) addView:(UIView *)view forPage:(NSInteger)page;

@end
