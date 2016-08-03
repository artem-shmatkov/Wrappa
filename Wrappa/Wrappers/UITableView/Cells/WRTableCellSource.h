// WRTableCellSource.h
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

#import "WRTableCellSourceProtocol.h"
#import "WRTableCellProtocol.h"
#import "WRBaseCellSource.h"
#import "WRTableCell.h"

@interface WRTableCellSource : WRBaseCellSource

@property (nonatomic, weak) id <WRTableCellSourceProtocol> delegate;
@property (nonatomic, weak) id <WRTableCellProtocol> cell;

@property (nonatomic, copy) NSString *footerTitle;
@property (nonatomic, copy) NSString *headerTitle;
@property (nonatomic, copy) NSString *deleteConfirmationTitle;

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIView *footerView;
@property (nonatomic, strong) UIView *cellView;

@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat headerViewHeight;
@property (nonatomic, assign) CGFloat footerViewHeight;

@property (nonatomic, strong) id buttonTarget;
@property (nonatomic, assign) SEL buttonSelector;

@property (nonatomic, assign) BOOL showSeparator;
@property (nonatomic, assign) BOOL selected;
@property (nonatomic, assign) BOOL shouldHighlight;

@end
