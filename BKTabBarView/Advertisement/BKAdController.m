//
//  BKAdController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/25.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKAdController.h"

@interface BKAdController ()
@property (nonatomic, strong)NSArray *ads;
@end

@implementation BKAdController

//测试数据
-(NSArray *)ads
{
    if(!_ads){
        _ads = @[@{@"name":@"百度",@"address":@"北京市", @"tel":@"12345"},@{@"name":@"腾讯",@"address":@"深圳市", @"tel":@"12345"},@{@"name":@"阿里巴巴",@"address":@"杭州市", @"tel":@"12345"}];
    }
    return _ads;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"热门公司推荐";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.ads.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    NSDictionary *dict = self.ads[indexPath.row];
    cell.textLabel.text = dict[@"name"];
    NSString *message = [NSString stringWithFormat:@"地址:%@ 联系电话:%@",dict[@"address"],dict[@"tel"]];
   cell.detailTextLabel.text = message;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end
