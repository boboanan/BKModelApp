//
//  BKPersonImageCell.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/13.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKPersonImageCell.h"
@interface BKPersonImageCell()

//放大的图片
@property (weak, nonatomic) UIImageView *personImageView;
@property (weak, nonatomic) UIButton *btn;
@end

@implementation BKPersonImageCell

-(UIButton *)personImageBtn
{
    if(!_personImageBtn){
        _personImageBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
        [_personImageBtn setBackgroundImage:[UIImage imageNamed:self.image] forState:UIControlStateNormal];
        _personImageBtn.layer.cornerRadius = 10;
        _personImageBtn.layer.masksToBounds = YES;
        [_personImageBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];

    }
    
    return _personImageBtn;
    
}


-(void)btnClick
{
    //图片
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height / 2.0;
    CGFloat y = [UIScreen mainScreen].bounds.size.height / 4;
    
    CGRect rect = CGRectMake(0, y, width, height);
    UIImageView *personImageView = [[UIImageView alloc] initWithFrame:rect];
    personImageView.image = [UIImage imageNamed:self.image];
    personImageView.contentMode = UIViewContentModeScaleAspectFill;
    //    UIViewContentModeScaleToFill,
    //    UIViewContentModeScaleAspectFit,
    //    UIViewContentModeScaleAspectFill,
    
    //背景返回按钮
    UIButton *btn = [[UIButton alloc]initWithFrame:[UIScreen mainScreen].bounds];
    btn.backgroundColor = BKColor(0, 0, 0, 0.7);
    [btn addTarget:self action:@selector(backToWindow) forControlEvents:UIControlEventTouchUpInside];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:btn];
    [window addSubview:personImageView];
    self.btn = btn;
    self.personImageView = personImageView;
}

//消除放大的图片
-(void)backToWindow
{
    [self.btn removeFromSuperview];
    [self.personImageView removeFromSuperview];
}


@end
