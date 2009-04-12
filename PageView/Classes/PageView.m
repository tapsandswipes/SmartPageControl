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

@property (nonatomic,retain) UIScrollView *scrollView;
@property (nonatomic,retain) SmartPageControl *pageControl;

@end

@interface PageView (ProvateMethods)

- (void) setup;
- (void) changePage:(id)sender;

@end


@implementation PageView

@synthesize scrollView, pageControl, numberOfPages;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
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
	scrollView.pagingEnabled = YES;
	scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * numberOfPages, scrollView.frame.size.height);
	scrollView.showsHorizontalScrollIndicator = NO;
	scrollView.showsVerticalScrollIndicator = NO;
	scrollView.scrollsToTop = NO;
	scrollView.delegate = self;
	[self addSubview:scrollView];
	[scrollView release];
	
	r = CGRectMake(frame.origin.x, frame.origin.y + frame.size.height - PAGE_CONTORL_HEIGHT, frame.size.width,	PAGE_CONTORL_HEIGHT);
	self.pageControl = [[SmartPageControl alloc] initWithFrame:r];
	pageControl.numberOfPages = numberOfPages;
	pageControl.currentPage = 0;
	[pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
	[self addSubview:pageControl];
}

- (void) drawRect:(CGRect)rect {
    // Drawing code
}

- (void) setNumberOfPages:(NSInteger)theNumberOfPages {
	if (theNumberOfPages != numberOfPages) {
		numberOfPages = theNumberOfPages;
		scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * numberOfPages, scrollView.frame.size.height);
		pageControl.numberOfPages = numberOfPages;
	}
}
- (void)dealloc {
    [super dealloc];
}

- (void) addView:(UIView *)view forPage:(NSInteger)page {
	if (nil == view.superview) {
		CGRect frame = scrollView.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        view.frame = frame;
        [scrollView addSubview:view];
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
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = page;
}

// At the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    pageControlUsed = NO;
}


- (void) changePage:(id)sender {
	int page = pageControl.currentPage;
	CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [scrollView scrollRectToVisible:frame animated:YES];
    // Set the boolean used when scrolls originate from the UIPageControl. See scrollViewDidScroll: above.
    pageControlUsed = YES;
}



@end
