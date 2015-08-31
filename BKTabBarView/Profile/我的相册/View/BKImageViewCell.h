//
//  ImageViewCell.h
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/26.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BKImageViewCell;
@protocol BKImageViewCellDelegate <NSObject>

-(void)closeBtnForImage:(BKImageViewCell *)imageViewCell;
@end

@interface BKImageViewCell : UICollectionViewCell

/**照片*/
@property (nonatomic, strong) UIImage *image;
/**删除照片按钮*/
@property (nonatomic, strong)UIButton *closeBtn;

/**图片cell代理*/
@property (nonatomic, strong) id<BKImageViewCellDelegate> delegate;

/**是否删除*/
@property (nonatomic) BOOL willDelete;
@end
