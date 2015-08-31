//
//  BKInputTextField.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/23.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKInputTextField.h"

@implementation BKInputTextField

+(UITextField *)setupWithIcon:(NSString *)icon posotionY:(CGFloat)posotionY centerX:(CGFloat)centerX placeholdertext:(NSString *)placeholdertext
{
    UITextField *textField = [[UITextField alloc] init];
    textField.width = [UIScreen mainScreen].bounds.size.width /5*4;
    textField.height = 40;
    textField.centerX = centerX;
    textField.y = posotionY;
    
    textField.layer.cornerRadius = 5;
    textField.backgroundColor = [UIColor whiteColor];

    textField.placeholder = placeholdertext;
    textField.font = [UIFont systemFontOfSize:16];
    textField.textColor = [UIColor blackColor];
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.clearButtonMode = UITextFieldViewModeAlways;
    UIImage *bigIcon = [UIImage imageNamed:icon];
    UIImageView *iconView = [[UIImageView alloc] initWithImage:bigIcon];
    if (icon) {
        iconView.width = 40;
    }
    iconView.contentMode = UIViewContentModeLeft;
    textField.leftView = iconView;
    textField.leftViewMode = UITextFieldViewModeAlways;
    return textField;
}

@end
