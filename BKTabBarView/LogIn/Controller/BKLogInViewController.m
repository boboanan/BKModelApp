//
//  BKLogInViewController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/23.
//  Copyright (c) 2015年 B&K. All rights reserved.
//  登陆页面

#import "BKLogInViewController.h"
#import "BKInputTextField.h"
#import "BKTabBarController.h"
#import "MBProgressHUD+MJ.h"
#import "AFNetworking.h"
#import "BKAccount.h"
#import "BKSignInViewController.h"
#import "BKNavigationController.h"
#import "BKForgetPasswordController.h"
#import "BKTabBarForStarController.h"
#define SeparationDistance 16
@interface BKLogInViewController ()<UITextFieldDelegate>

//手机号
@property (nonatomic, weak)UITextField *userText;

//密码
@property (nonatomic, weak)UITextField *passwordText;

//登录按钮
@property (nonatomic, weak)UIButton *loginBtn;
//注册按钮
@property (nonatomic,weak)UIButton *signinBtn;

//忘记密码
@property (nonatomic,weak)UIButton *forgetPassword;


@property (nonatomic, weak)UIImageView *bgImage;
@end


@implementation BKLogInViewController


- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"登录";
    //设置输入框
    [self setupInput];
    
    //设置登录按钮
    [self buttonSetUp];
    
    
    //设置导航栏按钮
    [self setUpNavBtn];
}


//设置登录按钮
-(void)buttonSetUp
{
    //登录按钮
    UIButton *loginBtn = [[UIButton alloc] init];
    loginBtn.width = 232;
    loginBtn.height = 40;
    loginBtn.centerX = self.view.width * 0.5;
    loginBtn.y = CGRectGetMaxY(self.passwordText.frame) + 20;
    loginBtn.layer.cornerRadius = 5;
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"pink"] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    self.loginBtn = loginBtn;
    
}

//设置导航栏按钮
-(void)setUpNavBtn{
    //设置导航栏注册按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStyleBordered target:self action:@selector(intoSignIn)];
    
    
    //设置导航栏忘记密码按钮

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"忘记密码" style:UIBarButtonItemStyleBordered target:self action:@selector(forgetBtnClick)];
}

//忘记密码按钮click方法
-(void)forgetBtnClick
{
    BKForgetPasswordController *forgetPasswordController = [[BKForgetPasswordController alloc] init];
    [self.navigationController pushViewController:forgetPasswordController animated:YES];
}


//注册按钮click方法
-(void)intoSignIn
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    BKSignInViewController *signInController = [[BKSignInViewController alloc] init];
    BKNavigationController *navSignIn = [[BKNavigationController alloc] initWithRootViewController:signInController];
    window.rootViewController = navSignIn;
    
}


//设置输入框
- (void)setupInput
{
    
    //昵称框textfield
    CGFloat userY = 30 + 64;
//    self.userText = [self textfieldWithPositionY:userY Icon:@"tabbar_profile_selected" placeholdertext:@"请输入手机号" KeyboardType:UIKeyboardTypeNumberPad];
    self.userText = [self textfieldWithPositionY:userY Icon:@"person_image" placeholdertext:@"请输入手机号" KeyboardType:UIKeyboardTypeNumberPad];
    
    //密码框textfiled
    CGFloat passwordY = CGRectGetMaxY(self.userText.frame) + SeparationDistance;
//      self.passwordText = [self textfieldWithPositionY:passwordY Icon:@"tabbar_home_selected" placeholdertext:@"请输入密码" KeyboardType:UIKeyboardTypeDefault];
      self.passwordText = [self textfieldWithPositionY:passwordY Icon:@"password" placeholdertext:@"请输入密码" KeyboardType:UIKeyboardTypeDefault];
      [self.passwordText setSecureTextEntry:YES];
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


//- (UILabel *)setupTextName:(NSString *)textName frame:(CGRect)frame
//{
//    UILabel *textNameLabel = [[UILabel alloc] init];
//    textNameLabel.text = textName;
//    textNameLabel.font = [UIFont systemFontOfSize:16];
//    textNameLabel.textColor = [UIColor whiteColor];
//    textNameLabel.frame = frame;
//    return textNameLabel;
//}

- (void)loginBtnClick
{
    
    if (self.userText.text.length == 0) {
       [MBProgressHUD showError:@"请输入手机号"];
    } else if(self.passwordText.text.length == 0){
        [MBProgressHUD showError:@"请输入密码"];
    }else if (self.userText.text.length != 0 && self.passwordText.text.length != 0){
//        [MBProgressHUD showMessage:@"正在拼命登录中..."];
        [self sendLoginMessageAndReturn];
    }

}

//登录发送信息
-(void)sendLoginMessageAndReturn
{
#warning 测试

//    self.passwordText.text = [self.passwordText.text md5String];
////    
//    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/MJServer/login?"];
////     NSURL *url = [NSURL URLWithString:@"http://localhost:8000/admin/?"];
//    
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    request.HTTPMethod = @"POST";
//    
//    //设置超时
//    request.timeoutInterval = 30;
//    
//    NSString *param = [NSString stringWithFormat:@"username=%@&pwd=%@",self.userText.text,self.passwordText.text];
//    request.HTTPBody = [param dataUsingEncoding:NSUTF8StringEncoding];
//    
//  
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        if(data == nil || connectionError){
//            [MBProgressHUD hideHUD];
//            [MBProgressHUD showError:@"登录失败"];
//            return;
//        }
//        
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//        NSString *error = dict[@"error"];
//        if(error){
//            [MBProgressHUD hideHUD];
//            [MBProgressHUD showError:error];
//        }else{
//            [MBProgressHUD hideHUD];
//            NSString *sucess = dict[@"sucess"];
//            [MBProgressHUD showSuccess:sucess];
//            [self LoginSuccess];
//            
//        }
//    }];
    [self LoginSuccess];
}
#warning 测试方法
//登录成功时
-(void)LoginSuccess
{
    if([self.userText.text isEqualToString:@"18957146707"]){
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        window.rootViewController = [[BKTabBarController alloc] init];
    }else{
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        window.rootViewController = [[BKTabBarForStarController alloc] init];
    }
}

//取消键盘方法
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.userText resignFirstResponder];
    [self.passwordText resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}
@end
