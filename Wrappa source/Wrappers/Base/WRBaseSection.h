// WRBaseSection.h
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
#import "WRBaseCellSource.h"

@interface WRBaseSection : NSObject

@property (nonatomic, strong) NSMutableArray *rows;

- (NSUInteger)numberOfRows;
- (WRBaseCellSource *)sourceForRow:(NSUInteger)row;
- (WRBaseCellSource *)sourceForTag:(NSInteger)tag;

- (void)addSource:(WRBaseCellSource *)source;
- (void)addSources:(NSArray *)sourcesArray;

- (void)replaceSources:(NSArray *)sourcesArray;

- (void)insertSource:(WRBaseCellSource *)source atIndex:(NSUInteger)index;
- (void)insertSources:(NSArray *)sourcesArray atIndex:(NSUInteger)index;

- (void)removeSource:(WRBaseCellSource *)source;
- (void)removeSourceAtIndex:(NSUInteger)index;
- (void)removeSourcesAtIndexes:(NSIndexSet *)indexSet;

@end
