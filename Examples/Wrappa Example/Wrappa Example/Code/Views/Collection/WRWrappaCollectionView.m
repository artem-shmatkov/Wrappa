//
//  WRWrappaCollectionView.m
//  Wrappa Example
//
//  Created by Artem Shmatkov on 03/08/16.
//  Copyright © 2016 zakhej.com. All rights reserved.
//

#import "WRWrappaCollectionView.h"
#import "UICollectionView+Wrappa.h"

@implementation WRWrappaCollectionView

- (void)registerClass:(Class)class {
    [self.collectionView registerClass:class];
}

@end
