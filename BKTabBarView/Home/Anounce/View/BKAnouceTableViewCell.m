//
//  BKAnouceTableViewCell.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/14.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKAnouceTableViewCell.h"

@interface BKAnouceTableViewCell()

/**通告图片*/
@property (nonatomic, strong) UIImageView *anouceImageView;
/**通告类型*/
@property (nonatomic, strong) UILabel *anouceCategoryLabel;
/**通告价格*/
@property (nonatomic, strong) UILabel *anoucePriceLabel;
/**通告时间*/
@property (nonatomic, strong) UILabel *anouceTimeLabel;
/**通告地点*/
@property (nonatomic, strong) UILabel *anoucePlaceLabel;

@end

@implementation BKAnouceTableViewCell

-(UIImageView *)anouceImageView
{
    if(!_anouceImageView){
        _anouceImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_anouceImageView];
    }
    return _anouceImageView;
}

-(UILabel *)anouceCategoryLabel
{
    if(!_anouceCategoryLabel){
        _anouceCategoryLabel = [[UILabel alloc] init];
        _anouceCategoryLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_anouceCategoryLabel];
    }
    return _anouceCategoryLabel;
}

-(UILabel *)anoucePriceLabel
{
    if(!_anoucePriceLabel){
        _anoucePriceLabel = [[UILabel alloc] init];
        _anoucePriceLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_anoucePriceLabel];
    }
    return _anoucePriceLabel;
}

-(UILabel *)anouceTimeLabel
{
    if(!_anouceTimeLabel){
        _anouceTimeLabel = [[UILabel alloc] init];
        _anouceTimeLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_anouceTimeLabel];
    }
    return _anouceTimeLabel;
}

-(UILabel *)anoucePlaceLabel
{
    if(!_anoucePlaceLabel){
        _anoucePlaceLabel = [[UILabel alloc] init];
        _anoucePlaceLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_anoucePlaceLabel];
    }
    return _anoucePlaceLabel;
}

-(void)setAnouceData:(BKAnouceData *)anouceData
{
    _anouceData = anouceData;
    
    /**设置数据*/
    [self settingData];
    
    /**设置位置*/
    [self settingFrame];
}

/**设置数据*/
-(void)settingData
{
    //图片
    self.anouceImageView.image = [UIImage imageNamed:self.anouceData.anouce_image];
    //类型
    self.anouceCategoryLabel.text = self.anouceData.anouce_category;
    //价钱
    self.anoucePriceLabel.text = self.anouceData.anouce_price;
    //时间
    self.anouceTimeLabel.text = self.anouceData.anouce_time;
    //地点
    self.anoucePlaceLabel.text = self.anouceData.anouce_place;
}

/**设置位置*/
-(void)settingFrame
{
    
    
    /**通告图片名字*/
    CGFloat AnounceImageViewX =ContentPadding;
    CGFloat AnounceImageViewY =ContentPadding;
    CGFloat AnounceImageViewWH = 100;
    self.anouceImageView.frame = CGRectMake(AnounceImageViewX, AnounceImageViewY, AnounceImageViewWH, AnounceImageViewWH);
    
    /**通告类型*/
    CGFloat AnouceCategoryLabelX = CGRectGetMaxX(self.anouceImageView.frame) + ContentPadding * 3;
    CGFloat AnouceCategoryLabelY = AnounceImageViewY;
    CGFloat AnouceCategoryLabelW = 100;
    CGFloat AnouceCategoryLabelH = 20;
    self.anouceCategoryLabel.frame = CGRectMake(AnouceCategoryLabelX, AnouceCategoryLabelY, AnouceCategoryLabelW, AnouceCategoryLabelH);
    
    /**通告价格*/
    CGFloat AnoucePriceLabelX = AnouceCategoryLabelX;
    CGFloat AnoucePriceLabelY = CGRectGetMaxY(self.anouceCategoryLabel.frame) + ContentPadding;
    CGFloat AnoucePriceLabelW = 150;
    CGFloat AnoucePriceLabelH = 20;
    self.anoucePriceLabel.frame = CGRectMake(AnoucePriceLabelX, AnoucePriceLabelY, AnoucePriceLabelW, AnoucePriceLabelH);
    
    /**通告时间*/
    CGFloat AnouceTimeLabelX = AnouceCategoryLabelX;
    CGFloat AnouceTimeLabelY = CGRectGetMaxY(self.anoucePriceLabel.frame) + ContentPadding * 3;
    CGFloat AnouceTimeLabelW = 70;
    CGFloat AnouceTimeLabelH = 20;
    self.anouceTimeLabel.frame = CGRectMake(AnouceTimeLabelX, AnouceTimeLabelY, AnouceTimeLabelW, AnouceTimeLabelH);
    
    /**通告地点*/
    CGFloat AnoucePlaceLabelX = CGRectGetMaxX(self.anouceTimeLabel.frame) + ContentPadding;
    CGFloat AnoucePlaceLabelY = AnouceTimeLabelY;
    CGFloat AnoucePlaceLabelW = 100;
    CGFloat AnoucePlaceLabelH = 20;
    self.anoucePlaceLabel.frame = CGRectMake(AnoucePlaceLabelX, AnoucePlaceLabelY, AnoucePlaceLabelW, AnoucePlaceLabelH);
    
    

    
    
    
}

///**cell选中时或取消时*/
//-(void)setSelected:(BOOL)selected animated:(BOOL)animated
//{
//    [super setSelected:selected animated:animated];
//    if(selected){
//        self.contentView.backgroundColor = [UIColor yellowColor];
//    
//    }else{
//        
//    }
//}

@end
