//
//  AppDelegate.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/18.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "AppDelegate.h"
#import "BKTabBarController.h"
#import "NewFeatureViewController.h"
#import "BKHomeController.h"
#import "BKLogInViewController.h"
#import "BKHomeCollectionViewController.h"
#import "BKSearchViewController.h"
#import "BKProfileController.h"
#import "uzysViewController.h"
#import <SMS_SDK/SMS_SDK.h>
//短信验证
#warning 个人信息
#define appKey @"9ce839e6fc7b"
#define appSecret @"420933b36c7e15284ecf32bac3955fcf"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    [self.window makeKeyAndVisible];
   
    //短信验证初始化
   [SMS_SDK registerApp:appKey withSecret:appSecret];
    
    self.window.rootViewController =[[NewFeatureViewController alloc] init];
   

    //test
//    self.window.rootViewController =[[Test1ViewController alloc] init];
    return YES;
}
@end
