//
//  BKPersonImagesController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/12.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKPersonImagesController.h"
#import "BKViewLayout.h"
#import "BKPersonImageCell.h"

@interface BKPersonImagesController ()

@property (nonatomic,strong) NSMutableArray *images;
@end

@implementation BKPersonImagesController

static NSString * const reuseIdentifier = @"Cell";

-(NSMutableArray *)images
{
    if(!_images){
        self.images = [NSMutableArray array];;
        
        for(int i= 0;i < 9; i++){
            int j = i % 5 + 1;
            [self.images addObject:[NSString stringWithFormat:@"%d.jpg",j]];
        }
    }
    return  _images;
}

-(instancetype)init
{
    BKViewLayout *layout = [[BKViewLayout alloc] init];
    return [self initWithCollectionViewLayout:layout];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:[BKPersonImageCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    
    
    //设置背景色
    self.collectionView.backgroundColor = BKColor(240, 240, 240, 1);
 
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



-(NSString *)segmentTitle
{
    return @"照片";
}

-(UIScrollView *)streachScrollView
{
    return self.collectionView;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(80,80);
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BKPersonImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
     cell.image = self.images[indexPath.item];
    [cell addSubview:cell.personImageBtn];
   
    
    return cell;
}

@end
