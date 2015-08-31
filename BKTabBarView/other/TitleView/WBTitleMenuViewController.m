//
//  WBTitleMenuViewController.m
//  WB
//
//  Created by 锄禾日当午 on 15/7/7.
//  Copyright (c) 2015年 WWS. All rights reserved.
//

#import "WBTitleMenuViewController.h"

@implementation WBTitleMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 20;
    self.tableView.backgroundColor = BKColor(96, 96, 96, 1.0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 2;
}
#pragma mark - Table view delegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"通告";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"艺人";
    } 
    cell .contentView .backgroundColor  = BKColor(96, 96, 96, 1.0);
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}

@end
