//
//  AnounceCategoryController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/26.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "AnounceCategoryController.h"
#import "PublishInfo.h"

@interface AnounceCategoryController ()
@property (nonatomic,strong) NSArray *listArray;
@property (nonatomic, strong)NSIndexPath *currentIndex;

@end

@implementation AnounceCategoryController



- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    }
    return self;
}
-(NSArray *)listArray
{
    if(!_listArray){
        NSArray *array1 = @[@"平面拍摄",@"产品拍摄",@"服装拍摄",@"创意写真",@"Cosplay拍摄",@"婚纱摄影",@"其他"];
        NSArray *array2 = @[@"视频拍摄",@"广告",@"微电影/网络剧",@"视频/游戏主播",@"其他"];
        NSArray *array3 = @[@"线下活动",@"展会礼仪",@"展会模特",@"Cosplay表演",@"走秀模特",@"主持",@"舞蹈",@"歌手",@"其他"];
        NSArray *array4 = @[@"推广活动",@"微博/微信推广",@"买家秀",@"其他"];
        _listArray = @[array1,array2,array3,array4];
    }
    return _listArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(sure)];
    //rightBarBtn.enabled = NO;
    self.navigationItem.rightBarButtonItem = rightBarBtn;
    

}

-(void)sure{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
     self.navigationItem.rightBarButtonItem.enabled = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.listArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listArray[section] count] - 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    if(indexPath == self.currentIndex){
        cell.textLabel.textColor=BKColor(96, 158, 240, 1.0);
    }
    else{
        cell.textLabel.textColor=[UIColor blackColor];
    }

    cell.textLabel.text = self.listArray[indexPath.section][indexPath.row+1];
    return cell;
}

#pragma mark 返回每组头标题名称
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
 
    return self.listArray[section][0];
}


//返回cell的类型
- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath == self.currentIndex){
        return UITableViewCellAccessoryCheckmark;
    }
    else{
        return UITableViewCellAccessoryNone;
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //只有选了列表内容“确定”按钮才可被编辑
    self.navigationItem.rightBarButtonItem.enabled = YES;
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if(!self.currentIndex){
        
        self.currentIndex = indexPath;
        UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
        
        if (newCell.accessoryType == UITableViewCellAccessoryNone) {
            
            newCell.accessoryType = UITableViewCellAccessoryCheckmark;
            newCell.textLabel.textColor=BKColor(96, 158, 240, 1.0);
            self.anounceCategoryController = self.listArray[indexPath.section][indexPath.row + 1];
            [self sendAnounceCategoryController];
        }
    }
    if(indexPath == self.currentIndex){
        return;
    }
   // NSIndexPath *oldIndexPath = self.currentIndex;
    UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
    if (newCell.accessoryType == UITableViewCellAccessoryNone) {
        newCell.accessoryType = UITableViewCellAccessoryCheckmark;
        newCell.textLabel.textColor=BKColor(96, 158, 240, 1.0);
        self.anounceCategoryController = self.listArray[indexPath.section][indexPath.row + 1];
        [self sendAnounceCategoryController];
    }
    UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:self.currentIndex];
    if (oldCell.accessoryType == UITableViewCellAccessoryCheckmark) {
        oldCell.accessoryType = UITableViewCellAccessoryNone;
        oldCell.textLabel.textColor=[UIColor blackColor];
    }
    self.currentIndex=indexPath;
}

-(void)sendAnounceCategoryController
{
    if([self.delegate respondsToSelector:@selector(getAnounceCategory)]){
        [self.delegate getAnounceCategory];
    }
}


@end
