//
//  BKRequestListsController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/18.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKFinalListController.h"
#import "BKRequestListCell.h"
#import "BKStarForCellInfo.h"

@interface BKFinalListController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak)UITableView *tableView;
#warning 测试用
@property (nonatomic, strong) NSMutableArray *infos;
#warning 测试用
@property (nonatomic, strong) NSMutableArray *choiceList;

@property (nonatomic, weak)UIButton *rightBtn;
@end

@implementation BKFinalListController

//初始化tableview
-(UITableView *)tableView
{
    if(_tableView == nil){
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, [UIScreen mainScreen].bounds.size.height / 12 *11)];
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}
#warning 测试用
-(NSMutableArray *)infos
{
    BKStarForCellInfo *info = [[BKStarForCellInfo alloc] init];
    info.star_cell_name = @"hah";
    info.star_cell_image = @"1.jpg";
    if(_infos == nil){
        _infos = [NSMutableArray arrayWithArray:@[info,info,info,info,info,info,info,info,info,info,info,info]];
    }
    return _infos;
}
#warning 测试用
-(NSMutableArray *)choiceList
{
    if(_choiceList == nil){
        _choiceList = [NSMutableArray arrayWithArray:@[@"NO",@"NO",@"NO",@"NO",@"NO",@"NO",@"NO",@"NO",@"NO",@"NO",@"NO",@"NO"]];
    }
    return _choiceList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置导航按
    [self setNav];
    
    [self tableView];
    
    [self setUpBottomView];
    
    self.tableView.rowHeight = 80 + 2*ContentMargin;
}

//设置导航按
-(void)setNav
{
    self.navigationItem.title = @"我的心愿单";
    
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
    [rightButton setTitle:@"全选" forState:UIControlStateNormal];
    [rightButton setTitle:@"全不选" forState:UIControlStateSelected];
     rightButton.titleLabel.textAlignment = NSTextAlignmentRight;
    rightButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.rightBtn = rightButton;
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc ]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightBarButton;

}

//点击按钮
-(void)rightBtnClick
{   if(self.rightBtn.isSelected){
        //选中，取消全部选择
        for(int i=0; i<self.choiceList.count; i++){
            self.choiceList[i] = @"NO";
        }
        self.rightBtn.selected = NO;
    }else{
        //没选中，全选
        for(int i=0; i<self.choiceList.count; i++){
            self.choiceList[i] = @"YES";
        }
       self.rightBtn.selected = YES;
    }
    //刷新表格
    [self.tableView reloadData];
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
    [intoMyChoiceBtn setTitle:@"立即付款" forState:UIControlStateNormal];
    intoMyChoiceBtn.titleLabel.centerY = intoMyChoiceBtn.centerY;
    //添加到view上
    
    [self.view addSubview:intoMyChoiceBtn];

    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.infos.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    BKRequestListCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell = [[BKRequestListCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        cell.selectedBackgroundView = view;
    }
    if([self.choiceList[indexPath.row] isEqualToString:@"NO"]){
        cell.choiceBtn.selected = NO;
    }else if([self.choiceList[indexPath.row] isEqualToString:@"YES"]){
        cell.choiceBtn.selected = YES;
    }
    
    cell.starForCellInfo = self.infos[indexPath.row];
    return cell;
}

#pragma tableview delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.choiceList[indexPath.row] isEqualToString:@"NO"]){
        self.choiceList[indexPath.row] = @"YES";
    }else if([self.choiceList[indexPath.row] isEqualToString:@"YES"]){
        self.choiceList[indexPath.row] = @"NO";
    }
    [self.tableView reloadData];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}




@end
