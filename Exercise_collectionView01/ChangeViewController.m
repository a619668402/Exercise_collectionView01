//
//  ChangeViewController.m
//  Exercise_collectionView01
//
//  Created by mac on 16/3/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ChangeViewController.h"

@interface ChangeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *maxHeight;

@property (weak, nonatomic) IBOutlet UITextField *minHeight;
@property (weak, nonatomic) IBOutlet UITextField *columnCount;
@property (weak, nonatomic) IBOutlet UITextField *marginSpace;
@end

@implementation ChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.maxHeight.text = @"200";
    self.minHeight.text = @"100";
    self.marginSpace.text = @"5";
    self.columnCount.text = @"2";
}

- (IBAction)btnClick:(id)sender {
    
    self.sendInfoblock([self.maxHeight.text floatValue],[self.minHeight.text floatValue],[self.columnCount.text integerValue],[self.marginSpace.text floatValue]);
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setBlock:(sendInfoBlock)block{
    
    self.sendInfoblock = block;
}

@end
