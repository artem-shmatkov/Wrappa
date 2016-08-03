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

@interface WRWrappaTableViewController ()

@property (strong, nonatomic) IBOutlet WRWrappaTableView *myView;
@property (strong, nonatomic) IBOutlet WRTableSource *dataSource;

@end

@implementation WRWrappaTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup {
    [self.myView registerClass:WRTextCell.class];
    
    WRTableSource *tableSource = [WRTableSource new];
    self.myView.tableView.delegate = tableSource;
    self.myView.tableView.dataSource = tableSource;
    
    // first section
    
    WRTableSection *sectionModel = [WRTableSection new];
    WRTextCellSource *source = nil;
    
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
    
    self.dataSource = tableSource;
    [self.myView.tableView reloadData];
}

@end