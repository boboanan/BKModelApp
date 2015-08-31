//
//  BKImageLayout.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/24.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKImageLayout.h"

static const CGFloat BKViewLayoutItemW = 80;
static const CGFloat BKViewLayoutItemH = 80;
@implementation BKImageLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)prepareLayout
{
    [super prepareLayout];
    self.itemSize = CGSizeMake(BKViewLayoutItemW, BKViewLayoutItemH);
    self.minimumLineSpacing = 20;
    CGFloat margin = [UIScreen mainScreen].bounds.size.width * 0.004;
    self.sectionInset = UIEdgeInsetsMake(margin, margin, margin, margin);
}


-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    //    CGFloat centerY = self.collectionView.contentOffset.y - 100 + self.collectionView.frame.size.height * 0.5;
    //
    //
    //    for(UICollectionViewLayoutAttributes *attrs in array){
    //        CGFloat itemCenterY = attrs.center.y;
    //       CGFloat scale = 1 - ABS(itemCenterY - centerY)/self.collectionView.frame.size.height;
    //        attrs.transform3D = CATransform3DMakeScale(scale, scale, 1.0);
    //
    //    }
    
    return array;
}
@end