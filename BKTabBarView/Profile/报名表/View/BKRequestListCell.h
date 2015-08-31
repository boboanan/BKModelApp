//
//  BKRequestListCell.h
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/18.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BKStarForCellInfo.h"
#define ContentMargin 10


@interface BKRequestListCell : UITableViewCell

@property (nonatomic, strong)BKStarForCellInfo *starForCellInfo;

/**选择btn*/
@property (nonatomic, weak)UIButton *choiceBtn;

@end
