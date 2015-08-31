//
//  BKAddImageBtnCell.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/15.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKAddImageBtnCell.h"

@interface BKAddImageBtnCell()

@property (nonatomic, strong)UIButton *addImageBtn;


@end
@implementation BKAddImageBtnCell

//添加图片按钮初始化
-(UIButton *)addImageBtn
{
    if(_addImageBtn == nil){
        _addImageBtn = [[UIButton alloc] init];
    
        [self.contentView addSubview:_addImageBtn];
        
    }
    return _addImageBtn;
}

-(void)setImage:(UIImage *)image
{
    _image = image;
    CGFloat addImageBtnWH = 100;
    self.addImageBtn.frame = CGRectMake(0, 0,addImageBtnWH, addImageBtnWH);
    [self.addImageBtn setBackgroundColor:[UIColor whiteColor]];
    [self.addImageBtn setBackgroundImage:image forState:UIControlStateNormal];
    [self.addImageBtn addTarget:self action:@selector(addImage) forControlEvents:UIControlEventTouchUpInside];
}

-(void)addImage
{
    [self.delegate addBtnForImage:self];
    
}


@end
