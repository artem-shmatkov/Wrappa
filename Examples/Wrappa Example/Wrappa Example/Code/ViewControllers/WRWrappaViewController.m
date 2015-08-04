// WRTableSectionModel.h
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

#import "WRWrappaViewController.h"
#import "WRWrappaView.h"
#import "Wrappa.h"
#import "WRTextCell.h"
#import "WRTextCellSource.h"

@interface WRWrappaViewController ()

@property (strong, nonatomic) IBOutlet WRWrappaView *myView;
@property (strong, nonatomic) IBOutlet WRTableSource *dataSource;

@end

@implementation WRWrappaViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setup];
}

- (void)setup {
  [self.myView.tableView registerClass:WRTextCell.class];
  
  WRTableSource *tableSource = [WRTableSource new];
  self.myView.tableView.delegate = tableSource;
  self.myView.tableView.dataSource = tableSource;
  
  WRTableSection *sectionModel = [WRTableSection new];
  WRTextCellSource *source;
  
  source = [WRTextCellSource new];
  source.title = @"First cell";
  [sectionModel addSource:source];
  
  source = [WRTextCellSource new];
  source.title = @"Second cell";
  [sectionModel addSource:source];
  
  [tableSource addSection:sectionModel];
  
  self.dataSource = tableSource;
  [self.myView.tableView reloadData];
}

@end
