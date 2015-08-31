//
//  BKNewFeatureView.h
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/23.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BKNewFeatureViewDelegate <NSObject>

-(void)onDoneButtonPressed:(UIButton *)sender;

@end
@interface BKNewFeatureView : UIView
@property (nonatomic, strong) id<BKNewFeatureViewDelegate> delegate;

@end
