//
//  BKAnouceTableViewCell.h
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/14.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BKAnouceData.h"

#define ContentPadding 5
@interface BKAnouceTableViewCell : UITableViewCell

@property (nonatomic, strong) BKAnouceData *anouceData;
@end
