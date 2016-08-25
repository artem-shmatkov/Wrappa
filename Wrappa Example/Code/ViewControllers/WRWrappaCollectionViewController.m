// WRWrappaTableViewController.m
//
// Copyright (c) 2016 Art Shmatkov
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "WRWrappaCollectionViewController.h"
#import "WRWrappaCollectionView.h"
#import "Wrappa.h"
#import "WRRectangleCell.h"
#import "WRRectangleCellSource.h"
#import "WRCollectionHeaderView.h"

@interface WRWrappaCollectionViewController () <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet WRWrappaCollectionView *myView;
@property (strong, nonatomic) WRCollectionSource *dataSource;

@end

@implementation WRWrappaCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup {
    [self.myView registerCellClass:WRRectangleCell.class];
    [self.myView registerHeaderClass:WRCollectionHeaderView.class];
    [self.myView registerFooterClass:WRCollectionHeaderView.class];
    
    WRCollectionSource *collectionSource = [WRCollectionSource new];
    self.myView.source = collectionSource;
    WRRectangleCellSource *source = nil;
    WRCollectionSection *sectionModel = nil;
    
    // first section
    
    sectionModel = [WRCollectionSection new];
    
    source = [WRRectangleCellSource new];
    source.rectColor = [self randomColor];
    source.headerColor = [UIColor greenColor];
    source.referenceSizeForHeader = CGSizeMake(10, 30);
    source.headerTitle = @"Header 1";
    [sectionModel addSource:source];
    
    source = [WRRectangleCellSource new];
    source.rectColor = [self randomColor];
    [sectionModel addSource:source];
    
    source = [WRRectangleCellSource new];
    source.rectColor = [self randomColor];
    [sectionModel addSource:source];
    
    [collectionSource addSection:sectionModel];
    
    // second section
    
    sectionModel = [WRCollectionSection new];
    
    source = [WRRectangleCellSource new];
    source.rectColor = [self randomColor];
    source.headerColor = [UIColor yellowColor];
    source.referenceSizeForHeader = CGSizeMake(10, 30);
    source.headerTitle = @"Header 2";
    [sectionModel addSource:source];
    
    source = [WRRectangleCellSource new];
    source.rectColor = [self randomColor];
    [sectionModel addSource:source];
    
    source = [WRRectangleCellSource new];
    source.rectColor = [self randomColor];
    [sectionModel addSource:source];
    
    [collectionSource addSection:sectionModel];
    
    // third section
    
    sectionModel = [WRCollectionSection new];
    
    for (int i = 7; i < 100; i++) {
        source = [WRRectangleCellSource new];
        source.rectColor = [self randomColor];
        [sectionModel addSource:source];
    }
    
    source = (WRRectangleCellSource *)[sectionModel sourceForRow:0];
    source.headerColor = [UIColor grayColor];
    source.footerColor = [UIColor redColor];
    source.referenceSizeForHeader = CGSizeMake(10, 30);
    source.headerTitle = @"Header 3";
    source.referenceSizeForFooter = CGSizeMake(10, 30);
    source.footerTitle = @"Footer";
    
    [collectionSource addSection:sectionModel];
    collectionSource.scrollViewDelegate = self;
    
    // reload
    
    self.dataSource = collectionSource;
    [self.myView reloadData];
}

- (UIColor *)randomColor {
    u_int32_t red = arc4random_uniform(256);
    u_int32_t green = arc4random_uniform(256);
    u_int32_t blue = arc4random_uniform(256);
    u_int32_t multiplier = arc4random_uniform(3) + 1;
    return [UIColor colorWithRed:(red / multiplier) / 255.0  green:(green / multiplier) / 255.0 blue:(blue / multiplier) / 255.0 alpha:1.0];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidScroll");
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidEndScrollingAnimation");
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"scrollViewWillBeginDragging");
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    NSLog(@"scrollViewWillEndDragging");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"scrollViewDidEndDragging");
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    NSLog(@"scrollViewWillBeginDecelerating");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidEndDecelerating");
}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    NSLog(@"viewForZoomingInScrollView");
    return nil;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view {
    NSLog(@"scrollViewWillBeginZooming");
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidZoom");
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    NSLog(@"scrollViewDidEndZooming");
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
    NSLog(@"scrollViewShouldScrollToTop");
    return YES;
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidScrollToTop");
}

@end
