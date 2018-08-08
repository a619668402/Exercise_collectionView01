//
//  CustomerLayout.h
//  Exercise_collectionView01
//
//  Created by mac on 16/3/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomerLayoutDelegate <NSObject>

- (NSInteger)UICollectionViewLayoutMaxHeight;

- (NSInteger)UICollectionViewLayoutMinHeight;

- (NSInteger)UICollectionViewLayoutColunmCount;

- (CGFloat)UICollectionViewLayoutMarginSpace;

@end

@interface CustomerLayout : UICollectionViewLayout

@property (nonatomic,assign) id <CustomerLayoutDelegate> delegate;

@property (nonatomic,assign) NSInteger cellCount;

@property (nonatomic,assign) NSInteger maxHeight;

@property (nonatomic,assign) NSInteger minHeight;

@property (nonatomic,assign) NSInteger colunmCount;

@property (nonatomic,assign) CGFloat margin;

@property (nonatomic,assign) CGFloat width;

@property (nonatomic,retain) NSMutableArray *cellHeightArray;

@property (nonatomic,retain) NSMutableArray *cellXArray;

@property (nonatomic,retain) NSMutableArray *cellYArray;

@end
