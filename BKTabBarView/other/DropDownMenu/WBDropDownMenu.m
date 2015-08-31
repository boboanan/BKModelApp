//
//  WBDropDownMenu.m
//  WB
//
//  Created by 锄禾日当午 on 15/7/7.
//  Copyright (c) 2015年 WWS. All rights reserved.
//

#import "WBDropDownMenu.h"
@interface WBDropDownMenu()

@property (nonatomic, weak) UIImageView *containerView;

@end

@implementation WBDropDownMenu

-(UIImageView *)containerView
{
    if(!_containerView){
        //添加一个灰色图片控件
        UIImageView *containerView = [[UIImageView alloc] init];
        containerView.image = [UIImage imageNamed:@"down_view"];
        containerView.width = 100;
        containerView.height = 100;
        containerView.userInteractionEnabled = YES; // 开启交互
        [self addSubview:containerView];//contentView是weak所以要先加载到屏幕上
        self.containerView = containerView;
    
    }
    return _containerView;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        //清楚颜色
        self.backgroundColor = [UIColor clearColor];
        
    }
    
    return self;
}

+(instancetype)menu
{
    return [[self alloc] init];
}

-(void)setContent:(UIView *)content
{
    _content = content;
    
    content.x = 5;
    content.y = 5;
    
    content.width = 80;
    
    self.containerView.height =CGRectGetMaxY(content.frame) +10;
    self.containerView.width = CGRectGetMaxX(content.frame) + 10;
    
    //添加内容
    [self.containerView addSubview:content];
}

-(void)setContentController:(UIViewController *)contentController
{
    _contentController = contentController;
    
    self.content = contentController.view;
}

-(void)showFrom:(UIView *)from
{
//    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    
    self.frame = window.bounds;
    
    self.containerView.x = 10;
    
    CGRect newFrame= [from convertRect:from.frame toView:window];
  


//     self.containerView.centerX = CGRectGetMidX(newFrame);
    self.containerView.centerX = 50;
    self.containerView.y = CGRectGetMaxY(newFrame);
    
    if([self.delegate respondsToSelector:@selector(dropdownMenuDidShow:)]){
        [self.delegate dropdownMenuDidShow:self];
    }
}

-(void)dismiss
{
    [self removeFromSuperview];
    
    //通知外界，自己被销毁了
    if([self.delegate respondsToSelector:@selector(dropdownMenuDidDismiss:)])
    {
        [self.delegate dropdownMenuDidDismiss:self];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
}


@end
