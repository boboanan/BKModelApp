//
//  BKImageCell.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/22.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKImageCell.h"
@interface BKImageCell()

@property (weak, nonatomic) IBOutlet UIButton *personButton;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;


@end
@implementation BKImageCell


-(void)setStarForCellInfo:(BKStarForCellInfo *)starForCellInfo
{
    _starForCellInfo = starForCellInfo;
    [self.personButton setBackgroundImage:[UIImage imageNamed:starForCellInfo.star_cell_image] forState:UIControlStateNormal];
#warning 测试数据
    self.nameLabel.text = @"贝克汉姆";
    self.nameLabel.textColor = [UIColor grayColor];
    self.nameLabel.font = [UIFont systemFontOfSize:12];
}

- (void)awakeFromNib {
    // Initialization code
   
}

-(UIButton *)personButton
{
    _personButton.layer.cornerRadius = 10;
    _personButton.layer.masksToBounds = YES;
    [_personButton addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    return _personButton;
}


-(void)btnClick
{
    [self.delegate showImage:self];
}
@end
