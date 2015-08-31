//
//  BKAddImageBtnCell.h
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/15.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UzysAssetsPickerController.h"

@class BKAddImageBtnCell;
@protocol BKAddImageBtnCellDelegate <NSObject>

-(void)addBtnForImage:(BKAddImageBtnCell *)addImageBtnCell;

@end
@interface BKAddImageBtnCell : UICollectionViewCell

@property (nonatomic, strong) UIImage *image;

@property (nonatomic,strong) id<BKAddImageBtnCellDelegate> delegate;


@end
