//
//  BKMyWalletCell.h
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/25.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BKMyWalletCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *isGotMoney;

+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
