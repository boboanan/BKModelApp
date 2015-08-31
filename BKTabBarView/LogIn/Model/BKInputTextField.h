//
//  BKInputTextField.h
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/23.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BKInputTextField : NSObject

/**

 *  @param icon  输入框图标
 *  @param centerX 输入框中点x值
 *  @param posotionY 输入框y值
 *  @param placeholdertext 输入框提示文字
 */
+(UITextField *)setupWithIcon:(NSString *)icon posotionY:(CGFloat)posotionY centerX:(CGFloat)centerX placeholdertext:(NSString *)placeholdertext;

@end

