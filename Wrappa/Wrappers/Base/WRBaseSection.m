// WRBaseSection.m
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

#import "WRBaseSection.h"

@implementation WRBaseSection

- (instancetype)init {
    self = [super init];
    if (self) {
        self.rows = [NSMutableArray new];
    }
    return self;
}

- (NSUInteger)numberOfRows {
    return _rows.count;
}

- (WRBaseCellSource *)sourceForRow:(NSUInteger)row {
    return _rows[row];
}

- (WRBaseCellSource *)sourceForTag:(NSInteger)tag {
    for (WRBaseCellSource *source in _rows) {
        if (source.tag == tag) {
            return source;
        }
    }
    
    return nil;
}

#pragma mark - Data Source Methods

- (void)addSource:(WRBaseCellSource *)source {
    [_rows addObject:source];
}

- (void)addSources:(NSArray *)sourcesArray {
    [_rows addObjectsFromArray:sourcesArray];
}

- (void)replaceSources:(NSArray *)sourcesArray {
    [_rows removeAllObjects];
    _rows = [NSMutableArray arrayWithArray:sourcesArray];
}

- (void)insertSource:(WRBaseCellSource *)source atIndex:(NSUInteger)index {
    if (index < _rows.count) {
        [_rows insertObject:source atIndex:index];
    }
}

- (void)insertSources:(NSArray *)sourcesArray atIndex:(NSUInteger)index {
    if (index < _rows.count) {
        NSRange range = NSMakeRange(index, sourcesArray.count);
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
        [_rows insertObjects:sourcesArray atIndexes:indexSet];
    }
}

- (void)removeSource:(WRBaseCellSource *)source {
    [_rows removeObject:source];
}

- (void)removeSourceAtIndex:(NSUInteger)index {
    [_rows removeObjectAtIndex:index];
}

- (void)removeSourcesAtIndexes:(NSIndexSet *)indexSet {
    [_rows removeObjectsAtIndexes:indexSet];
}

@end
