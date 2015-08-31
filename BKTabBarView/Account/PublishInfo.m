//
//  PublishInfo.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/26.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "PublishInfo.h"

@implementation PublishInfo

-(NSString *)address
{
    if(!_address){
        _address = @"请输入地址";
    }
    return _address;
}

-(UIImage *)image
{
    if(!_image){
        _image = [UIImage imageNamed:@"1.jpg"];
    }
    return _image;
}
@end
