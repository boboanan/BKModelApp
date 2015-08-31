//
//  AnouceData.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/14.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKAnouceData.h"

@implementation BKAnouceData

#warning 测试数据
+(NSArray *)getAnounceDataArray
{
    BKAnouceData *anounceData = [[BKAnouceData alloc] init];
    NSMutableArray *anounceArray = [[NSMutableArray alloc] init];
    anounceData.anouce_image = @"Intro_Screen_Three";
    anounceData.anouce_category = @"广告模特";
    anounceData.anouce_time = @"2014-12-12";
    anounceData.anouce_place = @"杭州电子科技大学";
    for(int i=0; i<20; i++){
        NSString *price = [NSString stringWithFormat:@"%d元",i * 10];
        anounceData.anouce_price = price;
        
        [anounceArray addObject:anounceData];
    }
    
    return anounceArray;
}



@end
