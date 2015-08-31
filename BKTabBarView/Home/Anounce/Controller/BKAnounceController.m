//
//  BKAnounceController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/25.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKAnounceController.h"
#import "BKAnouceData.h"
#import "BKAnouceTableViewCell.h"
#import "BKAnounceContentViewController.h"

@interface BKAnounceController ()

@property (nonatomic, strong) NSMutableArray *anouceDataArray;

@end



@implementation BKAnounceController

-(NSMutableArray *)anouceDataArray
{
    if(_anouceDataArray == nil)
    {
        NSArray *array =[BKAnouceData getAnounceDataArray];
        _anouceDataArray =[NSMutableArray arrayWithArray:array];
    }
    
    return _anouceDataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //行高
    self.tableView.rowHeight = 100 + 2 * ContentPadding;
     self.tableView.showsVerticalScrollIndicator = NO;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.anouceDataArray.count;
}

//cell返回内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"AnouceCell";
    BKAnouceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell = [[BKAnouceTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor yellowColor];
        cell.selectedBackgroundView = view;
    }
    
    cell.anouceData = self.anouceDataArray[indexPath.row];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    BKAnounceContentViewController *anounceContentViewController = [[BKAnounceContentViewController alloc] init];
    [self.navigationController pushViewController:anounceContentViewController animated:YES];
}



@end
