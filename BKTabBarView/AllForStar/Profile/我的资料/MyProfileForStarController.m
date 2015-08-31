//
//  MyProfileController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/25.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "MyProfileForStarController.h"
#import "UzysAssetsPickerController.h"
#import "CalendarViewController.h"
#import "BKAccount.h"

@interface MyProfileForStarController ()<UzysAssetsPickerControllerDelegate>
@property (nonatomic, strong)NSArray *listArray;
//测试用数据
@property (nonatomic, strong)NSArray *listData;
@property (nonatomic, strong)UIImage *image;
@property (nonatomic, strong)BKAccount *account;
@end

@implementation MyProfileForStarController
-(BKAccount *)account
{
    if(!_account){
        _account = [[BKAccount alloc] init];
    }
    return _account;
}
-(UIImage *)image
{   if(!_image){
       _image = [UIImage imageNamed:@"1.jpg"];
    }
    return _image;
}

-(NSArray *)listArray
{
    if(!_listArray){
        _listArray = @[@[@"头像",@"昵称",@"所在地",@"身份",@"年龄"],@[@"身高",@"体重",@"三围",@"腿长",@"鞋码",@"个人标签"],@[@"工作履历"],@[@"工作价格"]];
    }
    return _listArray;
}

-(NSArray *)listData
{
    if(!_listData){
        _listData = @[@"身高",@"体重",@"三围",@"腿长",@"鞋码",@"个人标签"];
    }
    return _listData;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    }
    return self;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(20, 10, 20, 10);
    
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

#pragma mark tableVIew delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
          cell.accessoryType= UITableViewCellAccessoryDisclosureIndicator;
        cell.detailTextLabel.font = [UIFont systemFontOfSize:15];
    }

    if(indexPath.section == 0&&indexPath.row ==0){
        cell.imageView.image = self.image;
    }else{
        cell.imageView.image = nil;
        cell.textLabel.text = self.listArray[indexPath.section][indexPath.row];
        cell.detailTextLabel.text = self.listArray[indexPath.section][indexPath.row];
    }
    return cell;
}
#pragma mark 点击行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if(indexPath.row == 0&&indexPath.section == 0){
        UzysAssetsPickerController *picker = [[UzysAssetsPickerController alloc] init];
        picker.delegate = self;
        picker.maximumNumberOfSelectionVideo = 0;
        picker.maximumNumberOfSelectionPhoto = 1;
        [self presentViewController:picker animated:YES completion:^{
             [self.tableView reloadData];
        }];
    }
    if(indexPath.row == 1){
        //创建弹出窗口
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"System Info" message:@"请输入昵称" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        alert.alertViewStyle=UIAlertViewStylePlainTextInput; //设置窗口内容样式
        UITextField *textField= [alert textFieldAtIndex:0]; //取得文本框
        textField.text=@""; //设置文本框内容
        [alert show]; //显示窗口
    }
    if(indexPath.row == 5){
        CalendarViewController *recent_action = [[CalendarViewController alloc] init];
        [self.navigationController pushViewController:recent_action animated:YES];
    }
}


//#pragma mark 窗口的代理方法，用户保存数据
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    //当点击了第二个按钮（OK）
    if (buttonIndex==1) {
        UITextField *textField= [alertView textFieldAtIndex:0];
        self.account.name = textField.text;
     
    }
    [self.tableView reloadData];
}
#pragma mark 设置每行高度（每行高度可以不一样）
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    return 45;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0){
        return 10;
    }
    return 15;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

- (void)uzysAssetsPickerController:(UzysAssetsPickerController *)picker didFinishPickingAssets:(NSArray *)assets
{
    BKLog(@"assets %@",assets);
 
    __weak typeof(self) weakSelf = self;
    if([[assets[0] valueForProperty:@"ALAssetPropertyType"] isEqualToString:@"ALAssetTypePhoto"]) //Photo
    {
        [assets enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            ALAsset *representation = obj;
            
            UIImage *img = [UIImage imageWithCGImage:representation.defaultRepresentation.fullResolutionImage
                                               scale:representation.defaultRepresentation.scale
                                         orientation:(UIImageOrientation)representation.defaultRepresentation.orientation];
            weakSelf.image = img;
            //刷新表格
            [self.tableView reloadData];
            *stop = YES;
        }];
        
        
    }
    
}

@end
