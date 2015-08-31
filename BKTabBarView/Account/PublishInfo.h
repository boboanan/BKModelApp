//
//  PublishInfo.h
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/26.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublishInfo : NSObject

/** 通告类型*/
@property (nonatomic ,strong)NSString *anounce_category;
/**性别，是否为男*/
@property (nonatomic)BOOL sex;
/**详细地址*/
@property (nonatomic, copy)NSString *address;
/**照片*/
@property (nonatomic, strong)UIImage *image;
@end
