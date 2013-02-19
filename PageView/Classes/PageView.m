//
//  PageView.m
//  PageView
//
//  Created by Antonio Cabezuelo Vivo on 24/03/09.
//  Copyright 2009 Taps and Swipes. All rights reserved.
//

#import "PageView.h"
#import "SmartPageControl.h"

#define PAGE_CONTORL_HEIGHT 18.0f

@interface PageView ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) SmartPageControl *pageControl;
@end

@implementation PageView {
	BOOL pageControlUsed;
}


@synthesize scrollView, pageControl, numberOfPages;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
		[self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void) awakeFromNib {
	[super awakeFromNib];
	[self setup];
}


- (void) setup {
	pageControlUsed = NO;
	numberOfPages = 0;
	CGRect frame = self.frame;
	CGRect r = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width,	frame.size.height - PAGE_CONTORL_HEIGHT);
	self.scrollView = [[UIScrollView alloc] initWithFrame:r];
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
	self.scrollView.pagingEnabled = YES;
	self.scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * self.numberOfPages, scrollView.frame.size.height);
	self.scrollView.showsHorizontalScrollIndicator = NO;
	self.scrollView.showsVerticalScrollIndicator = NO;
	self.scrollView.scrollsToTop = NO;
	self.scrollView.delegate = self;
	[self addSubview:self.scrollView];
	
	r = CGRectMake(frame.origin.x, frame.origin.y + frame.size.height - PAGE_CONTORL_HEIGHT, frame.size.width,	PAGE_CONTORL_HEIGHT);
	self.pageControl = [[SmartPageControl alloc] initWithFrame:r];
    self.pageControl.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
	self.pageControl.numberOfPages = self.numberOfPages;
	self.pageControl.currentPage = 0;
	[self.pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
	[self addSubview:self.pageControl];
}

- (void) drawRect:(CGRect)rect {
    // Drawing code
}

- (void) setNumberOfPages:(NSInteger)theNumberOfPages {
	if (theNumberOfPages != self.numberOfPages) {
		numberOfPages = theNumberOfPages;
		self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * self.numberOfPages, self.scrollView.frame.size.height);
		self.pageControl.numberOfPages = self.numberOfPages;
	}
}

- (void) addView:(UIView *)view forPage:(NSInteger)page {
	if (nil == view.superview) {
		CGRect frame = self.scrollView.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        view.frame = frame;
        [self.scrollView addSubview:view];
		self.numberOfPages += 1;
	}
}


- (void)scrollViewDidScroll:(UIScrollView *)sender {
    // We don't want a "feedback loop" between the UIPageControl and the scroll delegate in
    // which a scroll event generated from the user hitting the page control triggers updates from
    // the delegate method. We use a boolean to disable the delegate logic when the page control is used.
    if (pageControlUsed) {
        // do nothing - the scroll was initiated from the page control, not the user dragging
        return;
    }
    // Switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}

// At the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    pageControlUsed = NO;
}


- (void) changePage:(id)sender {
	int page = self.pageControl.currentPage;
	CGRect frame = self.scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [UIView animateWithDuration:0.34 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.scrollView.contentOffset = frame.origin;
    } completion:nil];
    // Set the boolean used when scrolls originate from the UIPageControl. See scrollViewDidScroll: above.
    pageControlUsed = YES;
}



@end
