//
//  WRRectangleCell.m
//  Wrappa Example
//
//  Created by Artem Shmatkov on 03/08/16.
//  Copyright © 2016 zakhej.com. All rights reserved.
//

#import "WRRectangleCell.h"

@interface WRRectangleCell ()

@property (weak, nonatomic) IBOutlet UIView *rectView;

@end

@implementation WRRectangleCell

- (void)setSource:(WRRectangleCellSource *)source {
    self.rectView.backgroundColor = source.rectColor;
}

@end
