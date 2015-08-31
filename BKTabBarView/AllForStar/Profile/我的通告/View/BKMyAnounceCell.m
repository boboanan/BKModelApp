//
//  BKMyAnounceCell.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/25.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKMyAnounceCell.h"

@implementation BKMyAnounceCell

- (void)awakeFromNib {
    // Initialization code
}


+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    BKMyAnounceCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BKMyAnounceCell" owner:nil options:nil] lastObject];
    }
    return cell;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
