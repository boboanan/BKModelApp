//
//  BKProfileController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/25.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKProfileForStarController.h"
#import "BKAccount.h"
#import "BKSetUpController.h"
#import "MyProfileForStarController.h"
#import "BKImageController.h"
#import "BKRequestListController.h"
#import "BKFinalListController.h"
#import "BKConfirmController.h"
#import "BKMyWalletViewController.h"
#import "BKMyAnounceController.h"

@interface BKProfileForStarController (){
    NSIndexPath *_selectedIndexPath;
}
@property (nonatomic, strong)NSMutableArray *listArray;
@property (nonatomic, strong)BKAccount *account;

@end

@implementation BKProfileForStarController

-(NSMutableArray *)listArray
{
    if(!_listArray){
        _listArray = [NSMutableArray array];
    }
    return _listArray;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
          self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.scrollEnabled = NO;
    
    [self initData];
    
}

-(void)initData
{
    NSArray *array1 =@[@"比尔盖茨"];
    [self.listArray addObject:array1];
    NSArray *array2 = @[@"我的资料",@"我的相册",@"认证"];
    [self.listArray addObject:array2];
    NSArray *array3 = @[@"我的通告",@"我的钱包"];
    [self.listArray addObject:array3];
    NSArray *array4 =@[@"设置"];
    [self.listArray addObject:array4];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.listArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.listArray[section] count];

}


#pragma mark返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSIndexPath是一个对象，记录了组和行信息
    
    //由于此方法调用十分频繁，cell的标示声明成静态变量有利于性能优化
    static NSString *cellIdentifier=@"UITableViewCellIdentifierKey";
    static NSString *cellIdentifierForFirstRow=@"UITableViewCellIdentifierKeyWithFirst";
    //首先根据标示去缓存池取
    UITableViewCell *cell;
    if (indexPath.section==0&&indexPath.row == 0) {
        cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifierForFirstRow];
    }else{
        cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
    }
    //如果缓存池没有取到则重新创建并放到缓存池中
    if(!cell){
        if (indexPath.section==0&&indexPath.row==0) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifierForFirstRow];
            UIView *view = [[UIView alloc] init];
            view.backgroundColor = [UIColor whiteColor];
            cell.selectedBackgroundView = view;
               cell.detailTextLabel.font = [UIFont systemFontOfSize:15];
        }else{
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
            cell.accessoryType= UITableViewCellAccessoryDisclosureIndicator;
            cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
            cell.textLabel.font = [UIFont systemFontOfSize:15];
        }
    }
    if(indexPath.section == 0&&indexPath.row==0){
        cell.imageView.image = [UIImage imageNamed:@"1.jpg"];
        cell.imageView.layer.cornerRadius = 10;
        cell.imageView.layer.masksToBounds = YES;
    }
    if(indexPath.section == 1){
        if(indexPath.row==0){
            cell.imageView.image = [UIImage imageNamed:@"data"];
        }else if(indexPath.row==1){
            cell.imageView.image = [UIImage imageNamed:@"album"];
        }else if(indexPath.row==2){
            cell.imageView.image = [UIImage imageNamed:@"authentication"];
        }
    }
    if(indexPath.section == 2){
        if(indexPath.row==0){
            cell.imageView.image = [UIImage imageNamed:@"application_form"];
        }else if(indexPath.row==1){
            cell.imageView.image = [UIImage imageNamed:@"wish_list"];
        }
    }
    if(indexPath.section == 3){
        if(indexPath.row==0){
            cell.imageView.image = [UIImage imageNamed:@"set_up"];
        }
    }
 
    
    NSArray *array = self.listArray[indexPath.section];
    cell.textLabel.text = array[indexPath.row];
    cell.detailTextLabel.text = array[indexPath.row];
   
    return cell;
    
}
#pragma mark - 代理方法
#pragma mark 设置分组标题内容高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 10;
            break;
      
        default:
            break;
    }
    return 5;
}

#pragma mark 设置每行高度（每行高度可以不一样）
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        return 100;
    }
    return 45;
}

#pragma mark 设置尾部说明内容高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
#pragma mark 点击行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _selectedIndexPath = indexPath;
    if(indexPath.section == 1){
        if (indexPath.row == 0) {
            MyProfileForStarController *myProfile = [[MyProfileForStarController alloc] init];
            myProfile.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:myProfile animated:YES];
        }else if(indexPath.row == 2){
            BKConfirmController *confirmController = [[BKConfirmController alloc] init];
             confirmController.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:confirmController animated:YES];
        }
    }
    if(indexPath.section == 3){
        BKSetUpController *setUpController = [[BKSetUpController alloc] init];
        setUpController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:setUpController animated:YES];
    }
    if(indexPath.section==1&&indexPath.row == 1){
        BKImageController *setUpController = [[BKImageController alloc] init];
        setUpController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:setUpController animated:YES];
    }
    if(indexPath.section==2){
        if(indexPath.row == 0){
            BKMyAnounceController *myAnounceController = [[BKMyAnounceController alloc] init];
            myAnounceController.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:myAnounceController animated:YES];
        }
        if(indexPath.row == 1){
            BKMyWalletViewController *myWalletViewController = [[BKMyWalletViewController alloc] init];
            myWalletViewController.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:myWalletViewController animated:YES];
        }

    }
}



- (NSIndexPath *)tableView:(UITableView *)tv willSelectRowAtIndexPath:(NSIndexPath *)path
{
    //根据 NSIndexPath判定行是否可选。
    
    if (path.row ==0&&path.section == 0)
    {
        return nil;
    }
    
    return path;
}

#pragma mark 重写状态样式方法
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
@end
