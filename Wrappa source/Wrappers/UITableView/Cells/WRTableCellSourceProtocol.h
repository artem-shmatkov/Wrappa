// WRTableCellSourceProtocol.h
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

#import "WRTableCellDelegate.h"
#import "WRTableCellProtocol.h"

@protocol WRTableCellSourceProtocol <NSObject, WRBaseCellSourceProtocol>

@property (nonatomic, weak) id <WRTableCellDelegate> delegate;
@property (nonatomic, weak) id <WRTableCellProtocol> cell;

@property (nonatomic, copy) NSString *footerTitle;
@property (nonatomic, copy) NSString *headerTitle;
@property (nonatomic, copy) NSString *deleteConfirmationTitle;

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIView *footerView;
@property (nonatomic, strong) UIView *cellView;

@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat estimatedHeight;
@property (nonatomic, assign) CGFloat headerViewHeight;
@property (nonatomic, assign) CGFloat footerViewHeight;

@property (nonatomic, assign) BOOL showSeparator;
@property (nonatomic, assign) BOOL selected;
@property (nonatomic, assign) BOOL shouldHighlight;
@property (nonatomic, assign) BOOL shouldIndent;

@property (nonatomic, assign) UITableViewCellEditingStyle editingStyle;
@property (nonatomic, assign) UITableViewCellAccessoryType accessoryType;

@end
