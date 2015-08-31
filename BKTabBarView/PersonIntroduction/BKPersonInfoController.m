//
//  BKPersonInfoController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/12.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKPersonInfoController.h"
#import "RatingBar.h"
#import "BKBodyInfoCell.h"

@interface BKPersonInfoController ()

@end

@implementation BKPersonInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

//初始化时制定模式为group
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)segmentTitle
{
    return @"个人信息";
}

-(UIScrollView *)streachScrollView
{
    return self.tableView;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 1:
            return 2;
            break;
        case 3:
            return 2;
            break;

    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        if(indexPath.section == 2){
        }
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = [UIColor grayColor];
        cell.detailTextLabel.textColor = [UIColor grayColor];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:15];
    }
    if(indexPath.section == 0){
        cell.textLabel.text = @"评价";
        
        //评价
        RatingBar *bar = [[RatingBar alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 140, 0, 140, cell.contentView.bounds.size.height)];
        //bar.backgroundColor = [UIColor redColor];
        bar.starNumber = 3;
        bar.enable = NO;
        [cell.contentView addSubview:bar];
        cell.userInteractionEnabled = NO;
        
    }else if(indexPath.section == 1){
        cell.userInteractionEnabled = NO;
        if(indexPath.row == 0){
            cell.textLabel.text = @"认证信息";
            
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 80, 10, 80, cell.contentView.bounds.size.height-20)];
            [btn setTitle:@"真实身份" forState:UIControlStateNormal];

//            [btn setImage:[UIImage imageNamed:@"vip"] forState:UIControlStateNormal];
            
//            [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
//            [btn.imageView sizeToFit];
//            [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 20, 0, 0)];
     
            [btn sizeToFit];
            
            //4个参数是上边界，左边界，下边界，右边界。
            btn.titleLabel.font = [UIFont systemFontOfSize:15];
            [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [cell.contentView addSubview:btn];
         
        }else if(indexPath.row == 1){
            cell.textLabel.text = @"工作标签";
            
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 100, 10, 80, cell.contentView.bounds.size.height-20)];
            btn.layer.cornerRadius = 3;
            [btn setTitle:@"平面模特" forState:UIControlStateNormal];
            [btn setTitleColor:BKColorPink forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:15];
            btn.layer.borderWidth = 1;
            btn.layer.borderColor = BKColorPink.CGColor;
            
            [cell.contentView addSubview:btn];
            
        }
    }else if(indexPath.section == 2){
        BKBodyInfoCell *cell = [BKBodyInfoCell cellWithTableView:tableView];
        cell.weightContent = @"50";
        cell.heightContent = @"160";
        cell.bustContent = @"B";
        cell.waistContent = @"33-33-33";
        cell.userInteractionEnabled = NO;
        return  cell;
        
    }else if(indexPath.section == 3){
        if(indexPath.row == 0){
            cell.textLabel.text = @"最近档期";
            cell.detailTextLabel.text = @"点击查看";
             cell.accessoryType= UITableViewCellAccessoryDisclosureIndicator;
        }else if(indexPath.row == 1){
            cell.textLabel.text = @"工作履历与报价";
            cell.detailTextLabel.text = @"点击查看";
             cell.accessoryType= UITableViewCellAccessoryDisclosureIndicator;
        }
    }
   
    return cell;
}

#pragma mark tableView Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 2){
        return 129;
    }
    return 44;
}

//限制 cell之间间隔
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
@end
