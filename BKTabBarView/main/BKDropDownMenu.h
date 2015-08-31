//
//  BKDropDownMenu.h
//  BKV2EX
//
//  Created by 锄禾日当午 on 15/7/17.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BKDropDownMenu;
@protocol BKDropDownMenuDelegate <NSObject>

@optional
-(void)dropdownMenuDidDismiss:(BKDropDownMenu *)menu;
-(void)dropdownMenuDidShow:(BKDropDownMenu *)menu;
@end
@interface BKDropDownMenu : UIView

@property (nonatomic, weak) id<BKDropDownMenuDelegate> delegate;


@property (nonatomic, strong) UIView *content;
//内容控制器
@property (nonatomic, strong) UIViewController *contentController;


+(instancetype)menu;
-(void)showFrom:(UIView *)from;
-(void)dismiss;

@end
