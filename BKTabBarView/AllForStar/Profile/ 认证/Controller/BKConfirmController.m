//
//  BKTableViewController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/23.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKConfirmController.h"
#import "BKAddBtnCell.h"
#import "BKConfirmDemoCell.h"

@interface BKConfirmController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak)UITableView *tableView;

/**底部按钮*/
@property (nonatomic, weak)UIButton *bottomBtn;

/**表格内容数组，固定模式,数组里数组*/
@property (nonatomic, strong) NSMutableArray *staticArrayForContent;
@end



@implementation BKConfirmController

-(UITableView *)tableView
{
    if(_tableView == nil){
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height - 64-self.bottomBtn.height) style:UITableViewStyleGrouped];
        tableView.showsVerticalScrollIndicator = NO;
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:tableView];
        self.tableView = tableView;
    }
    return _tableView;
}

////初始化tableview
//-(void)tableViewWithStyle:(UITableViewStyle)style
//{
//    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height - self.bottomBtn.height) style:style];
//    tableView.delegate = self;
//    tableView.dataSource = self;
//    [self.view addSubview:tableView];
//    [self staticArrayForContent];
//    self.tableView = tableView;
//}

/**底部按钮*/
-(UIButton *)bottomBtn
{
    if(_bottomBtn == nil){
        UIButton *bottomBtn = [[UIButton alloc] init];
        //设置尺寸
        CGFloat bottomBtnW = self.view.width;
        CGFloat bottomBtnH = self.view.height / 12;
        CGFloat bottomBtnX = 0;
        CGFloat bottomBtnY = self.view.height - bottomBtnH;
        bottomBtn.frame = CGRectMake(bottomBtnX, bottomBtnY, bottomBtnW, bottomBtnH);
        
        //初始化样式
        bottomBtn.backgroundColor = BKColorPink;
        [bottomBtn setTitle:@"提交认证" forState:UIControlStateNormal];
        [bottomBtn addTarget:self action:nil forControlEvents:UIControlEventTouchUpInside];
        bottomBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        //添加到view上
        [self.view addSubview:bottomBtn];
        
        _bottomBtn = bottomBtn;
    }
   
    
    return _bottomBtn;
}

//静态数组,设置内容
-(NSMutableArray *)staticArrayForContent
{
    if(_staticArrayForContent == nil)
    {
        _staticArrayForContent = [NSMutableArray arrayWithArray:@[@[@"认证状态",@"认证证件",@"证件号码"],@[@"上传证件照",@"点击上传",@"范例"]]];
    }
    return _staticArrayForContent;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"认证";

    [self tableView];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.staticArrayForContent.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.staticArrayForContent[section] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.textLabel.font = [UIFont systemFontOfSize:16];
    }
    if(indexPath.section == 1){
        if(indexPath.row == 1){
            return [BKAddBtnCell cellWithTableView:tableView];
        }else if (indexPath.row == 2){
            return [BKConfirmDemoCell cellWithTableView:tableView];
        }
    }
    cell.textLabel.text = self.staticArrayForContent[indexPath.section][indexPath.row];
    return cell;


}

//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 1){
        if(indexPath.row == 1){
            return 130;
        }else if(indexPath.row == 2){
            return 120;
        }
    }
    return 44;
}

#pragma tableview delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end