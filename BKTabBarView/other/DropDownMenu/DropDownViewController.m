//
//  DropDownViewController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/23.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "DropDownViewController.h"

@interface DropDownViewController ()

@end

@implementation DropDownViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BKColor(96, 96, 96, 1.0);
    
    UIButton *btnA = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, 80, 30)];
//    btnA.backgroundColor = [UIColor redColor];
    [btnA setTitle:@"通告" forState:UIControlStateNormal];
    [self.view addSubview:btnA];
    
    UIButton *btnB = [[UIButton alloc] initWithFrame:CGRectMake(0, 42, 80, 30)];
//    btnB.backgroundColor = [UIColor redColor];
    [btnB setTitle:@"艺人" forState:UIControlStateNormal];

    [self.view addSubview:btnB];
    
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
