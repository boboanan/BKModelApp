//
//  NewPasswordController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/12.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKNewPasswordController.h"

#import "BKInputTextField.h"
#import "BKTabBarController.h"
#import "BKLogInViewController.h"
#import "MBProgressHUD+MJ.h"
#import "BKLogInViewController.h"
#import "BKNavigationController.h"

#define SeparationDistance 10

@interface BKNewPasswordController ()<UITextFieldDelegate>

//手机号
@property (nonatomic, weak)UITextField *pwd;

//验证码
@property (nonatomic, weak)UITextField *pwdAgain;

//下一步按钮
@property (nonatomic, weak)UIButton *loginBtn;

@property (nonatomic, weak)UIImageView *bgImage;
@end

@implementation BKNewPasswordController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"忘记密码";
    
    //设置输入框
    [self setupInput];
    
    //设置下一步按钮
    [self buttonSetUp];
    
    
}

//设置输入框
- (void)setupInput
{
    //密码textfiled
    CGFloat pwdY = 10 + 64;
    self.pwd = [self textfieldWithPositionY:pwdY Icon:@"password" placeholdertext:@"请输入密码" KeyboardType:UIKeyboardTypeDefault];
    [self.pwd setSecureTextEntry:YES];
    
    //再次输入密码textfiled
    CGFloat pwdAgainY = CGRectGetMaxY(self.pwd.frame) + SeparationDistance;
    self.pwdAgain = [self textfieldWithPositionY:pwdAgainY Icon:@"password" placeholdertext:@"请再次输入密码" KeyboardType:UIKeyboardTypeDefault];
    [self.pwdAgain setSecureTextEntry:YES];
    
}

//创建textfield并设置样式
-(UITextField *)textfieldWithPositionY:(CGFloat)positionY Icon:(NSString *)icon placeholdertext:(NSString *)placeholdertext KeyboardType:(UIKeyboardType)keyboardType
{
    CGFloat centerX = self.view.width * 0.5;
    UITextField *textField = [BKInputTextField setupWithIcon:icon posotionY:positionY centerX:centerX placeholdertext:placeholdertext];
    textField.keyboardType = keyboardType;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [textField setReturnKeyType:UIReturnKeyNext];
    [self.view addSubview:textField];
    textField.delegate = self;
    
    return textField;
}


//设置提交按钮
-(void)buttonSetUp
{
    UIButton *submitBtn = [[UIButton alloc] init];
    submitBtn.width = 232;
    submitBtn.height = 40;
    submitBtn.centerX = self.view.width * 0.5;
    submitBtn.y = CGRectGetMaxY(self.pwdAgain.frame) + 30;
    submitBtn.layer.cornerRadius = 5;
    [submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [submitBtn setBackgroundImage:[UIImage imageNamed:@"pink"] forState:UIControlStateNormal];
    [submitBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitBtn];
    self.loginBtn = submitBtn;
    
}

- (UILabel *)setupTextName:(NSString *)textName frame:(CGRect)frame
{
    UILabel *textNameLabel = [[UILabel alloc] init];
    textNameLabel.text = textName;
    textNameLabel.font = [UIFont systemFontOfSize:16];
    textNameLabel.textColor = [UIColor whiteColor];
    textNameLabel.frame = frame;
    return textNameLabel;
}



- (void)loginBtnClick
{
    
    if (self.pwd.text.length == 0) {
        [MBProgressHUD showError:@"请输入密码"];
    } else if(self.pwdAgain.text.length == 0){
        [MBProgressHUD showError:@"请再次输入密码"];
    }else{
        [self submitSuccess];
    }
    
}

-(void)submitSuccess
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    BKLogInViewController *logInController = [[BKLogInViewController alloc] init];
    BKNavigationController *navLogIn = [[BKNavigationController alloc] initWithRootViewController:logInController];
    window.rootViewController = navLogIn;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.pwd resignFirstResponder];
    [self.pwdAgain resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}
@end