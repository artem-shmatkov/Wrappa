//
//  WRCollectionHeaderView.m
//  Wrappa Example
//
//  Created by Artem Shmatkov on 04/08/16.
//  Copyright © 2016 zakhej.com. All rights reserved.
//

#import "WRCollectionHeaderView.h"

@interface WRCollectionHeaderView ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation WRCollectionHeaderView

- (void)setSource:(WRRectangleCellSource *)source {
    if (source.supplementaryKind == UICollectionElementKindSectionHeader) {
        self.label.text = source.headerTitle;
        self.backgroundColor = source.headerColor;
    } else {
        self.label.text = source.footerTitle;
        self.backgroundColor = source.footerColor;
    }
}

@end
