//
//  BKTabBar.h
//  BKV2EX
//
//  Created by 锄禾日当午 on 15/7/17.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BKTabBar;

@protocol BKTabBarDelegate <UITabBarDelegate>

-(void)tabBarDidClickPlusButton:(BKTabBar *)tabbar;

@end

@interface BKTabBar : UITabBar
@property (nonatomic, weak) id<BKTabBarDelegate> delegate;
@end


