//
//  ImageViewCell.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/26.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKImageViewCell.h"
@interface BKImageViewCell()

@property (nonatomic, weak)UIImageView *imageview;


@end

@implementation BKImageViewCell

-(UIImageView *)imageview
{
    if(_imageview == nil){
        UIImageView *imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:imageView];
        _imageview = imageView;
    }
    return _imageview;
}


-(UIButton *)closeBtn
{
    if(!_closeBtn){
        _closeBtn = [[UIButton alloc] init];
        self.willDelete = NO;
        [_closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_closeBtn];
    }
    return _closeBtn;
}

-(void)closeBtnClick
{
    self.willDelete = YES;
    [self.delegate closeBtnForImage:self];
    self.willDelete = NO;
}

-(void)setImage:(UIImage *)image
{
    _image = image;
    //处理数据
    self.imageview.image = image;
    [self.closeBtn setBackgroundImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    //处理位置
    self.imageview.frame = CGRectMake(0, 0, 100, 100);
    self.closeBtn.frame = CGRectMake(80, 0, 20, 20);

}
@end
