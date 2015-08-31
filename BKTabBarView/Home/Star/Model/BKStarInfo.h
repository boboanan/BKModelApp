//
//  BKStarInfo.h
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/15.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BKStarForCellInfo.h"

@interface BKStarInfo : NSObject

/**模特姓名*/
@property (nonatomic, copy) NSString *star_name;
/**模特评价*/
@property (nonatomic, copy) NSString *star_evaluate;
/**模特认证信息*/
@property (nonatomic) BOOL star_isIdentify;
/**模特类型*/
@property (nonatomic, strong) NSArray *star_category;
/**模特身体特征*/
@property (nonatomic, strong) NSArray *star_body;
/**模特最近档期*/
@property (nonatomic, strong) NSArray *star_work_time;
/**模特工作履历*/
@property (nonatomic, copy) NSString *star_work_experience;
/**模特工作报价*/
@property (nonatomic, copy) NSString *star_price;
/**模特照片*/
@property (nonatomic, strong) NSArray *star_images;
/**模特视频*/
@property (nonatomic, strong)NSString *star_video;

/**cell是显示的数据*/
@property (nonatomic, strong)BKStarForCellInfo *starForCellInfo;

#warning 测试数据
+(NSArray *)getStarInfoArray;

@end
