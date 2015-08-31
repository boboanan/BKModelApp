//
//  BKHomeCollectionViewController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/22.
//  Copyright (c) 2015年 B&K. All rights reserved.
//  首页艺人

#import "BKHomeCollectionViewController.h"
#import "BKImageCell.h"
#import "BKPersonIntroController.h"
#import "BKViewLayout.h"
#import "BKHomeScrollCell.h"
#import "BKSearchViewController.h"
#import "BKADHomeInfo.h"
#import "BKStarForCellInfo.h"
#import "BKImageShowController.h"

@interface BKHomeCollectionViewController ()<BKImageCellDelegate>

@property (nonatomic,strong) NSMutableArray *starInfos;

/**广告数据*/
@property (nonatomic, strong)BKADHomeInfo *adHomeInfo;

@end

@implementation BKHomeCollectionViewController

static NSString * const reuseIdentifier = @"image";


-(instancetype)init
{
    BKViewLayout *layout = [[BKViewLayout alloc] init];
    return [self initWithCollectionViewLayout:layout];
}

-(NSMutableArray *)starInfos
{
    if(!_starInfos){
        _starInfos = [NSMutableArray array];;
        for(int i= 0;i < 301; i++){
            int j = i % 8 + 1;
            int y = i % 7 + 1;
            BKStarForCellInfo *starForCellInfo = [[BKStarForCellInfo alloc] init];
            starForCellInfo.star_cell_name = @"美少女";
            starForCellInfo.star_cell_image =[NSString stringWithFormat:@"%d",j];

            UIImage *imageA = [UIImage imageNamed:[NSString stringWithFormat:@"%d",j]];
            UIImage *imageB = [UIImage imageNamed:[NSString stringWithFormat:@"%d",y]];
            starForCellInfo.star_images = @[imageA,imageB];
            [_starInfos addObject:starForCellInfo];
        }
    }
    return  _starInfos;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
  //设置背景色
    self.collectionView.backgroundColor = BKColor(240, 240, 240, 1);
    self.collectionView.showsVerticalScrollIndicator = NO;
    [self.collectionView registerNib:[UINib nibWithNibName:@"BKImageCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerClass:[BKHomeScrollCell class] forCellWithReuseIdentifier:@"scroll"];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.starInfos.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.item == 0){
      collectionViewLayout.collectionView.contentInset = UIEdgeInsetsMake(44, 20, 20, 20);
        return CGSizeMake(self.view.bounds.size.width, 200);
    }

    return CGSizeMake(80, 100);
}

//collectionView每一个cell的显示
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.item == 0){
        BKHomeScrollCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"scroll" forIndexPath:indexPath];
        BKADHomeInfo *info = [BKADHomeInfo getADHomeInfo];
        cell.adInfo = info;
        return cell;
    }
    BKImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.delegate = self;
    cell.starForCellInfo = self.starInfos[indexPath.item];
    cell.positon = indexPath.item;
    return cell;
}



#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    BKPersonIntroController *viewc = [[BKPersonIntroController alloc] init];
    [self.navigationController pushViewController:viewc animated:YES];
}

//返回这个UICollectionView是否可以被选择
-(bool)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

#pragma mark BKImageCellDelegate
-(void)showImage:(BKImageCell *)imageCell
{
    NSArray *images = [self.starInfos[imageCell.positon] star_images];
    BKImageShowController *imageShowController = [BKImageShowController controllerInitWithImagesArray:images index:0];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:imageShowController];
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}


@end
