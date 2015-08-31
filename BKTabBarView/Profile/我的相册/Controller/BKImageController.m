//
//  BKImageController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/26.
//  Copyright (c) 2015年 B&K. All rights reserved.
//
#define MaxImagesNum 9
#import "BKImageController.h"
#import "BKImageViewCell.h"
#import "BKAddImageBtnCell.h"
#import "BKImageShowController.h"

@interface BKImageController ()<BKAddImageBtnCellDelegate,UzysAssetsPickerControllerDelegate,BKImageViewCellDelegate>
@property (nonatomic, strong)NSMutableArray *images;

//导航栏右边按钮
@property (nonatomic, weak)UIButton *rightBtn;
@end

@implementation BKImageController

static NSString * const reuseIdentifier = @"Cell";
static NSString * const reuseIdentifierBtn = @"button";



-(NSArray *)images
{
    if(!_images){
        UIImage *imageA = [UIImage imageNamed:@"1.jpg"];
        UIImage *imageB = [UIImage imageNamed:@"2.jpg"];
        UIImage *imageC = [UIImage imageNamed:@"3.jpg"];
        _images = [NSMutableArray arrayWithArray:@[imageA,imageB,imageC]];
    
    }
    return _images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**设置导航栏*/
    [self setNav];
    
    self.collectionView.backgroundColor = BKColor(240, 240, 240, 1);
    
    //照片cell
    [self.collectionView registerClass:[BKImageViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    //添加按钮cell
    [self.collectionView registerClass:[BKAddImageBtnCell class] forCellWithReuseIdentifier:reuseIdentifierBtn];
    
}

/**设置导航栏*/
-(void)setNav
{
    //初始化UIbutton
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [rightBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [rightBtn setTitle:@"完成" forState:UIControlStateSelected];
    [rightBtn setTitle:@"完成" forState:UIControlStateHighlighted];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(showCloseBtn) forControlEvents:UIControlEventTouchUpInside];
    self.rightBtn = rightBtn;
    rightBtn.selected = NO;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];

}


//删除按钮出现
-(void)showCloseBtn
{
   
    if(self.rightBtn.isSelected){
        self.rightBtn.selected = NO;
    }else{
      self.rightBtn.selected = YES;
    }
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



-(instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    return [self initWithCollectionViewLayout:layout];
}



#pragma mark --<UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.images.count + 1;
}

#pragma mark --<UICollectionViewDelegate>
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.item == self.images.count){
         BKAddImageBtnCell *btnCell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifierBtn forIndexPath:indexPath];
        btnCell.delegate = self;
        btnCell.image = [UIImage imageNamed:@"image_add"];
        return btnCell;
    }else{
        BKImageViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
        cell.delegate = self;
        cell.image = self.images[indexPath.item];
//此处顺序不能颠倒，先有了UIButton尺寸后，才可以隐藏
        cell.closeBtn.hidden = !self.rightBtn.selected;
        return cell;
    }
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(100, 100);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.item != 0){
        BKImageShowController *imageShowController = [BKImageShowController controllerInitWithImagesArray:self.images index:indexPath.item - 1];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:imageShowController];
        [self presentViewController:nav animated:YES completion:^{
            
        }];
    }
}


#pragma  mark BKAddImageBtnCellDelegate
-(void)addBtnForImage:(BKAddImageBtnCell *)addImageBtnCell{

    //如果还在编辑模式，取消编辑
    if(self.rightBtn.selected == YES){
        self.rightBtn.selected = NO;
        [self.collectionView reloadData];
    }
    
    //如果图片超过限制，警告
    if(self.images.count >= MaxImagesNum){
        [self alertForMoreImages];
        return;
    }
    
    //配置图片picker样式
        UzysAppearanceConfig *appearanceConfig = [[UzysAppearanceConfig alloc] init];
        appearanceConfig.finishSelectionButtonColor = BKColor(94, 158, 249, 1);
        appearanceConfig.assetsGroupSelectedImageName = @"checker";
        [UzysAssetsPickerController setUpAppearanceConfig:appearanceConfig];
    
    //pick初始化
        UzysAssetsPickerController *picker = [[UzysAssetsPickerController alloc] init];
        picker.delegate = self;
        picker.maximumNumberOfSelectionVideo = 0;
        picker.maximumNumberOfSelectionPhoto = 1;
    [self presentViewController:picker animated:YES completion:^{
    }];

}

//图片超过限制是警告
-(void)alertForMoreImages
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告"
                                                    message:@"图片最多九张，超过限制"
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    
    //显示AlertView
    [alert show];
}

#pragma mark -- uzysAssetsPickerController Delegate
//图片picker代理方法
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
            //将图片添加进数组
            [weakSelf.images addObject:img];
            //刷新界面
            [self.collectionView reloadData];
            *stop = YES;
        }];
        
        
    }
}

#pragma mark -- BKImageViewCell Delegate
-(void)closeBtnForImage:(BKImageViewCell *)imageViewCell
{
    for(NSInteger i=0; i<self.images.count; i++ ){
//        NSInteger j = i+1;
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        BKImageViewCell *cell = (BKImageViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        if(cell.willDelete){
            [self.images removeObjectAtIndex:i];
        }
    }
    
    [self.collectionView reloadData];
}

@end
