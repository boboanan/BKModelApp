//
//  BKBodyInfoCell.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/24.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKBodyInfoCell.h"
@interface BKBodyInfoCell()

@property(nonatomic, weak) UIImageView *weight;
@property(nonatomic, weak) UIImageView *height;
@property(nonatomic, weak) UIImageView *bust;
@property(nonatomic, weak) UIImageView *waist;

@property(nonatomic, weak) UILabel *weightLabel;
@property(nonatomic, weak) UILabel *heightLabel;
@property(nonatomic, weak) UILabel *bustLabel;
@property(nonatomic, weak) UILabel *waistLabel;

@end
@implementation BKBodyInfoCell

-(UIImageView *)weight
{
    if(_weight == nil){
        UIImageView *weight = [[UIImageView alloc] init];
        weight.image = [UIImage imageNamed:@"weight"];
        [self addSubview:weight];
        _weight = weight;
    }
    return _weight;
}

-(UIImageView *)height
{
    if(_height == nil){
        UIImageView *height = [[UIImageView alloc] init];
        height .image = [UIImage imageNamed:@"height"];
        [self addSubview:height];
        _height = height;
    }
    return _height;
}

-(UIImageView *)bust
{
    if(_bust == nil){
        UIImageView *bust = [[UIImageView alloc] init];
        bust.image = [UIImage imageNamed:@"bust"];
        [self addSubview:bust];
        _bust = bust;
    }
    return _bust;
}

-(UIImageView *)waist
{
    if(_waist == nil){
        UIImageView *waist = [[UIImageView alloc] init];
        waist.image = [UIImage imageNamed:@"the_waist"];
        [self addSubview:waist];
        _waist = waist;
    }
    return _waist;
}

-(UILabel *)weightLabel
{
    if(_weightLabel == nil){
        UILabel *weightLabel = [[UILabel alloc] init];
        weightLabel.font = [UIFont systemFontOfSize:15];
        weightLabel.textColor = BKColorPink;
        weightLabel.textAlignment =  NSTextAlignmentCenter;
        [self addSubview:weightLabel];
        _weightLabel = weightLabel;
    }
    return _weightLabel;
}

-(UILabel *)heightLabel
{
    if(_heightLabel == nil){
        UILabel *heightLabel = [[UILabel alloc] init];
        heightLabel.font = [UIFont systemFontOfSize:15];
        heightLabel.textColor = BKColorPink;
        heightLabel.textAlignment =  NSTextAlignmentCenter;
        [self addSubview:heightLabel];
        _heightLabel = heightLabel;
    }
    return _heightLabel;
}

-(UILabel *)bustLabel
{
    if(_bustLabel == nil){
        UILabel *bustLabel = [[UILabel alloc] init];
        bustLabel.font = [UIFont systemFontOfSize:15];
        bustLabel.textColor = BKColorPink;
        bustLabel.textAlignment =  NSTextAlignmentCenter;
        [self addSubview:bustLabel];
        _bustLabel = bustLabel;
    }
    return _bustLabel;
}

-(UILabel *)waistLabel
{
    if(_waistLabel == nil){
        UILabel *waistLabel = [[UILabel alloc] init];
        waistLabel.font = [UIFont systemFontOfSize:15];
        waistLabel.textColor = BKColorPink;
        waistLabel.textAlignment =  NSTextAlignmentCenter;
        [self addSubview:waistLabel];
        _waistLabel = waistLabel;
    }
    return _waistLabel;
}

-(void)setWeightContent:(NSString *)weightContent
{
    _weightContent = weightContent;
    NSString *string = [weightContent stringByAppendingString:@"KG"];
    self.weightLabel.text = string;
}

-(void)setHeightContent:(NSString *)heightContent
{
    _heightContent = heightContent;
    NSString *string = [heightContent stringByAppendingString:@"CM"];
    self.heightLabel.text = string;
}

-(void)setBustContent:(NSString *)bustContent
{
    _bustContent = bustContent;
    self.bustLabel.text = bustContent;
}

-(void)setWaistContent:(NSString *)waistContent
{
    _waistContent = waistContent;
    self.waistLabel.text = waistContent;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        CGFloat width = [UIScreen mainScreen].bounds.size.width / 4;
        CGFloat height = 30;
        
        self.weight.frame = CGRectMake(0, 0, width, width);
        self.height.frame = CGRectMake(width, 0, width, width);
        self.bust.frame = CGRectMake(width * 2, 0, width, width);
        self.waist.frame = CGRectMake(width * 3, 0, width, width);
        
        self.weightLabel.frame = CGRectMake(0, width, width, height);
        self.heightLabel.frame = CGRectMake(width, width, width, height);
        self.bustLabel.frame = CGRectMake(width * 2, width, width, height);
        self.waistLabel.frame = CGRectMake(width * 3, width, width, height);
    }
    return self;
}

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    BKBodyInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell = [[BKBodyInfoCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
