//
//  BKADHomeInfo.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/15.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKADHomeInfo.h"

@implementation BKADHomeInfo


#warning 测试数据
+(BKADHomeInfo *)getADHomeInfo
{
    BKADHomeInfo *info = [[BKADHomeInfo alloc] init];
    info.ad_images = @[@"11.jpg",@"12.jpg",@"13.jpg",@"11.jpg"];
    
    
    return info;
}
@end
