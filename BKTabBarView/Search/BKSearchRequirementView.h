//
//  BKSearchRequirementView.h
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/24.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BKSearchRequirementView : UIView

/**条件分类列表*/
@property (nonatomic, strong)NSArray *firstRequirements;

/**每种类型的分类, 数组的数组*/
@property (nonatomic, strong)NSArray *secondRequirements;
@end
