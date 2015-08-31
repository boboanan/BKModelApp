//
//  Test1ViewController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/22.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "Test1ViewController.h"
#import "UIWindow+YUBottomPoper.h"
@interface Test1ViewController ()

@end

@implementation Test1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton * btn1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 60)];
    
    [btn1 setTitle:@"按钮1" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btn1touch) forControlEvents:UIControlEventTouchUpInside];
    
    btn1.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    
    [self.view  addSubview:btn1];
    
    UIButton * btn2= [[UIButton alloc]initWithFrame:CGRectMake(0, 100, 100, 60)];
    
    [btn2 setTitle:@"按钮2" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btn2Touch) forControlEvents:UIControlEventTouchUpInside];
    
    btn2.backgroundColor = [UIColor lightGrayColor];
    
    [self.view  addSubview:btn2];
}

-(void)btn1touch{
    
    [self.view.window  showPopWithButtonTitles:@[@"评论",] styles:@[YUDefaultStyle] whenButtonTouchUpInSideCallBack:^(int index  ) {
        
    }];
}

-(void)btn2Touch{
    
    [self.view.window  showPopWithButtonTitles:@[@"置顶",@"修改",@"删除"] styles:@[YUDefaultStyle,YUDefaultStyle,YUDangerStyle] whenButtonTouchUpInSideCallBack:^(int index  ) {
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
