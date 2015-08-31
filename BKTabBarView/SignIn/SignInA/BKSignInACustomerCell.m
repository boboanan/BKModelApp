//
//  BKSignInACustomerCell.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/25.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKSignInACustomerCell.h"

@implementation BKSignInACustomerCell

- (void)awakeFromNib {
    // Initialization code
}


+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    BKSignInACustomerCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BKSignInACustomerCell" owner:nil options:nil] lastObject];
    }
    return cell;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
