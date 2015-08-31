//
//  BKPublishCController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/27.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKPublishCController.h"
#import "UzysAssetsPickerController.h"
#import "BKPublishACell.h"

@interface BKPublishCController ()<UzysAssetsPickerControllerDelegate>
@property (nonatomic, strong)NSArray *listArray;

@property (nonatomic, strong)NSMutableArray *detailListArray;

@end

@implementation BKPublishCController

-(NSArray *)listArray
{
    if(!_listArray){
        _listArray = @[@[@"",@"通告标题"],@[@"通告说明"],@[@"上传照片",@""]];
    }
    return _listArray;
}

-(NSMutableArray *)detailListArray
{
    if(_detailListArray == nil){
        _detailListArray = [NSMutableArray arrayWithArray:@[@[@"",@"点击添加"],@[@"点击添加"],@[@"",@""]]];
    }
    return _detailListArray;
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
    
    [self setNav];
}


-(void)setNav
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"上一步" style:UIBarButtonItemStyleDone target:self action:@selector(cancell)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(sure)];
    
    
    
    UILabel *titleView = [[UILabel alloc] init];
    titleView.width = 200;
    titleView.height = 44;
    titleView.textAlignment = NSTextAlignmentCenter;
    //自动换行
    titleView.numberOfLines = 0;
    titleView.text = @"通告说明";
    titleView.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = titleView;
}


-(void)cancell
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)sure
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
        imageCell.imageView.image = [UIImage imageNamed:@"publish_c"];
        return imageCell;
    }
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = self.listArray[indexPath.section][indexPath.row];
    cell.detailTextLabel.text = self.detailListArray[indexPath.section][indexPath.row];
    cell.imageView.image = nil;
    if(indexPath.section == 2){
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    if(indexPath.row == 1&&indexPath.section == 2){
        cell.imageView.image = [UIImage imageNamed:@"image_add"];
    }
    return cell;
}



#pragma UzysAssetsPickerControllerDelegate
- (void)uzysAssetsPickerController:(UzysAssetsPickerController *)picker didFinishPickingAssets:(NSArray *)assets
{
  
    __weak typeof(self) weakSelf = self;
    if([[assets[0] valueForProperty:@"ALAssetPropertyType"] isEqualToString:@"ALAssetTypePhoto"]) //Photo
    {
        [assets enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            ALAsset *representation = obj;
            
            UIImage *img = [UIImage imageWithCGImage:representation.defaultRepresentation.fullResolutionImage
                                               scale:representation.defaultRepresentation.scale
                                         orientation:(UIImageOrientation)representation.defaultRepresentation.orientation];
           weakSelf.publishInfo.image = img;
            *stop = YES;
        }];
        [self.tableView reloadData];
        
    }
    
}



#pragma mark 设置分组标题内容高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

#pragma tableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if(indexPath.section ==2&&indexPath.row == 1){
        UzysAssetsPickerController *picker = [[UzysAssetsPickerController alloc] init];
        picker.delegate = self;
        picker.maximumNumberOfSelectionVideo = 0;
        picker.maximumNumberOfSelectionPhoto = 1;
        [self presentViewController:picker animated:YES completion:^{
            
        }];
    }
    
}


- (NSIndexPath *)tableView:(UITableView *)tv willSelectRowAtIndexPath:(NSIndexPath *)path
{
    //根据 NSIndexPath判定行是否可选。
    if ((path.row ==0&&path.section == 2)||(path.row == 0&&path.section == 0))
    {
        return nil;
    }
    
    return path;
}


@end
