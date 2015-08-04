// WRTableViewDataSource.m
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

#import "WRTableSource.h"

@interface WRTableSource ()

@property (nonatomic, strong) NSMutableArray *sections;

@end

@implementation WRTableSource

- (instancetype)init {
  self = [super init];
  if (self) {
    self.sections = [NSMutableArray new];
  }
  return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return (NSInteger)self.numberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return (NSInteger)[self sectionRowsCount:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  WRTableCellSource *source = [self sourceForIndexPath:indexPath];
  UITableViewCell <WRTableCellProtocol> *cell = [tableView dequeueReusableCellWithIdentifier:source.cellClass];
  source.indexPath = indexPath;
  [cell setUpWithSource:source];
  return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
  if (tableView.isEditing && editingStyle == UITableViewCellEditingStyleDelete) {
    WRTableCellSource *source = [self sourceForIndexPath:indexPath];
    [source.delegate deleteCellWithSource:source];
  }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  WRTableCellSource *source = [self headerViewSourceForSection:section];
  return source.headerTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
  WRTableCellSource *source = [self footerViewSourceForSection:section];
  return source.footerTitle;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
  WRTableCellSource *source = [self sourceForIndexPath:indexPath];
  return source.canEdit;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  WRTableCellSource *source = [self sourceForIndexPath:indexPath];
  return source.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
  WRTableCellSource *source = [self headerSourceForSection:section];
  return source.headerViewHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
  WRTableCellSource *source = [self footerSourceForSection:section];
  return source.footerViewHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
  WRTableCellSource *source = [self headerViewSourceForSection:section];
  return source.headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
  WRTableCellSource *source = [self footerViewSourceForSection:section];
  return source.footerView;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
  WRTableCellSource *source = [self sourceForIndexPath:indexPath];
  return source.shouldHighlight;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
  WRTableCellSource *source = [self sourceForIndexPath:indexPath];
  return source.deleteConfirmationTitle;
}

#pragma mark - Other methods

- (WRTableCellSource *)sourceForIndexPath:(NSIndexPath *)indexPath {
  WRTableSection *sectionModel = _sections[(NSUInteger)indexPath.section];
  WRTableCellSource *cellSource = [sectionModel sourceForRow:(NSUInteger)indexPath.row];
  return cellSource;
}

- (WRTableCellSource *)headerSourceForSection:(NSInteger)section {
  WRTableSection *sectionModel = _sections[(NSUInteger)section];
  WRTableCellSource *cellSource = [sectionModel sourceForRow:0];
  return cellSource;
}

- (WRTableCellSource *)footerSourceForSection:(NSInteger)section {
  WRTableSection *sectionModel = _sections[(NSUInteger)section];
  WRTableCellSource *cellSource = [sectionModel sourceForRow:0];
  return cellSource;
}

- (WRTableCellSource *)headerViewSourceForSection:(NSInteger)section {
  WRTableSection *sectionModel = _sections[(NSUInteger)section];
  WRTableCellSource *cellSource = [sectionModel sourceForRow:0];
  return cellSource;
}

- (WRTableCellSource *)footerViewSourceForSection:(NSInteger)section {
  WRTableSection *sectionModel = _sections[(NSUInteger)section];
  WRTableCellSource *cellSource = [sectionModel sourceForRow:0];
  return cellSource;
}

- (NSUInteger)numberOfSections {
  return _sections.count;
}

- (NSUInteger)sectionRowsCount:(NSInteger)section {
  WRTableSection *sectionModel = _sections[(NSUInteger)section];
  return sectionModel.numberOfRows;
}

- (void)addSection:(WRTableSection *)section {
  [_sections addObject:section];
}

- (void)clear {
  [_sections removeAllObjects];
}

- (void)recalculateIndexPath {
  NSInteger section = 0;
  NSUInteger row = 0;
  
  for (WRTableSection *sectionModel in _sections) {
    for (NSUInteger i = 0; i < sectionModel.numberOfRows; i++) {
      WRTableCellSource *cellSource = [sectionModel sourceForRow:row];
      cellSource.indexPath = [NSIndexPath indexPathForRow:(NSInteger)row inSection:section];
      row++;
    }
    
    row = 0;
    section++;
  }
}

@end
