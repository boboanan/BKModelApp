//
//  BKTabBar.m
//  BKV2EX
//
//  Created by 锄禾日当午 on 15/7/17.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKTabBar.h"

#define NumTab 5

@interface BKTabBar()

@property(nonatomic, weak) UIButton *plusBtn;
@end

@implementation BKTabBar

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        //添加一个按钮到tabbar中
        UIButton *plusBtn = [[UIButton alloc] init];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"add_button"] forState:UIControlStateNormal];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"add_button"] forState:UIControlStateHighlighted];
        
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        plusBtn.size = plusBtn.currentBackgroundImage.size;
        [plusBtn addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:plusBtn];
        
        self.plusBtn = plusBtn;
    }
    
    return self;
    
}

//加号按钮点击
-(void)plusClick
{
    //通知代理
    if([self.delegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]){
        [self.delegate tabBarDidClickPlusButton:self];
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    //设置加号按钮位置
    self.plusBtn.centerX = self.width * 0.5;
    self.plusBtn.centerY = self.height * 0.5;
    
    //设置其他tababr位置和尺寸
    CGFloat tabbarButtonW = self.width / NumTab;
    CGFloat tabbarButtonIndex = 0;
    NSUInteger count = self.subviews.count;
    for(int i = 0; i<count; i++){
        UIView *child = self.subviews[i];
        Class class = NSClassFromString(@"UITabBarButton");
        if([child isKindOfClass:class]){
            child.width = tabbarButtonW;
            
            child.x = tabbarButtonIndex * tabbarButtonW;
            
            tabbarButtonIndex++;
            
            if(tabbarButtonIndex == NumTab/2){
                tabbarButtonIndex++;
            }
        }
    }
}
@end
