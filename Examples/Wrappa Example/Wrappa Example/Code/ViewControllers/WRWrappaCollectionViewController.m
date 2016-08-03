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

@interface WRWrappaCollectionViewController ()

@property (strong, nonatomic) IBOutlet WRWrappaCollectionView *myView;
@property (strong, nonatomic) IBOutlet WRCollectionSource *dataSource;

@end

@implementation WRWrappaCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup {
    [self.myView registerClass:WRRectangleCell.class];
    
    WRCollectionSource *collectionSource = [WRCollectionSource new];
    self.myView.collectionView.delegate = collectionSource;
    self.myView.collectionView.dataSource = collectionSource;
    
    WRTableSection *sectionModel = [WRTableSection new];
    WRRectangleCellSource *source;
    
    source = [WRRectangleCellSource new];
    source.title = @"First cell";
    [sectionModel addSource:source];
    
    source = [WRRectangleCellSource new];
    source.title = @"Second cell";
    [sectionModel addSource:source];
    
    [collectionSource addSection:sectionModel];
    
    self.dataSource = collectionSource;
    [self.myView.collectionView reloadData];
}

@end
