//
//  SmartPageControl.m
//  PageView
//
//  Created by Antonio Cabezuelo Vivo on 24/03/09.
//  Copyright 2009 Taps and Swipes. All rights reserved.
//

#import "SmartPageControl.h"

@implementation SmartPageControl {
	CGFloat startPosition;
	BOOL dragging;
}

#define PAGE_INDICATORS_SEP 16.0f

- (NSInteger)pageForLocation:(CGFloat)loc {
    CGFloat midX = CGRectGetMidX(self.frame);
    CGFloat mid = self.numberOfPages / 2;
    
    CGFloat left = midX - PAGE_INDICATORS_SEP * mid;
    CGFloat right = midX + PAGE_INDICATORS_SEP * mid;
    
    CGFloat pointX = MIN(right, MAX(left, loc)) - left;
    
    return MIN(floorf(pointX / PAGE_INDICATORS_SEP), self.numberOfPages-1);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	startPosition = [touch locationInView:self].x;
	[super touchesBegan:touches withEvent:event];
    [self performSelector:@selector(longTap) withObject:nil afterDelay:0.5];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(longTap) object:nil];

	dragging = YES;
	UITouch *touch = [touches anyObject];
	CGPoint location = [touch locationInView:self];
    
    NSInteger page = [self pageForLocation:location.x];
    if (page != self.currentPage) {
        self.currentPage = page;
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(longTap) object:nil];

	if (!dragging) {
		[super touchesEnded:touches withEvent:event];
	}
	dragging = NO;
}


- (void)longTap {
    NSInteger page = [self pageForLocation:startPosition];
    
    if (self.currentPage != page) {
        self.currentPage = page;
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

@end
