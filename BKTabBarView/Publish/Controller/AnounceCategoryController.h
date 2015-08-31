//
//  AnounceCategoryController.h
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/26.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AnounceCategoryControllerDelegate<UITableViewDelegate>
@optional
-(void)getAnounceCategory;

@end
@interface AnounceCategoryController : UITableViewController
@property (nonatomic,weak)id<AnounceCategoryControllerDelegate> delegate;
@property (nonatomic, strong)NSString *anounceCategoryController;
@end

