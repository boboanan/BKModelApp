//
//  BKStarInfo.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/15.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKStarInfo.h"


@implementation BKStarInfo

#warning 测试数据
+(NSArray *)getStarInfoArray
{

    BKStarInfo *starInfo = [[BKStarInfo alloc] init];
    /**模特姓名*/
    starInfo.star_name = @"小兰";
    /**模特评价*/
    starInfo.star_evaluate = @"3";
    /**模特认证信息*/
    starInfo.star_isIdentify = YES;
    /**模特类型*/
    starInfo.star_category = @[@"可爱",@"广告模特"];
    /**模特身体特征*/
    starInfo.star_body = @[@"33",@"33",@"33",@"42",@"162"];
    /**模特最近档期*/
    starInfo.star_work_time = @[@"2014-12-12",@"2014-12-13"];
    /**模特工作履历*/
    starInfo.star_work_experience = @"曾参加中国梦之声";
    /**模特工作报价*/
    starInfo.star_price = @"300";
    /**模特照片*/
    starInfo.star_images = @[@"Intro_Screen_One",@"Intro_Screen_Two",@"Intro_Screen_Three"];
    /**模特视频*/
    starInfo.star_video = nil;
    NSMutableArray *array = [NSMutableArray array];
    for(int i = 0; i < 30; i++){
        NSString *name = [NSString stringWithFormat:@"小兰%d",i];
        starInfo.star_name = name;
        [array addObject:starInfo];
    }

    return array;
}

@end
