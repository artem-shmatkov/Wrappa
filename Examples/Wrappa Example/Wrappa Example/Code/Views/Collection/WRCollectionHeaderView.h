//
//  WRCollectionHeaderView.h
//  Wrappa Example
//
//  Created by Artem Shmatkov on 04/08/16.
//  Copyright © 2016 zakhej.com. All rights reserved.
//

#import "WRCollectionCellSource.h"
#import "WRCollectionCell.h"
#import "WRRectangleCellSource.h"

@interface WRCollectionHeaderView : UICollectionReusableView <WRCollectionCellProtocol>

- (void)setSource:(WRRectangleCellSource *)source;

@end
