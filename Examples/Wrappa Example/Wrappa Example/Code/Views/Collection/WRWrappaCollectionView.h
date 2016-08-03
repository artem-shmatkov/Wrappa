//
//  WRWrappaCollectionView.h
//  Wrappa Example
//
//  Created by Artem Shmatkov on 03/08/16.
//  Copyright © 2016 zakhej.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WRWrappaCollectionView : UIView

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

- (void)registerClass:(Class)class;

@end
