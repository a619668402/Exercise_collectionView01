//
//  ViewController.m
//  Exercise_collectionView01
//
//  Created by mac on 16/3/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "ChangeViewController.h"
#import "CustomerLayout.h"

@interface ViewController ()<CustomerLayoutDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSInteger _maxHeight;
    NSInteger _minheight;
    CGFloat _margin;
    NSInteger _columnCount;
    UICollectionView *_collectionView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"Click" style:UIBarButtonItemStyleDone target:self action:@selector(changeData)];
    self.navigationItem.rightBarButtonItem = item;
    
    _maxHeight = 200;
    _minheight = 100;
    _margin = 5;
    _columnCount = 2;
    
    CustomerLayout *layout = [[CustomerLayout alloc]init];
    layout.delegate = self;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"ID"];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 150;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ID" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1];
    
    return cell;
}

- (void)changeData{
    
    ChangeViewController *vc = [[ChangeViewController alloc]init];
    vc.sendInfoblock = ^(CGFloat maxHeight,CGFloat minHeight,NSInteger columnCount,CGFloat marginSpace){
        
        
        _columnCount = columnCount;
        _margin = marginSpace;
        _maxHeight = maxHeight;
        _minheight = minHeight;
        [_collectionView reloadData];
    };
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSInteger)UICollectionViewLayoutMaxHeight{
    
    return _maxHeight;
}

- (NSInteger)UICollectionViewLayoutMinHeight{
    
    return _minheight;
}

- (NSInteger)UICollectionViewLayoutColunmCount{
    
    return _columnCount;
}

- (CGFloat)UICollectionViewLayoutMarginSpace{
    
    return _margin;
}

@end
