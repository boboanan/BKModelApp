//
//  BKAnounceContentViewController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/23.
//  Copyright (c) 2015年 B&K. All rights reserved.
//


#import "BKAnounceContentViewController.h"
#import "BKRequestListCell.h"
#import "BKStarForCellInfo.h"
#import "BKFinalListController.h"

@interface BKAnounceContentViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak)UITableView *tableView;


@end



@implementation BKAnounceContentViewController

//初始化tableview
-(UITableView *)tableView
{
    if(_tableView == nil){
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, [UIScreen mainScreen].bounds.size.height / 12 *11) style:UITableViewStyleGrouped];
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置导航按
    [self setNav];
    
    [self tableView];
    
    [self setUpBottomView];
    
}

//设置导航按
-(void)setNav
{
    self.navigationItem.title = @"通告详情";
}



/**设置底部进入心愿单按钮*/
-(void)setUpBottomView
{
    UIButton *intoMyChoiceBtn = [[UIButton alloc] init];
    //设置尺寸
    //    CGFloat intoMyChoiceBtnW = self.view.width;
    //    CGFloat intoMyChoiceBtnH = self.view.height / 10;
    //    CGFloat intoMyChoiceBtnX = 0;
    //    CGFloat intoMyChoiceBtnY = self.view.height - intoMyChoiceBtnH;
    CGFloat intoMyChoiceBtnW = [UIScreen mainScreen].bounds.size.width;
    CGFloat intoMyChoiceBtnH = [UIScreen mainScreen].bounds.size.height / 12;
    CGFloat intoMyChoiceBtnX = 0;
    CGFloat intoMyChoiceBtnY = [UIScreen mainScreen].bounds.size.height - intoMyChoiceBtnH;
    intoMyChoiceBtn.frame = CGRectMake(intoMyChoiceBtnX, intoMyChoiceBtnY, intoMyChoiceBtnW, intoMyChoiceBtnH);
    //    intoMyChoiceBtn.frame = CGRectMake(50, 50, 80, 80);
    
    //初始化样式
    //    intoMyChoiceBtn.backgroundColor = BKColorBlue;
    [intoMyChoiceBtn setBackgroundImage:[UIImage imageNamed:@"pink"] forState:UIControlStateNormal];
    [intoMyChoiceBtn setTitle:@"我要报名" forState:UIControlStateNormal];
    [intoMyChoiceBtn addTarget:self action:nil forControlEvents:UIControlEventTouchUpInside];
    intoMyChoiceBtn.titleLabel.centerY = intoMyChoiceBtn.centerY;
    //添加到view上
    
    [self.view addSubview:intoMyChoiceBtn];
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

#pragma tableview delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end