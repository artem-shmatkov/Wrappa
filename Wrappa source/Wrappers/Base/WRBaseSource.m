// WRBaseSource.m
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

#import "WRBaseSource.h"

@implementation WRBaseSource

- (instancetype)init {
    self = [super init];
    if (self) {
        self.sections = [NSMutableArray new];
    }
    return self;
}

- (void)addSection:(id <WRBaseSectionProtocol>)section {
    [_sections addObject:section];
}

- (void)clear {
    [_sections removeAllObjects];
}

- (void)recalculateIndexPaths {
    NSInteger section = 0;
    NSUInteger row = 0;
    
    for (id <WRBaseSectionProtocol> sectionModel in _sections) {
        for (NSUInteger i = 0; i < sectionModel.numberOfRows; i++) {
            id <WRBaseCellSourceProtocol> cellSource = [sectionModel sourceForRow:row];
            cellSource.indexPath = [NSIndexPath indexPathForRow:row inSection:section];
            row++;
        }
        
        row = 0;
        section++;
    }
}

#pragma mark - Other methods

- (id <WRBaseCellSourceProtocol>)sourceForIndexPath:(NSIndexPath *)indexPath {
    id <WRBaseSectionProtocol> sectionModel = _sections[indexPath.section];
    id <WRBaseCellSourceProtocol> cellSource = [sectionModel sourceForRow:indexPath.row];
    return cellSource;
}

- (id <WRBaseCellSourceProtocol>)headerSourceForSection:(NSUInteger)section {
    id <WRBaseSectionProtocol> sectionModel = _sections[section];
    id <WRBaseCellSourceProtocol> cellSource = [sectionModel sourceForRow:0];
    return cellSource;
}

- (id <WRBaseCellSourceProtocol>)footerSourceForSection:(NSUInteger)section {
    id <WRBaseSectionProtocol> sectionModel = _sections[section];
    id <WRBaseCellSourceProtocol> cellSource = [sectionModel sourceForRow:0];
    return cellSource;
}

- (id <WRBaseCellSourceProtocol>)headerViewSourceForSection:(NSUInteger)section {
    id <WRBaseSectionProtocol> sectionModel = _sections[section];
    id <WRBaseCellSourceProtocol> cellSource = [sectionModel sourceForRow:0];
    return cellSource;
}

- (id <WRBaseCellSourceProtocol>)footerViewSourceForSection:(NSUInteger)section {
    id <WRBaseSectionProtocol> sectionModel = _sections[section];
    id <WRBaseCellSourceProtocol> cellSource = [sectionModel sourceForRow:0];
    return cellSource;
}

- (NSInteger)numberOfSections {
    return _sections.count;
}

- (NSInteger)sectionRowsCount:(NSInteger)section {
    id <WRBaseSectionProtocol> sectionModel = _sections[section];
    return sectionModel.numberOfRows;
}

#pragma mark - Scroll View Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (_scrollViewDelegate && [_scrollViewDelegate respondsToSelector:@selector(scrollViewDidScroll:)]) {
        [_scrollViewDelegate scrollViewDidScroll:scrollView];
    }
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    if (_scrollViewDelegate && [_scrollViewDelegate respondsToSelector:@selector(scrollViewDidZoom:)]) {
        [_scrollViewDelegate scrollViewDidZoom:scrollView];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (_scrollViewDelegate && [_scrollViewDelegate respondsToSelector:@selector(scrollViewWillBeginDragging:)]) {
        [_scrollViewDelegate scrollViewWillBeginDragging:scrollView];
    }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    if (_scrollViewDelegate && [_scrollViewDelegate respondsToSelector:@selector(scrollViewWillEndDragging:withVelocity:targetContentOffset:)]) {
        [_scrollViewDelegate scrollViewWillEndDragging:scrollView withVelocity:velocity targetContentOffset:targetContentOffset];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (_scrollViewDelegate && [_scrollViewDelegate respondsToSelector:@selector(scrollViewDidEndDragging:willDecelerate:)]) {
        [_scrollViewDelegate scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
    }
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    if (_scrollViewDelegate && [_scrollViewDelegate respondsToSelector:@selector(scrollViewWillBeginDecelerating:)]) {
        [_scrollViewDelegate scrollViewWillBeginDecelerating:scrollView];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (_scrollViewDelegate && [_scrollViewDelegate respondsToSelector:@selector(scrollViewDidEndDecelerating:)]) {
        [_scrollViewDelegate scrollViewDidEndDecelerating:scrollView];
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    if (_scrollViewDelegate && [_scrollViewDelegate respondsToSelector:@selector(scrollViewDidEndScrollingAnimation:)]) {
        [_scrollViewDelegate scrollViewDidEndScrollingAnimation:scrollView];
    }
}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    if (_scrollViewDelegate && [_scrollViewDelegate respondsToSelector:@selector(viewForZoomingInScrollView:)]) {
        return [_scrollViewDelegate viewForZoomingInScrollView:scrollView];
    }
    
    return nil;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view {
    if (_scrollViewDelegate && [_scrollViewDelegate respondsToSelector:@selector(scrollViewWillBeginZooming:withView:)]) {
        [_scrollViewDelegate scrollViewWillBeginZooming:scrollView withView:view];
    }
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale {
    if (_scrollViewDelegate && [_scrollViewDelegate respondsToSelector:@selector(scrollViewDidEndZooming:withView:atScale:)]) {
        [_scrollViewDelegate scrollViewDidEndZooming:scrollView withView:view atScale:scale];
    }
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
    if (_scrollViewDelegate && [_scrollViewDelegate respondsToSelector:@selector(scrollViewShouldScrollToTop:)]) {
        return [_scrollViewDelegate scrollViewShouldScrollToTop:scrollView];
    }
    
    return YES;
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    if (_scrollViewDelegate && [_scrollViewDelegate respondsToSelector:@selector(scrollViewDidScrollToTop:)]) {
        [_scrollViewDelegate scrollViewDidScrollToTop:scrollView];
    }
}

@end
