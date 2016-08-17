// WRWrappaTableViewController.m
//
// Copyright (c) 2015 Art Shmatkov
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

#import "WRWrappaTableViewController.h"
#import "WRWrappaTableView.h"
#import "Wrappa.h"
#import "WRTextCell.h"
#import "WRTextCellSource.h"

@interface WRWrappaTableViewController () <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet WRWrappaTableView *myView;
@property (strong, nonatomic) WRTableSource *dataSource;

@end

@implementation WRWrappaTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup {
    [self.myView registerClass:WRTextCell.class];
    
    WRTableSource *tableSource = [WRTableSource new];
    self.myView.source = tableSource;
    WRTextCellSource *source = nil;
    WRTableSection *sectionModel = nil;
    
    // first section
    
    sectionModel = [WRTableSection new];
    
    source = [WRTextCellSource new];
    source.title = @"First cell";
    source.headerTitle = @"First Header";
    source.headerViewHeight = 30;
    [sectionModel addSource:source];
    
    source = [WRTextCellSource new];
    source.title = @"Second cell";
    [sectionModel addSource:source];
    
    [tableSource addSection:sectionModel];
    
    // second section
    
    sectionModel = [WRTableSection new];
    
    source = [WRTextCellSource new];
    source.title = @"Third cell";
    source.headerTitle = @"Second Header";
    source.headerViewHeight = 30;
    [sectionModel addSource:source];
    
    source = [WRTextCellSource new];
    source.title = @"Fourth cell";
    [sectionModel addSource:source];
    
    [tableSource addSection:sectionModel];
    
    // third section
    
    sectionModel = [WRTableSection new];
    
    source = [WRTextCellSource new];
    source.title = @"Fifth cell";
    source.headerTitle = @"Third Header";
    source.headerViewHeight = 30;
    [sectionModel addSource:source];
    
    for (int i = 6; i < 100; i++) {
        source = [WRTextCellSource new];
        source.title = [NSString stringWithFormat:@"Cell #%d", i];
        [sectionModel addSource:source];
    }
    
    [tableSource addSection:sectionModel];
    tableSource.scrollViewDelegate = self;
    
    // reload
    
    self.dataSource = tableSource;
    [self.myView reloadData];
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
