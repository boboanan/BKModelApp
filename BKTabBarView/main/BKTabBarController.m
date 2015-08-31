//
//  BKTabBarController.m
//  BKV2EX
//
//  Created by 锄禾日当午 on 15/7/16.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKTabBarController.h"
#import "BKNavigationController.h"
#import "BKTabBar.h"
#import "CalendarViewController.h"
#import "BKHomeController.h"
#import "BKSearchViewController.h"
#import "BKPublishController.h"
#import "BKProfileController.h"
#import "BKMyAddAnounceController.h"

@interface BKTabBarController ()<BKTabBarDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *iconView;



@end

@implementation BKTabBarController

//+(void)initialize
//{
//    UITabBar *bar = [UITabBar appearance];
//    //[bar setBackgroundImage:[UIImage imageNamed:@"blue.jpg"]];
//
//}

- (void)viewDidLoad {
    [super viewDidLoad];

 
    
    BKHomeController *home = [[BKHomeController alloc] init];
    [self addChildVc:home Title:@"首页" image:@"home" selectedImage:@"home_selected"];

    BKMyAddAnounceController *calendar = [[BKMyAddAnounceController alloc] init];
    [self addChildVc:calendar Title:@"通告" image:@"schedule" selectedImage:@"schedule_selected"];


    BKSearchViewController *search = [[BKSearchViewController alloc] init];
    [self addChildVc:search Title:@"搜索" image:@"search" selectedImage:@"search_selected"];


    BKProfileController *profile = [[BKProfileController alloc] init];
    [self addChildVc:profile Title:@"个人" image:@"i" selectedImage:@"i_selected"];
    
    BKTabBar *tabBar = [[BKTabBar alloc] init];
    tabBar.delegate = self;
    [self setValue:tabBar forKeyPath:@"tabBar"];

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

#pragma mark - WBTabBardelegate
-(void)tabBarDidClickPlusButton:(BKTabBar *)tabbar
{
   //[self showMenu];
    BKPublishController *publishController = [[BKPublishController alloc] init];
    BKNavigationController *nav = [[BKNavigationController alloc] initWithRootViewController:publishController];

     [self presentViewController:nav animated:YES completion:nil];

   
}


@end
