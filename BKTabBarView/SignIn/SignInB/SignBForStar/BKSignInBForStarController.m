//
//  BKSignInBForStarController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/19.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKSignInBForStarController.h"
#import "BKInputTextField.h"
#import "BKLogInViewController.h"
#import "UzysAssetsPickerController.h"

#define BKNotificationCenter [NSNotificationCenter defaultCenter]
#define ContentMargin 20
@interface BKSignInBForStarController ()<UzysAssetsPickerControllerDelegate, UITextFieldDelegate>
#warning 测试用
@property (nonatomic, weak)UITextField *textField;

@property (nonatomic, weak)UIButton *starImageBtn;

@end

@implementation BKSignInBForStarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BKColorBlue;
    
    //设置导航栏
    [self setNav];
  
    //设置界面
    [self setUpContent];
}

//设置界面
-(void)setUpContent
{
    //设置头像
    CGFloat starImageBtnWH = 100;
    UIButton *starImageBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, starImageBtnWH, starImageBtnWH)];
    [starImageBtn setBackgroundImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
    [starImageBtn addTarget:self action:@selector(addImagebtnClick) forControlEvents:UIControlEventTouchUpInside];
    starImageBtn.centerX = self.view.width / 2;
    starImageBtn.y = 100;
    starImageBtn.layer.cornerRadius = 15;
    starImageBtn.layer.masksToBounds = YES;
    [self.view addSubview:starImageBtn];
    self.starImageBtn = starImageBtn;
    
    //输入姓名
    CGFloat centerX = self.view.width * 0.5;
    CGFloat userY = CGRectGetMaxY(self.starImageBtn.frame) + ContentMargin;
    UITextField *textField = [BKInputTextField setupWithIcon:@"tabbar_profile_selected" posotionY:userY centerX:centerX placeholdertext:@"请输入姓名"];
    [textField setReturnKeyType:UIReturnKeyDone];
    textField.delegate  = self;
    [textField setReturnKeyType:UIReturnKeyNext];
    [self.view addSubview:textField];
    self.textField = textField;
    

    
    //监听通知
    [BKNotificationCenter addObserver:self selector:@selector(textDidChange) name:UITextFieldTextDidChangeNotification object:self.textField];
}

//添加头像
-(void)addImagebtnClick
{
    //配置图片picker样式
    UzysAppearanceConfig *appearanceConfig = [[UzysAppearanceConfig alloc] init];
    appearanceConfig.finishSelectionButtonColor = BKColor(94, 158, 249, 1);
    appearanceConfig.assetsGroupSelectedImageName = @"checker";
    [UzysAssetsPickerController setUpAppearanceConfig:appearanceConfig];
    
    //pick初始化
    UzysAssetsPickerController *picker = [[UzysAssetsPickerController alloc] init];
    picker.delegate = self;
    picker.maximumNumberOfSelectionVideo = 0;
    picker.maximumNumberOfSelectionPhoto = 1;
    [self presentViewController:picker animated:YES completion:^{
    }];

}




-(void)dealloc
{
    [BKNotificationCenter removeObserver:self];
}
/**
 监听文字改变*/
-(void)textDidChange
{
    self.navigationItem.rightBarButtonItem.enabled = self.textField.hasText;
}


//设置导航栏
-(void)setNav
{

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(rightButtonClick)];
    
    self.navigationItem.rightBarButtonItem.enabled = NO;
}

//完成按钮点击
-(void)rightButtonClick
{
    BKLogInViewController *logInViewController = [[BKLogInViewController alloc] init];
    [self.navigationController pushViewController:logInViewController animated:YES];
}

//回收键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.textField resignFirstResponder];
  
}

#pragma UitextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.textField resignFirstResponder];
    
    return YES;
}

#pragma mark -- uzysAssetsPickerController Delegate
//图片picker代理方法
- (void)uzysAssetsPickerController:(UzysAssetsPickerController *)picker didFinishPickingAssets:(NSArray *)assets
{
    __weak typeof(self) weakSelf = self;
    if([[assets[0] valueForProperty:@"ALAssetPropertyType"] isEqualToString:@"ALAssetTypePhoto"]) //Photo
    {
        [assets enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            ALAsset *representation = obj;
            
            UIImage *img = [UIImage imageWithCGImage:representation.defaultRepresentation.fullResolutionImage
                                               scale:representation.defaultRepresentation.scale
                                         orientation:(UIImageOrientation)representation.defaultRepresentation.orientation];
            //将图片添加进数组
            [weakSelf.starImageBtn setBackgroundImage:img forState:UIControlStateNormal];
            
            *stop = YES;
        }];
        
        
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
