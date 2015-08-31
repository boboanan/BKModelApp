//
//  BKAccount.h
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/25.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BKAccount : NSObject
/**昵称  */
@property (nonatomic, copy)NSString *name;
//[@"头像",@"昵称",@"身份",@"评价",@"商家类型",@"最近活动"
 /**头像*/
 @property (nonatomic, strong)UIImage *avatar;
/**评价*/
@property (nonatomic, copy)NSString *evaluate;
/**商家类型  艺人或商家*/
@property (nonatomic)BOOL *merchant_type;
/**最近活动*/
@property (nonatomic, strong)NSArray *recent_actions;
/**照片*/
@property (nonatomic, strong)NSArray *person_images;
/**工作标签*/
@property (nonatomic, strong)NSArray *work_tag;
/**个人风格*/
@property (nonatomic, strong)NSArray *personal_style;
/**认证信息*/
@property (nonatomic)BOOL authentication_info;
/**身高-体重-三维-罩杯*/
@property (nonatomic, strong)NSArray *body_info;
/**报价*/
@property (nonatomic)NSUInteger price;
/** 工作履历*/
@property (nonatomic, copy)NSString *work_experience;

@end
