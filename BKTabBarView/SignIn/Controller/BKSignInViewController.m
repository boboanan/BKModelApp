//
//  BKSignInViewController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/23.
//  Copyright (c) 2015年 B&K. All rights reserved.
//


#import "BKSignInViewController.h"

#import "BKInputTextField.h"
#import "BKLogInViewController.h"
#import "MBProgressHUD+MJ.h"
#import "BKLogInViewController.h"
#import "BKNavigationController.h"
#import "BKSignInAController.h"
#import "BKClauseViewController.h"
#import <SMS_SDK/SMS_SDK.h>

#define SeparationDistance 10

@interface BKSignInViewController ()<UITextFieldDelegate>

//手机号
@property (nonatomic, weak)UITextField *tel;

//验证码
@property (nonatomic, weak)UITextField *confirm;

//密码
@property (nonatomic, weak)UITextField *pwd;

//重复密码
@property (nonatomic, weak)UITextField *pwdAgain;

//注册按钮
@property (nonatomic, weak)UIButton *signInBtn;

//发送验证码按钮
@property (nonatomic,weak)UIButton *sengConfirm;


@property (nonatomic, weak)UIImageView *bgImage;
@end

@implementation BKSignInViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
     self.navigationItem.title = @"注册";
    
    //设置输入框
    [self setupInput];
    
    //设置注册按钮
    [self buttonSetUp];
    
    
    //设置导航栏左侧登录按钮
    [self setUpNavBtn];
    
}

-(void)setUpNavBtn{
    //设置导航栏登录按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"登录" style:UIBarButtonItemStyleBordered target:self action:@selector(intoLogIn) ];
}

-(void)intoLogIn
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    BKLogInViewController *logInController = [[BKLogInViewController alloc] init];
    BKNavigationController *navLogIn = [[BKNavigationController alloc] initWithRootViewController:logInController];
    window.rootViewController = navLogIn;
}

//设置输入框
- (void)setupInput
{
    //手机号textfiled
    CGFloat userY = 30 + NavigationBarHeight;
    self.tel = [self textfieldWithPositionY:userY Icon:@"person_image" placeholdertext:@"请输入手机号" KeyboardType:UIKeyboardTypeNumberPad];
   
    //验证码textfiled
    CGFloat confirmY = CGRectGetMaxY(self.tel.frame) + SeparationDistance;
     self.confirm = [self textfieldWithPositionY:confirmY Icon:@"phone"  placeholdertext:@"请输入验证码" KeyboardType:UIKeyboardTypeNumberPad];
    
    [self addConfirmBtn];
  
    //登录密码textfiled
    CGFloat pwdY = CGRectGetMaxY(self.confirm.frame) + SeparationDistance;
    self.pwd = [self textfieldWithPositionY:pwdY Icon:@"password" placeholdertext:@"请输入密码" KeyboardType:UIKeyboardTypeDefault];
    [self.pwd setSecureTextEntry:YES];
    
    //重复密码textfiled
    CGFloat pwdAgainY = CGRectGetMaxY(self.pwd.frame) + SeparationDistance;
    self.pwdAgain = [self textfieldWithPositionY:pwdAgainY Icon:@"password" placeholdertext:@"再次输入密码" KeyboardType:UIKeyboardTypeDefault];
    [self.pwdAgain setSecureTextEntry:YES];
    
    //阅读条约按钮
    UILabel *labelForSignIn = [[UILabel alloc] init];
    labelForSignIn.width = 100;
    labelForSignIn.height = 30;
    labelForSignIn.x = self.pwdAgain.x;
    labelForSignIn.y = CGRectGetMaxY(self.pwdAgain.frame) + 5;
    labelForSignIn.text = @"我已经阅读并同意";
    labelForSignIn.font = [UIFont systemFontOfSize:12];
    labelForSignIn.textColor = [UIColor blackColor];
    [self.view addSubview:labelForSignIn];
    
    UIButton *btnForSignIn = [[UIButton alloc] init];
    btnForSignIn.width = 140;
    btnForSignIn.height = 30;
    btnForSignIn.x = CGRectGetMaxX(labelForSignIn.frame);
    btnForSignIn.y = labelForSignIn.y;
    [btnForSignIn setTitle:@"使用条款个隐私政策" forState:UIControlStateNormal];
    btnForSignIn.titleLabel.font = [UIFont systemFontOfSize:12];
    [btnForSignIn setTitleColor:BKColorBlue forState:UIControlStateNormal];
    [btnForSignIn addTarget:self action:@selector(showClause) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnForSignIn];

}

//展示条款
-(void)showClause
{
    BKClauseViewController *clauseViewController = [[BKClauseViewController alloc] init];
    [self.navigationController pushViewController:clauseViewController animated:YES];
}

//添加验证按钮
-(void)addConfirmBtn
{
    
    
    UIButton *btnConfirm = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.confirm.width / 3, self.confirm.height)];
    btnConfirm.backgroundColor = BKColor(70, 119, 214, 0.5);
    [btnConfirm setTitle:@"发送验证码" forState:UIControlStateNormal];
    self.sengConfirm = btnConfirm;
    [btnConfirm addTarget:self action:@selector(sendSMS) forControlEvents:UIControlEventTouchUpInside];
    
    btnConfirm.titleLabel.font = [UIFont systemFontOfSize:15];
    self.confirm.rightView = btnConfirm;
    self.confirm.rightViewMode = UITextFieldViewModeAlways;
    
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


