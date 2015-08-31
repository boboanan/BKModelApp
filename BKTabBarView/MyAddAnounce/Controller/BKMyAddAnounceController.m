//
//  BKMyAddAnounceController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/25.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKMyAddAnounceController.h"
#import "BKMyAnounceCell.h"
#import "BKMyAddAnounceCell.h"


@interface BKMyAddAnounceController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak)UITableView *tableView;

/**表格内容数组*/
@property (nonatomic, strong) NSMutableArray *arrayForContent;
@end




@implementation BKMyAddAnounceController

-(UITableView *)tableView
{
    if(_tableView == nil){
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStyleGrouped];
        tableView.showsVerticalScrollIndicator = NO;
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:tableView];
        self.tableView = tableView;
    }
    return _tableView;
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
    
    self.navigationItem.title = @"我的通告";
    
    [self tableView];
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.arrayForContent.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BKMyAddAnounceCell *cell = [BKMyAddAnounceCell cellWithTableView:tableView];
    
    
    return cell;
}



//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 82;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
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