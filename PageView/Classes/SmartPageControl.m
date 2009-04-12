//
//  SmartPageControl.m
//  PageView
//
//  Created by Antonio Cabezuelo Vivo on 24/03/09.
//  Copyright 2009 Taps and Swipes. All rights reserved.
//

#import "SmartPageControl.h"

@interface SmartPageControl ()

@property (nonatomic, retain) NSTimer *timer;

- (void) timerFired:(NSTimer *)theTimer;

@end

@implementation SmartPageControl

@synthesize timer;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	startPosition = [touch locationInView:self].x;
	[super touchesBegan:touches withEvent:event];
	self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(timerFired:) userInfo:nil repeats:NO];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	if ([timer isValid]) {
		[timer invalidate];
	}
	dragging = YES;
	UITouch *touch = [touches anyObject];
	CGPoint location = [touch locationInView:self];
	if ((startPosition < (self.bounds.size.width / 2.0f) && location.x > startPosition) || 
		(startPosition > (self.bounds.size.width / 2.0f) && location.x < startPosition)) {
		CGFloat treshold = 2.0f * [self sizeForNumberOfPages:self.numberOfPages].width / self.numberOfPages;
		CGFloat distance = location.x - startPosition;
		NSInteger page = abs(distance / treshold);
		if (distance < 0)
			page = self.numberOfPages - 1 - page;
		if (page != self.currentPage) {
			self.currentPage = page;
			[self sendActionsForControlEvents:UIControlEventValueChanged];
		}
	}
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	if ([timer isValid]) {
		[timer invalidate];
	}
	if (!dragging) {
		[super touchesEnded:touches withEvent:event];
	}
	dragging = NO;
}


- (void) timerFired:(NSTimer *)theTimer {
	if (startPosition < self.bounds.size.width / 2.0f) {
		self.currentPage = 0;
	} else {
		self.currentPage = self.numberOfPages - 1;
	}
	[self sendActionsForControlEvents:UIControlEventValueChanged];
}

@end
