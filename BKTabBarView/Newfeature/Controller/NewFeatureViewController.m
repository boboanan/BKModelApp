//
//  NewFeatureViewController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/18.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "NewFeatureViewController.h"
#import "BKNewFeatureView.h"
#import "BKTabBarController.h"
#import "BKLogInViewController.h"
#import "BKSignInViewController.h"
#import "BKNavigationController.h"

@interface NewFeatureViewController () <BKNewFeatureViewDelegate>

@property BKNewFeatureView *introView;
@end

@implementation NewFeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults objectForKey:@"intro_screen_viewed"]) {
        self.introView = [[BKNewFeatureView alloc] initWithFrame:self.view.frame];
        self.introView.delegate = self;
        self.introView.backgroundColor = [UIColor blackColor];
        [self.view addSubview:self.introView];
    }
}

#pragma mark - ABCIntroViewDelegate Methods

-(void)onDoneButtonPressed:(UIButton *)sender{
    
    //    Uncomment so that the IntroView does not show after the user clicks "DONE"
    //    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //    [defaults setObject:@"YES"forKey:@"intro_screen_viewed"];
    //    [defaults synchronize];
    
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.introView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.introView removeFromSuperview];
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        if([sender.titleLabel.text isEqualToString:@"登录"]){
            BKLogInViewController *logInController = [[BKLogInViewController alloc] init];
            BKNavigationController *navLogIn = [[BKNavigationController alloc] initWithRootViewController:logInController];
            window.rootViewController = navLogIn;
        }else{
            BKSignInViewController *signInController = [[BKSignInViewController alloc] init];
            BKNavigationController *navSignIn = [[BKNavigationController alloc] initWithRootViewController:signInController];
            window.rootViewController = navSignIn;
            
        }
    }];
}

@end




