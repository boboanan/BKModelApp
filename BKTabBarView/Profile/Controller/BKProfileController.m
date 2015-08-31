//
//  BKProfileController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/25.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKProfileController.h"
#import "BKAccount.h"
#import "BKSetUpController.h"
#import "MyProfileController.h"
#import "BKImageController.h"
#import "BKRequestListController.h"
#import "BKFinalListController.h"

@interface BKProfileController (){
    NSIndexPath *_selectedIndexPath;
}
@property (nonatomic, strong)NSMutableArray *listArray;
@property (nonatomic, strong)BKAccount *account;

@end

@implementation BKProfileController

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
    
    [self initData];
    self.tableView.scrollEnabled = NO;
}

-(void)initData
{
    NSArray *array1 =@[@"比尔盖茨"];
    [self.listArray addObject:array1];
    NSArray *array2 = @[@"我的资料",@"我的相册",@"认证",@"我的优惠"];
    [self.listArray addObject:array2];
    NSArray *array3 = @[@"报名表",@"我的心愿单",@"我的评价"];
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


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
////    static NSString *ID = @"cell";
////    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
////    if(!cell){
////        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
////    }
//    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
//    NSArray *array = self.listArray[indexPath.section];
//    cell.textLabel.text = array[indexPath.row];
//    return cell;
//}
//#pragma mark返回每行的单元格
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    //NSIndexPath是一个对象，记录了组和行信息
//  
//    //由于此方法调用十分频繁，cell的标示声明成静态变量有利于性能优化
//    static NSString *cellIdentifier=@"UITableViewCellIdentifierKey1";
//    static NSString *cellIdentifierForFirstRow=@"UITableViewCellIdentifierKeyWithSwitch";
//    //首先根据标示去缓存池取
//    UITableViewCell *cell;
//    if (indexPath.row==0) {
//        cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifierForFirstRow];
//    }else{
//        cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    }
//    //如果缓存池没有取到则重新创建并放到缓存池中
//    if(!cell){
//        if (indexPath.row==0) {
//            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifierForFirstRow];
//            UISwitch *sw=[[UISwitch alloc]init];
//            [sw addTarget:self action:@selector(switchValueChange:) forControlEvents:UIControlEventValueChanged];
//            cell.accessoryView=sw;
//            sw.on = YES;
//        }else{
//            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
//            cell.accessoryType=UITableViewCellAccessoryDetailButton;
//        }
//    }
//    
//    if(indexPath.row==0){
//        ((UISwitch *)cell.accessoryView).tag=indexPath.section;
//    }
//    
//
//    NSArray *array = self.listArray[indexPath.section];
//    cell.textLabel.text = array[indexPath.row];
//    cell.detailTextLabel.text = array[indexPath.row];
//    
//    return cell;
//}
//#pragma mark 切换开关转化事件
//-(void)switchValueChange:(UISwitch *)sw{
//    BKLog(@"section:%i,switch:%i",sw.tag, sw.on);
//}

//#pragma mark 返回每组标题索引
//-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
//  
//    NSMutableArray *indexs=@[@"a",@"b",@"c"];
//  
//    return indexs;
//}

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
        }else if(indexPath.row==3){
            cell.imageView.image = [UIImage imageNamed:@"discount"];
        }
    }
    if(indexPath.section == 2){
        if(indexPath.row==0){
            cell.imageView.image = [UIImage imageNamed:@"application_form"];
        }else if(indexPath.row==1){
            cell.imageView.image = [UIImage imageNamed:@"wish_list"];
        }else if (indexPath.row == 2){
            cell.imageView.image = [UIImage imageNamed:@"evaluate"];
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

//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    if(section == 0){
//        return 30;
//    }else if (section == 1){
//        return 40;
//    }else if (section == 2){
//        return 40;
//    }else if (section == 3){
//        return 40;
//    }
//    return 40;
//}

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
    if(indexPath.section == 1&&indexPath.row == 0){
        MyProfileController *myProfile = [[MyProfileController alloc] init];
        myProfile.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:myProfile animated:YES];
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
            BKRequestListController *requestListController = [[BKRequestListController alloc] init];
            requestListController.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:requestListController animated:YES];
        }
        if(indexPath.row == 1){
            BKFinalListController *finalListController = [[BKFinalListController alloc] init];
            finalListController.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:finalListController animated:YES];
        }

    }
}

//#pragma mark 点击行
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//   _selectedIndexPath = indexPath;
//    NSArray *array = self.listArray[indexPath.section];
//   NSString *text = array[indexPath.row];
//
//    //创建弹出窗口
//    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"System Info" message:text delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
//    alert.alertViewStyle=UIAlertViewStylePlainTextInput; //设置窗口内容样式
//    UITextField *textField= [alert textFieldAtIndex:0]; //取得文本框
//    textField.text=text; //设置文本框内容
//    [alert show]; //显示窗口
//}

//#pragma mark 窗口的代理方法，用户保存数据
//-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//    //当点击了第二个按钮（OK）
//    if (buttonIndex==1) {
//        UITextField *textField= [alertView textFieldAtIndex:0];
//        NSArray *array = self.listArray[_selectedIndexPath.section];
//      //=textField.text;
//        //刷新表格
//        [self.tableView reloadData];
//    }
//}
//#pragma mark 窗口的代理方法，用户保存数据
//-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//    //当点击了第二个按钮（OK）
//    if (buttonIndex==1) {
//        UITextField *textField= [alertView textFieldAtIndex:0];
//        //修改模型数据
//        KCContactGroup *group=_contacts[_selectedIndexPath.section];
//        KCContact *contact=group.contacts[_selectedIndexPath.row];
//        contact.phoneNumber=textField.text;
//        //刷新表格
//        NSArray *indexPaths=@[_selectedIndexPath];//需要局部刷新的单元格的组、行
//        [_tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationLeft];//后面的参数代表更新时的动画
//    }
//}



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
