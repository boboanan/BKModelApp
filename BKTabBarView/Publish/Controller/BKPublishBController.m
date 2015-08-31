//
//  BKPublishBController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/27.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKPublishBController.h"
#import "CalendarViewController.h"
#import "BKProfileController.h"
#import "BKPublishCController.h"
#import "BKPublishACell.h"

@interface BKPublishBController ()
@property (nonatomic, strong)NSArray *listArray;

@property(nonatomic, strong)NSMutableArray *detailListArray;
@end


@implementation BKPublishBController

-(NSArray *)listArray
{
    if(!_listArray){
        _listArray = @[@"",@"通告日期",@"通告时段",@"工作城市",@"详细地址"];
    }
    return _listArray;
}

-(NSMutableArray *)detailListArray
{
    if(_detailListArray == nil){
        _detailListArray = [NSMutableArray arrayWithArray:@[@"",@"请输入日期",@"",@"杭州",@"请输入详细地址"]];
    }
    return _detailListArray;
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
    
    [self setNav];
}

-(void)setNav
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"上一步" style:UIBarButtonItemStyleDone target:self action:@selector(cancell)];
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithTitle:@"下一步" style:UIBarButtonItemStyleDone target:self action:@selector(next)];
    //rightBarBtn.enabled = NO;
    self.navigationItem.rightBarButtonItem = rightBarBtn;
    
    
    
    UILabel *titleView = [[UILabel alloc] init];
    titleView.width = 200;
    titleView.height = 44;
    titleView.textAlignment = NSTextAlignmentCenter;
    //自动换行
    titleView.numberOfLines = 0;
    titleView.text = @"时间地点";
    titleView.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = titleView;
}


-(void)cancell
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)next
{
    BKPublishCController *publishCController = [[BKPublishCController alloc] init];
    publishCController.publishInfo = self.publishInfo;
    [self.navigationController pushViewController:publishCController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.listArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section==0&&indexPath.row == 0){
        BKPublishACell *imageCell =[BKPublishACell cellWithTableView:tableView];
        imageCell.imageView.image = [UIImage imageNamed:@"publish_b"];
        return imageCell;
    }
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        cell.accessoryType =   UITableViewCellAccessoryDisclosureIndicator;
        if(indexPath.row == 2){
           cell.accessoryView = [self startAndEndView];
        }
    }
    cell.textLabel.text = self.listArray[indexPath.row];
    
    cell.detailTextLabel.text = self.detailListArray[indexPath.row];

   
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}

//通告时段，开始时间结束时间按钮
-(UIView *)startAndEndView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 140, 40)];
    view.backgroundColor = [UIColor whiteColor];
    UIButton *btnStart = [[UIButton alloc] initWithFrame:CGRectMake(0, 2, 60, 35)];
    btnStart.layer.borderColor = BKColorPink.CGColor;
    btnStart.layer.borderWidth = 2;
    btnStart.layer.cornerRadius = 5;
    btnStart.backgroundColor = [UIColor whiteColor];
    [btnStart setTitle:@"开始时间" forState:UIControlStateNormal];
    [btnStart setTitleColor:BKColorPink forState:UIControlStateNormal];
    [btnStart addTarget:self action:@selector(startTime) forControlEvents:UIControlEventTouchUpInside];
    btnStart.titleLabel.font = [UIFont systemFontOfSize:12];
    [view addSubview:btnStart];
    
    
    UIButton *btnEnd = [[UIButton alloc] initWithFrame:CGRectMake(80, 2, 60, 35)];
    btnEnd.layer.borderColor = BKColorPink.CGColor;
    btnEnd.layer.borderWidth = 2;
    btnEnd.layer.cornerRadius = 5;
    btnEnd.backgroundColor = [UIColor whiteColor];
    [btnEnd setTitle:@"结束时间" forState:UIControlStateNormal];
    [btnEnd addTarget:self action:@selector(endTime) forControlEvents:UIControlEventTouchUpInside];
    [btnEnd setTitleColor:BKColorPink forState:UIControlStateNormal];
    btnEnd.titleLabel.font = [UIFont systemFontOfSize:12];
    [view addSubview:btnEnd];
   
    return view;
}

-(void)startTime
{
    
}

-(void)endTime
{
    
}

//#pragma mark 窗口的代理方法，用户保存数据
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    //当点击了第二个按钮（OK）
    if (buttonIndex==1) {
        UITextField *textField= [alertView textFieldAtIndex:0];
        self.publishInfo.address = textField.text;
        //刷新表格
        [self.tableView reloadData];
    }
}

#pragma tableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if(indexPath.row == 3){
        //创建弹出窗口
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"System Info" message:@"请输入地址" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        alert.alertViewStyle=UIAlertViewStylePlainTextInput; //设置窗口内容样式
        UITextField *textField= [alert textFieldAtIndex:0]; //取得文本框
        textField.text=@""; //设置文本框内容
        [alert show]; //显示窗口
    }
    if(indexPath.row == 0){
        CalendarViewController *recent_action = [[CalendarViewController alloc] init];
        [self.navigationController pushViewController:recent_action animated:YES];
    }
}

- (NSIndexPath *)tableView:(UITableView *)tv willSelectRowAtIndexPath:(NSIndexPath *)path
{
    //根据 NSIndexPath判定行是否可选。
    if ((path.row ==1||path.row ==4)&&path.section == 0)
    {
        return path;
    }
    
    return nil;
}

@end
