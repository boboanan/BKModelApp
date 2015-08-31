//
//  BKRequestListCell.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/18.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKFinalListCell.h"

@interface BKFinalListCell()

/**姓名*/
@property (nonatomic, weak)UILabel *name;
/**性别*/
@property (nonatomic, weak)UILabel *sex;
/**说明*/
@property (nonatomic, weak)UILabel *intro;
/**头像*/
@property (nonatomic, weak)UIImageView *pic;


@end
@implementation BKFinalListCell

-(UIImageView *)pic
{
    if(_pic == nil){
        UIImageView *pic = [[UIImageView alloc] init];
        [self.contentView addSubview:pic];
        _pic = pic;
    }
    return _pic;
}

-(UILabel *)name
{
    if(!_name){
        UILabel *name = [[UILabel alloc] init];
        [self.contentView addSubview:name];
        _name = name;
    }
    return _name;
}

-(UILabel *)sex
{
    if(!_sex){
        UILabel *sex = [[UILabel alloc] init];
        [self.contentView addSubview:sex];
        _sex = sex;
    }
    return _sex;
}

-(UILabel *)intro
{
    if(!_intro){
        UILabel *intro = [[UILabel alloc] init];
        [self.contentView addSubview:intro];
        _intro = intro;
    }
    return _intro;
}


-(UIButton *)choiceBtn
{
    if(!_choiceBtn){
        UIButton *choiceBtn = [[UIButton alloc] init];
        [self.contentView addSubview:choiceBtn];
        _choiceBtn = choiceBtn;
    }
    return _choiceBtn;
}

-(void)setStarForCellInfo:(BKStarForCellInfo *)starForCellInfo
{
    _starForCellInfo = starForCellInfo;
    
    
    
    //设置子控件位置
    [self setFrame];
    
    //设置子控件数据
    [self setData];
}



//设置子控件位置
-(void)setFrame
{
    //头像
    CGFloat picX = ContentMargin;
    CGFloat picY = ContentMargin;
    CGFloat picWH = 80;
    self.pic.frame = CGRectMake(picX, picY, picWH, picWH);
    //姓名
    CGFloat nameW = 80;
    CGFloat nameH = 25;
//    self.name.backgroundColor = [UIColor redColor];
    self.name.frame = CGRectMake(CGRectGetMaxX(self.pic.frame)+ContentMargin, picY, nameW, nameH);
    //选择按钮
    CGFloat btnwH = 20;
    CGFloat btnX = [UIScreen mainScreen].bounds.size.width - btnwH - ContentMargin * 2;
    self.choiceBtn.frame = CGRectMake(btnX, 0, btnwH, btnwH);
    self.choiceBtn.centerY = 40 + ContentMargin;
    self.choiceBtn.layer.cornerRadius = btnwH / 2;
    [self.choiceBtn setBackgroundImage:[UIImage imageNamed:@"add_button"] forState:UIControlStateSelected];
    self.choiceBtn.layer.borderColor = BKColorBlue.CGColor;
    self.choiceBtn.layer.borderWidth = 1;
    self.choiceBtn.layer.masksToBounds = YES;
    self.choiceBtn.userInteractionEnabled = NO;

}



//设置子控件数据
-(void)setData
{
    self.pic.image = [UIImage imageNamed:self.starForCellInfo.star_cell_image];
    
    self.name.text = self.starForCellInfo.star_cell_name;

}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
