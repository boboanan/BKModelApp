//
//  BKSetUpController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/20.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKSetUpController.h"
#import "BKLogInViewController.h"

@interface BKSetUpController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak)UITableView *tableView;

@property (nonatomic, strong)NSMutableArray *listArray;
@property (nonatomic, weak) UIButton *logOutBtn;
@end


@implementation BKSetUpController

-(UITableView *)tableView
{
    if(!_tableView){
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height * 0.8) style:UITableViewStyleGrouped];
        tableView.dataSource = self;
        tableView.delegate = self;
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}


-(NSMutableArray *)listArray
{
    if(!_listArray){
        _listArray = [NSMutableArray array];
    }
    return _listArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BKColor(238, 238, 244, 1);
    
    [self tableView];
    
    [self initData];
    
    //退出登录按钮
    [self setUpContent];
}

//退出登录按钮
-(void)setUpContent
{
    CGFloat btnX = [UIScreen mainScreen].bounds.size.width * 0.1;
    CGFloat btnH = 40;
    CGFloat btnY = [UIScreen mainScreen].bounds.size.height - btnH*2;
    CGFloat btnW = [UIScreen mainScreen].bounds.size.width * 0.8;
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(btnX, btnY, btnW, btnH)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"退出登录" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(outOffLogIn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    
    self.logOutBtn = btn;
}

//退出登录按钮点击
-(void)outOffLogIn
{
    BKLogInViewController *logInViewController = [[BKLogInViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:logInViewController];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = nav;
}

-(void)initData
{
    NSArray *array1 =@[@"账号管理"];
    [self.listArray addObject:array1];
    NSArray *array2 = @[@"意见反馈",@"关于软件",@"联系我们"];
    [self.listArray addObject:array2];
    NSArray *array3 = @[@"清除缓存"];
    [self.listArray addObject:array3];
    
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
    
    //首先根据标示去缓存池取
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    //如果缓存池没有取到则重新创建并放到缓存池中
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        cell.accessoryType= UITableViewCellAccessoryDisclosureIndicator;
        
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
            return 0;
            break;
            
        default:
            break;
    }
    return 5;
}

#pragma mark 设置每行高度（每行高度可以不一样）
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        return 50;
    }
    return 45;
}

#pragma mark 设置尾部说明内容高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
#pragma mark 点击行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section == 3){
        BKSetUpController *setUpController = [[BKSetUpController alloc] init];
        [self.navigationController pushViewController:setUpController animated:YES];
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

#pragma mark 重写状态样式方法
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}



@end
