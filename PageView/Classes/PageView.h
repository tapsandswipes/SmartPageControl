//
//  PageView.h
//  PageView
//
//  Created by Antonio Cabezuelo Vivo on 24/03/09.
//  Copyright 2009 Taps and Swipes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageView : UIView <UIScrollViewDelegate>

@property (nonatomic, assign) NSInteger numberOfPages;

- (void)addView:(UIView *)view forPage:(NSInteger)page;

@end
