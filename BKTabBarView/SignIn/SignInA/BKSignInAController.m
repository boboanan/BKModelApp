//
//  BKSignInAController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/19.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKSignInAController.h"
#import "BKSignInBForStarController.h"
#import "BKSignInBForBusinessController.h"
#import "BKSignInACell.h"
#import "BKSignInACustomerCell.h"

@interface BKSignInAController ()

@end

@implementation BKSignInAController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height) style:UITableViewStyleGrouped];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *ID = @"cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if(!cell){
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
//    }
//    if(indexPath.section == 0){
//        cell.textLabel.text = @"我要接通告，成为艺人用户";
//    }else if (indexPath.section == 1){
//        cell.textLabel.text = @"我要找模特，成为商家用户";
//    }
//    return cell;
//    
    if(indexPath.section == 0){
        return [BKSignInACell cellWithTableView:tableView];
    }
    return [BKSignInACustomerCell cellWithTableView:tableView];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0){
        return @"请认真挑选适合你的身份,一旦确认就无法修改";
    }
    return nil;
}

//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 108;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0){
        return 30;
    }
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}


#pragma mark----tableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0){
        BKSignInBForStarController *signInBForStarController = [[BKSignInBForStarController alloc] init];
        [self.navigationController pushViewController:signInBForStarController animated:YES];
    }else if (indexPath.section == 1){
        BKSignInBForBusinessController *signInBForBusinessController = [[BKSignInBForBusinessController alloc] init];
        [self.navigationController pushViewController:signInBForBusinessController animated:YES];
    }
}





@end
