//
//  WRWrappaCollectionView.h
//  Wrappa Example
//
//  Created by Artem Shmatkov on 03/08/16.
//  Copyright © 2016 zakhej.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WRWrappaCollectionView : UIView

- (void)registerCellClass:(Class)class;
- (void)registerHeaderClass:(Class)class;
- (void)registerFooterClass:(Class)class;

- (void)setSource:(id <UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource>)source;

- (void)reloadData;

@end
