//
//  BKImageCell.h
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/22.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BKStarForCellInfo.h"
@class BKImageCell;
@protocol BKImageCellDelegate <NSObject>

-(void)showImage:(BKImageCell *)imageCell;

@end
@interface BKImageCell : UICollectionViewCell


/**首页模特头像和姓名数据*/
@property (nonatomic, strong) BKStarForCellInfo *starForCellInfo;

/**delegate*/
@property (nonatomic, strong) id<BKImageCellDelegate> delegate;

/**cell的位置*/
@property (nonatomic) NSInteger positon;
@end
