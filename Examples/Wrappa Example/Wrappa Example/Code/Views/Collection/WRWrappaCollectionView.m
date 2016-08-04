//
//  WRWrappaCollectionView.m
//  Wrappa Example
//
//  Created by Artem Shmatkov on 03/08/16.
//  Copyright © 2016 zakhej.com. All rights reserved.
//

#import "WRWrappaCollectionView.h"
#import "UICollectionView+Wrappa.h"

@interface WRWrappaCollectionView ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation WRWrappaCollectionView

- (void)registerCellClass:(Class)class {
    [self.collectionView registerCellClass:class];
}

- (void)registerHeaderClass:(Class)class {
    [self.collectionView registerHeaderClass:class];
}

- (void)registerFooterClass:(Class)class {
    [self.collectionView registerFooterClass:class];
}

- (void)setSource:(id <UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource>)source {
    self.collectionView.delegate = source;
    self.collectionView.dataSource = source;
}

- (void)reloadData {
    [self.collectionView reloadData];
}

@end
