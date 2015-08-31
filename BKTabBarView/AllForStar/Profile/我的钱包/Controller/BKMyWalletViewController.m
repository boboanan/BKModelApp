//
//  BKMyWalletViewController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/25.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKMyWalletViewController.h"
#import "BKMyWalletCell.h"

@interface BKMyWalletViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak)UITableView *tableView;

/**底部按钮*/
@property (nonatomic, weak)UIButton *bottomBtn;

/**表格内容数组*/
@property (nonatomic, strong) NSMutableArray *arrayForContent;
@end



@implementation BKMyWalletViewController

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
        [bottomBtn setTitle:@"总进账：0元" forState:UIControlStateNormal];
        [bottomBtn addTarget:self action:nil forControlEvents:UIControlEventTouchUpInside];
        bottomBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        //添加到view上
        [self.view addSubview:bottomBtn];
        
        _bottomBtn = bottomBtn;
    }
    
    
    return _bottomBtn;
}

//静态数组,设置内容
-(NSMutableArray *)arrayForContent
{
    if(_arrayForContent == nil)
    {
        _arrayForContent = [NSMutableArray arrayWithArray:@[@"1",@"2"]];
    }
    return _arrayForContent;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"我的钱包";
    
    [self tableView];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arrayForContent.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BKMyWalletCell *cell = [BKMyWalletCell cellWithTableView:tableView];
    if(indexPath.row == 0){
        cell.isGotMoney.highlighted = NO;
    }else{
        cell.isGotMoney.highlighted = YES;
    }
    
    return cell;
}



//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 100;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
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