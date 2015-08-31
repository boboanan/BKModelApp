//
//  BKAccount.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/25.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKAccount.h"

@implementation BKAccount

-(NSString *)name
{
    if(!_name){
        _name = @"比尔盖茨";
    }
    return _name;
}
////[@"头像",@"昵称",@"身份",@"评价",@"商家类型",@"最近活动"
///**头像*/
//-(UIImage *)avatar
//{
//    if(!_avatar){
//      return [UIImage imageNamed:@"1.jpg"];
//    }
//    return _avatar;
//}
///**评价*/
//-(NSString *)evaluate
//{
//    return @"5";
//}
///**商家类型  艺人或商家*/
//-(BOOL *)merchant_type
//{
//    return false;
//}
///**最近活动*/
//-(NSArray *)recent_actions
//{
//    return @[@"2015-5-12",@"2015-5-14",@"2015-5-17"];
//}
///**照片*/
//-(NSArray *)person_images
//{
//    UIImage *image1 = [UIImage imageNamed:@"1.jpg"];
//    UIImage *image2 = [UIImage imageNamed:@"2.jpg"];
//    UIImage *image3 = [UIImage imageNamed:@"3.jpg"];
//    return @[image1,image2,image3];
//    
//}
///**工作标签*/
//-(NSArray *)work_tag
//{
//    return @[@"平面模特",@"广告模特",@"演员"];
//}
///**个人风格*/
//-(NSArray *)personal_style
//{
//    return @[@"清纯",@"可爱",@"性感"];
//}
///**认证信息*/
//-(BOOL)authentication_info
//{
//    return true;
//}
///**身高-体重-三维-罩杯*/
//-(NSArray *)body_info
//{
//    return @[@"165",@"45",@"31-32-33",@"B"];
//}
///**报价*/
//-(NSUInteger)price
//{
//    return 200;
//}
///** 工作履历*/
//-(NSString *)work_experience
//{
//    return @"工作经验丰富";
//}

@end
