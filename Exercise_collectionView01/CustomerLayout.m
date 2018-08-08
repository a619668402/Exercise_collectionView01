//
//  CustomerLayout.m
//  Exercise_collectionView01
//
//  Created by mac on 16/3/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CustomerLayout.h"


@implementation CustomerLayout

- (void)prepareLayout{
    
    self.maxHeight = [self.delegate UICollectionViewLayoutMaxHeight];
    self.minHeight = [self.delegate UICollectionViewLayoutMinHeight];
    self.colunmCount = [self.delegate UICollectionViewLayoutColunmCount];
    self.margin = [self.delegate UICollectionViewLayoutMarginSpace];
    
    self.cellCount = [self.collectionView numberOfItemsInSection:0];
    
    self.cellXArray = [NSMutableArray array];
    
    self.width = ([UIScreen mainScreen].bounds.size.width - (self.colunmCount - 1) * self.margin) / self.colunmCount;
    for (int i = 0; i < self.colunmCount; i ++) {
        
        CGFloat tempX = i * (self.width + self.margin);
        [self.cellXArray addObject:@(tempX)];
    }
    
    self.cellHeightArray = [NSMutableArray array];
    for (int i = 0; i < self.cellCount; i ++) {
        
        CGFloat temp = arc4random() % self.maxHeight + self.minHeight;
        [self.cellHeightArray addObject:@(temp)];
    }
}

- (CGSize)collectionViewContentSize{
    
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, [self getMaxHeightWithArray:_cellYArray]);
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    self.cellYArray = [NSMutableArray array];
    for (int i = 0; i < _colunmCount; i ++) {
        
        [self.cellYArray addObject:@(0)];
    }
    
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < _cellCount; i ++) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        [arr addObject:attributes];
    }
    
    return arr;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{

    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGRect frame =  CGRectZero;
    CGFloat height = [_cellHeightArray[indexPath.row]floatValue];
    
    NSInteger minIndex = [self getMinIndexWithArray:_cellYArray];
    CGFloat tempX = [_cellXArray[minIndex]floatValue];
    CGFloat tempY = [_cellYArray[minIndex]floatValue];
    frame = CGRectMake(tempX, tempY, self.width, height);
    attributes.frame = frame;
    _cellYArray[minIndex] = @(tempY + self.margin + height);
    return attributes;
}

- (CGFloat)getMaxHeightWithArray:(NSMutableArray *)array{
    
    if (array.count == 0) {
        
        return 0.0f;
    }
    
    CGFloat maxHeight = [array[0]floatValue];
    
    for (int i = 0; i < array.count; i ++) {
        
        if (maxHeight < [array[i]floatValue]) {
            
            maxHeight = [array[i]floatValue];
        }
    }
    return maxHeight;
}

- (CGFloat)getMinIndexWithArray:(NSMutableArray *)array{
    
    if (array.count == 0) {
        
        return 0.0f;
    }
    
    NSInteger minIndex = 0;
    CGFloat minFloat = [array[minIndex]floatValue];
    for (int i = 0; i < array.count; i ++) {
        
        if (minFloat > [array[i]floatValue]) {
            
            minFloat = [array[i]floatValue];
            minIndex = i;
        }
    }
    return minIndex;
}

@end
