//
//  BKPublishController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/25.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKPublishController.h"
#import "AnounceCategoryController.h"
#import "PublishInfo.h"
#import "BKPublishBController.h"
#import "BKPublishACell.h"

@interface BKPublishController ()<AnounceCategoryControllerDelegate,UITextFieldDelegate>
@property (nonatomic, strong) NSArray *listArray;
@property (nonatomic, strong)PublishInfo *publishInfo;
@property (nonatomic, strong)AnounceCategoryController *anounceCategoryController;

@end

@implementation BKPublishController

-(AnounceCategoryController *)anounceCategoryController{
    if(!_anounceCategoryController){
        _anounceCategoryController = [[AnounceCategoryController alloc] init];
    }
    return _anounceCategoryController;
}

-(PublishInfo *)publishInfo
{
    if(!_publishInfo){
        _publishInfo = [[PublishInfo alloc] init];
        _publishInfo.anounce_category = @"点击输入";
    }
    return _publishInfo;
}

-(NSArray *)listArray
{
    if(!_listArray){
        NSArray *array1 =@[@"",@"选人方式",@"通告类型"];
        NSArray *array2 =@[@"人数",@"报酬",@"身高"];
        _listArray = @[array1,array2];
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
    
    [self setUpNav];
   
    
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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section==0&&indexPath.row == 0){
        BKPublishACell *imageCell =[BKPublishACell cellWithTableView:tableView];
        imageCell.imageView.image = [UIImage imageNamed:@"publish_a"];
        return imageCell;
    }
    static NSString *ID = @"cell";
    static NSString *IDB = @"anounceWayCell";
    UITableViewCell *cell;
    if(indexPath.section == 0&&indexPath.row == 1){
        cell = [tableView dequeueReusableCellWithIdentifier:IDB];
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
    }
    if(!cell){
        if(indexPath.section == 0&&indexPath.row == 1){
            cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleValue1 reuseIdentifier:IDB];
            cell.accessoryView = [self getAnounceWay];
        }else{
            cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleValue1 reuseIdentifier:ID];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    cell.textLabel.text = self.listArray[indexPath.section][indexPath.row];
    if(indexPath.section == 0&&indexPath.row == 1){
        
    }else{
        cell.detailTextLabel.text = @"点击输入";
    }
    return cell;
}

//通告类型
-(UISegmentedControl *)getAnounceWay
{
    NSArray *segmentedData = [[NSArray alloc]initWithObjects:@"自选",@"报名",nil];
    UISegmentedControl *way = [[UISegmentedControl alloc]initWithItems:segmentedData];
    
    
    /*
     这个是设置按下按钮时的颜色
     */
    way.tintColor = BKColorPink;
    way.selectedSegmentIndex = 0;//默认选中的按钮索引
    
    
    /*
     下面的代码实同正常状态和按下状态的属性控制,比如字体的大小和颜色等
     */
    
    NSDictionary* selectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:14],
                                             NSForegroundColorAttributeName: [UIColor whiteColor]};
    [way setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];//设置文字属性
    NSDictionary* unselectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:14],
                                               NSForegroundColorAttributeName: BKColorPink};
    [way setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
    
    
    
    
    [way addTarget:self action:@selector(getWay:)forControlEvents:UIControlEventValueChanged];
    way.frame = CGRectMake(0, 0,100, 30);
    way.selectedSegmentIndex = 0;//默认选中的按钮索引

    return way;
}

-(void)getWay:(UISegmentedControl *)Seg
{
    
    NSInteger Index = Seg.selectedSegmentIndex;
    
    switch (Index)
    {
        case 0:
            
            break;
        case 1:
            
            break;
        default:
            break;
    }
}





#pragma mark 设置分组标题内容高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section==0){
        return 5;
    }
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

-(void)getAnounceCategory{
    self.publishInfo.anounce_category = self.anounceCategoryController.anounceCategoryController;
    [self.tableView reloadData];
}

-(void)setUpNav
{
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancell)];
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithTitle:@"下一步" style:UIBarButtonItemStyleDone target:self action:@selector(next)];
    //rightBarBtn.enabled = NO;
    self.navigationItem.rightBarButtonItem = rightBarBtn;
    
    
  
        UILabel *titleView = [[UILabel alloc] init];
        titleView.width = 200;
        titleView.height = 44;
        titleView.textAlignment = NSTextAlignmentCenter;
        //自动换行
        titleView.numberOfLines = 0;
        titleView.text = @"艺人需求";
        titleView.textColor = [UIColor whiteColor];
        self.navigationItem.titleView = titleView;
}
-(void)cancell
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)next
{
    BKPublishBController *publishBController = [[BKPublishBController alloc] init];
    publishBController.publishInfo = self.publishInfo;
    [self.navigationController pushViewController:publishBController animated:YES];
}


#pragma tableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if(indexPath.section == 0&& indexPath.row == 2){
        self.anounceCategoryController.delegate = self;
        [self.navigationController pushViewController:self.anounceCategoryController animated:YES];
    }
}

- (NSIndexPath *)tableView:(UITableView *)tv willSelectRowAtIndexPath:(NSIndexPath *)path
{
    //根据 NSIndexPath判定行是否可选。
    if ((path.row ==0||path.row == 1)&&path.section == 0)
    {
        return nil;
    }
    
    return path;
}


@end
