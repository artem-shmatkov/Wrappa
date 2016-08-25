//
//  WRRectangleCell.h
//  Wrappa Example
//
//  Created by Artem Shmatkov on 03/08/16.
//  Copyright © 2016 zakhej.com. All rights reserved.
//

#import "WRRectangleCellSource.h"
#import "WRCollectionCell.h"

@interface WRRectangleCell : WRCollectionCell <WRCollectionCellProtocol>

- (void)setSource:(WRRectangleCellSource *)source;

@end
