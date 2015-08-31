//
//  BKStarForCell.h
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/15.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BKStarForCellInfo : NSObject

/**模特cell头像*/
@property (nonatomic, copy) NSString *star_cell_image;
/**模特cell姓名*/
@property (nonatomic, copy) NSString *star_cell_name;

@property (nonatomic, strong)NSArray *star_images;
@end
