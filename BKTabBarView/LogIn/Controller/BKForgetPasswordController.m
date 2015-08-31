//
//  BKForgetPasswordController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/12.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKForgetPasswordController.h"

#import "BKInputTextField.h"
#import "BKTabBarController.h"
#import "BKLogInViewController.h"
#import "MBProgressHUD+MJ.h"
#import "BKLogInViewController.h"
#import "BKNavigationController.h"
#import "BKNewPasswordController.h"
#import <SMS_SDK/SMS_SDK.h>

#define SeparationDistance 16
@interface BKForgetPasswordController ()<UITextFieldDelegate>

//手机号
@property (nonatomic, weak)UITextField *tel;

//验证码
@property (nonatomic, weak)UITextField *confirm;

//下一步按钮
@property (nonatomic, weak)UIButton *loginBtn;

//发送验证码按钮
@property (nonatomic,weak)UIButton *sengConfirm;


@property (nonatomic, weak)UIImageView *bgImage;
@end

@implementation BKForgetPasswordController


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
    
    //手机号textfiled
    CGFloat userY = 30 + 64;
    self.tel = [self textfieldWithPositionY:userY Icon:@"person_image" placeholdertext:@"请输入手机号" KeyboardType:UIKeyboardTypeNumberPad];
    
    //验证码textfiled
    CGFloat confirmY = CGRectGetMaxY(self.tel.frame) + SeparationDistance;
    self.confirm = [self textfieldWithPositionY:confirmY Icon:@"phone"  placeholdertext:@"请输入验证码" KeyboardType:UIKeyboardTypeNumberPad];
    
    [self addConfirmBtn];
}


//设置下一步按钮
-(void)buttonSetUp
{
    
    UIButton *nextBtn = [[UIButton alloc] init];
    nextBtn.width = 232;
    nextBtn.height = 40;
    nextBtn.centerX = self.view.width * 0.5;
    nextBtn.y = CGRectGetMaxY(self.confirm.frame) + 20;
    nextBtn.layer.cornerRadius = 5;
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [nextBtn setBackgroundImage:[UIImage imageNamed:@"pink"] forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
    self.loginBtn = nextBtn;
    
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


//gdc处理验证码倒计时
-(void)startTime{
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


//验证码是否正确
-(void)confirmSMS
{
    [SMS_SDK commitVerifyCode:self.confirm.text result:^(enum SMS_ResponseState state) {
        if (1 == state)
        {
            [MBProgressHUD showSuccess:@"验证成功"];
            [self nextSuccess];
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



- (void)nextBtnClick
{
    
    if (self.tel.text.length == 0) {
        [MBProgressHUD showError:@"请输入手机号"];
    } else if(self.confirm.text.length == 0){
        [MBProgressHUD showError:@"请输入验证码"];
    }else{
        [self confirmSMS];
    }
    
}

-(void)nextSuccess
{
    BKNewPasswordController *passwordController = [[BKNewPasswordController alloc] init];
    [self.navigationController pushViewController:passwordController animated:YES];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.tel resignFirstResponder];
    [self.confirm resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}
@end