//发送验证码,gdc处理验证码倒计
-(void)sendSMS
{
   
    if (self.tel.text.length!=11)
    {
        //手机号码不正确
        [MBProgressHUD showError:@"手机号码输入错误"];
        return;
    }
    
    //发送验证码按钮倒计时
    [self sengConfirmBtnStarTime];
    
    NSString* str2 = @"86";
    
    
    [SMS_SDK getVerificationCodeBySMSWithPhone:self.tel.text
                                          zone:str2
                                        result:^(SMS_SDKError *error)
     {
         if (!error)
         {
             [MBProgressHUD showSuccess:@"验证码发送成功"];
         }
         else
         {
             [MBProgressHUD showError:@"验证码发送失败"];
         }
         
     }];
}

//发送验证码按钮倒计时
-(void)sengConfirmBtnStarTime
{
    __block int timeout = 30; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                self.sengConfirm.titleLabel.font = [UIFont systemFontOfSize:15];
                [self.sengConfirm setTitle:@"发送验证码" forState:UIControlStateNormal];
                self.sengConfirm.userInteractionEnabled = YES;
            });
        }else{
            //            int minutes = timeout / 60;
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self.sengConfirm setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
                self.sengConfirm.titleLabel.font = [UIFont systemFontOfSize:10];
                self.sengConfirm.userInteractionEnabled = NO;
                
            });
            timeout--;
            
        }
    });
    dispatch_resume(_timer);
}

//设置注册按钮
-(void)buttonSetUp
{
    
    UIButton *signInBtn = [[UIButton alloc] init];
    signInBtn.width = 232;
    signInBtn.height = 40;
    signInBtn.centerX = self.view.width * 0.5;
    signInBtn.y = CGRectGetMaxY(self.pwdAgain.frame) + 50;
    signInBtn.layer.cornerRadius = 5;
    [signInBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [signInBtn setBackgroundImage:[UIImage imageNamed:@"pink"] forState:UIControlStateNormal];
    [signInBtn addTarget:self action:@selector(NextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signInBtn];
    self.signInBtn = signInBtn;
    
}



//下一步按钮点击时
- (void)NextBtnClick
{
    
    if (self.tel.text.length != 11) {
        [MBProgressHUD showError:@"请输入手机号"];
    } else if(self.confirm.text.length != 4){
        [MBProgressHUD showError:@"验证码输入错误"];
    }else if(self.pwd.text.length == 0){
        [MBProgressHUD showError:@"请输入密码"];
    }else if(self.pwdAgain.text.length == 0){
        [MBProgressHUD showError:@"请重新输入密码"];
    }else if( ![self.pwdAgain.text isEqualToString:self.pwd.text]){
        [MBProgressHUD showError:@"密码输入错误"];
    }else{
        //验证码是否正确
        [self confirmSMS];
    }
}

//验证码是否正确
-(void)confirmSMS
{
        [SMS_SDK commitVerifyCode:self.confirm.text result:^(enum SMS_ResponseState state) {
            if (1 == state)
            {
//                BKLog(@"验证成功");
//                NSString* str = [NSString stringWithFormat:NSLocalizedString(@"成功", nil)];
//                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"验证成功", nil)
//                                                                message:str
//                                                               delegate:self
//                                                      cancelButtonTitle:NSLocalizedString(@"确定", nil)
//                                                      otherButtonTitles:nil, nil];
//                [alert show];
                [MBProgressHUD showSuccess:@"验证成功"];
                [self sendSignInMessageAndReturn];
            }
            else if(0 == state)
            {
                BKLog(@"验证失败");
                NSString* str = [NSString stringWithFormat:NSLocalizedString(@"验证失败", nil)];
                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"错误", nil)
                                                                message:str
                                                               delegate:self
                                                      cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                                      otherButtonTitles:nil, nil];
                [alert show];
            }
        }];
        

}



-(void)sendSignInMessageAndReturn
{
#warning 测试
//    self.pwd.text = [self.pwd.text md5String];
//    self.pwdAgain.text = [self.pwdAgain.text md5String];
//   
//    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/MJServer/login?"];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    request.HTTPMethod = @"POST";
//    
//    //设置超时
//    request.timeoutInterval = 30;
//    
//    NSString *param = [NSString stringWithFormat:@"username=%@&pwd=%@",self.tel.text,self.pwd.text];
//    request.HTTPBody = [param dataUsingEncoding:NSUTF8StringEncoding];
//    
//    BKLog(@"%@",request);
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        if(data == nil || connectionError) return;
//        
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//        NSString *error = dict[@"error"];
//        if(error){
//            [MBProgressHUD showError:error];
//        }else{
//            NSString *sucess = dict[@"sucess"];
//            [MBProgressHUD showSuccess:sucess];
//            [self SignInSuccess];
//        }
//    }];
    [self SignInSuccess];
}

//注册成功时
-(void)SignInSuccess
{
    BKSignInAController *signInAController = [[BKSignInAController alloc] init];
    [self.navigationController pushViewController:signInAController animated:YES];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.tel resignFirstResponder];
    [self.confirm resignFirstResponder];
    [self.pwd resignFirstResponder];
    [self.pwdAgain resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}
@end
