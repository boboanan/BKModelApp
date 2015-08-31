//
//  BKNavigationController.m
//  BKV2EX
//
//  Created by 锄禾日当午 on 15/7/17.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKNavigationController.h"

@interface BKNavigationController ()

@end

@implementation BKNavigationController


+(void)initialize
{
    
    //设置整个项目所有item的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    //设置普通状态
    NSMutableDictionary *textAttr = [NSMutableDictionary dictionary];
    textAttr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttr[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [item setTitleTextAttributes:textAttr forState:UIControlStateNormal];
    
    
    
    //设置不可用状态
    NSMutableDictionary *disableTextAttr = [NSMutableDictionary dictionary];
    disableTextAttr[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
    disableTextAttr[NSFontAttributeName] = textAttr[NSFontAttributeName];
    [item setTitleTextAttributes:disableTextAttr forState:UIControlStateDisabled];
    
    //设置导航栏样式
    UINavigationBar *bar = [UINavigationBar appearance];

    bar.barTintColor = BKColorPink;
    
//      [bar setBackgroundImage:[UIImage imageNamed:@"pink"] forBarMetrics:UIBarMetricsDefault];

    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName :[UIColor whiteColor]}];
    
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:YES];
    
//    if(self.viewControllers.count > 1){
//        UIButton *backBtn = [[UIButton alloc] init];
//        [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//        [backBtn setBackgroundImage:[UIImage imageNamed:@"navigationbar_back"] forState:UIControlStateNormal];
//        [backBtn setBackgroundImage:[UIImage imageNamed:@"navigationbar_back_highlighted"] forState:UIControlStateHighlighted];
//        
//        backBtn.size = backBtn.currentBackgroundImage.size;
//        
//        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
//        
//        
//        
//        UIButton *moreBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
//        [moreBtn addTarget:self action:@selector(more) forControlEvents:UIControlEventTouchUpInside];
//        [moreBtn setTitle:@"确定" forState:UIControlStateNormal];
//        moreBtn.titleLabel.font =[UIFont systemFontOfSize:15];
//        [moreBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [moreBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
//        [moreBtn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
//        //moreBtn.size = moreBtn.currentBackgroundImage.size;
//        
//        
//        viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:moreBtn];
//    }
//    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];  
}



-(void)back
{
    [self popViewControllerAnimated:YES];
}

-(void)more
{
    [self popToRootViewControllerAnimated:YES];
}


@end
