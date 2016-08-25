//
//  WRRectangleCellSource.h
//  Wrappa Example
//
//  Created by Artem Shmatkov on 03/08/16.
//  Copyright © 2016 zakhej.com. All rights reserved.
//

#import <Wrappa/Wrappa.h>

@interface WRRectangleCellSource : WRCollectionCellSource

@property (nonatomic, copy) UIColor *rectColor;
@property (nonatomic, copy) UIColor *headerColor;
@property (nonatomic, copy) UIColor *footerColor;

@end
