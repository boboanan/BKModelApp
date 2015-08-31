//
//  BKTabBarController.m
//  BKV2EX
//
//  Created by 锄禾日当午 on 15/7/16.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKTabBarForStarController.h"
#import "BKNavigationController.h"
#import "CalendarViewController.h"
#import "BKHomeController.h"
#import "BKSearchViewController.h"
#import "BKPublishController.h"
#import "BKProfileForStarController.h"

@interface BKTabBarForStarController ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end

@implementation BKTabBarForStarController


- (void)viewDidLoad {
    [super viewDidLoad];

 
    
    BKHomeController *home = [[BKHomeController alloc] init];
    [self addChildVc:home Title:@"首页" image:@"home" selectedImage:@"home_selected"];

    CalendarViewController *calendar = [[CalendarViewController alloc] init];
    [self addChildVc:calendar Title:@"档期" image:@"schedule" selectedImage:@"schedule_selected"];


    BKSearchViewController *search = [[BKSearchViewController alloc] init];
    [self addChildVc:search Title:@"搜索" image:@"search" selectedImage:@"search_selected"];


    BKProfileForStarController *profile = [[BKProfileForStarController alloc] init];
    [self addChildVc:profile Title:@"个人" image:@"i" selectedImage:@"i_selected"];
   

}

-(void)addChildVc:(UIViewController *)childVc Title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //设置文字样式
    NSMutableDictionary *textAttrs = [[NSMutableDictionary alloc] init];
    textAttrs[NSForegroundColorAttributeName] = BKColor(123,123,123,1.0);
    NSMutableDictionary *selectedTextAttrs = [[NSMutableDictionary alloc] init];
//    selectedTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    selectedTextAttrs[NSForegroundColorAttributeName] = BKColorPink;
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    BKNavigationController *nav = [[BKNavigationController alloc] initWithRootViewController:childVc];
    childVc.navigationItem.leftBarButtonItem = nil;
    //添加自控制器
    [self addChildViewController:nav];
    
}




@end
