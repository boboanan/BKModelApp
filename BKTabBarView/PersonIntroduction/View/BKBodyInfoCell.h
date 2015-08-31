//
//  BKBodyInfoCell.h
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/24.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BKBodyInfoCell : UITableViewCell

@property (nonatomic, strong)NSString *weightContent;
@property (nonatomic, strong)NSString *heightContent;
@property (nonatomic, strong)NSString *bustContent;
@property (nonatomic, strong)NSString *waistContent;

+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
