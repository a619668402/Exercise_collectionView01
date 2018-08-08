//
//  ChangeViewController.h
//  Exercise_collectionView01
//
//  Created by mac on 16/3/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  void(^sendInfoBlock)(CGFloat maxHeight,CGFloat minHeight,NSInteger columnCount,CGFloat marginSpace);

@interface ChangeViewController : UIViewController

@property (nonatomic,copy) sendInfoBlock sendInfoblock;

- (void)setBlock:(sendInfoBlock)block;

@end
