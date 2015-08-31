//
//  BKAnounceDetailController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/25.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKAnounceDetailController.h"
#import "BKAnounceDetailCell.h"

@interface BKAnounceDetailController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak)UITableView *tableView;

/**底部按钮*/
@property (nonatomic, weak)UIButton *bottomBtn;

/**表格内容数组，固定模式,数组里数组*/
@property (nonatomic, strong) NSMutableArray *staticArrayForContent;
@end



@implementation BKAnounceDetailController

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
        [bottomBtn setTitle:@"已接受" forState:UIControlStateNormal];
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
        _staticArrayForContent = [NSMutableArray arrayWithArray:@[@[@""],@[@"工作时间",@"工作地点"],@[@"通告说明"],@[@"报酬"]]];
    }
    return _staticArrayForContent;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"通告详情";
    
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
    }

    if(indexPath.section == 0){
        BKAnounceDetailCell *cell = [BKAnounceDetailCell cellWithTableView:tableView];
        return cell;
    }
    cell.textLabel.text = self.staticArrayForContent[indexPath.section][indexPath.row];
    return cell;
}

//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section ==0){
        return 80;
    }
  
    return 44;
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