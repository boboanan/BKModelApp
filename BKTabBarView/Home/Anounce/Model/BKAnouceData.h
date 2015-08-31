//
//  AnouceData.h
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/14.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BKAnouceData : NSObject

/**通告图片名字*/
@property (nonatomic, copy) NSString *anouce_image;
/**通告类型*/
@property (nonatomic, copy) NSString *anouce_category;
/**通告价格*/
@property (nonatomic, copy) NSString *anouce_price;
/**通告时间*/
@property (nonatomic, copy) NSString *anouce_time;
/**通告地点*/
@property (nonatomic, copy) NSString *anouce_place;

#warning 测试数据
+(NSArray *)getAnounceDataArray;

@end
