//
//  BKADHomeInfo.h
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/15.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BKADHomeInfo : NSObject

/**广告图片*/
@property (nonatomic, strong) NSArray *ad_images;

#warning 测试数据
+(BKADHomeInfo *)getADHomeInfo;
@end
