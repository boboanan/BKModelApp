//
//  BKHomeScrollCell.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/23.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKHomeScrollCell.h"
@interface BKHomeScrollCell()<UIScrollViewDelegate>
@property (nonatomic, strong)UIPageControl *pageControl;
@property (nonatomic, strong)UIScrollView *scrollView;
/**广告图片*/
@property(nonatomic, strong)NSArray *adImages;

@end
@implementation BKHomeScrollCell
//广告栏自动变换参数
static CGFloat add;


-(UIPageControl *)pageControl
{
    if(!_pageControl){
        _pageControl = [[UIPageControl alloc] init];
        [self.contentView addSubview:_pageControl];
    }
    return _pageControl;
}

-(UIScrollView *)scrollView
{
    if(!_scrollView){
        _scrollView = [[UIScrollView alloc] init];
        [self.contentView addSubview:_scrollView];
    }
    return _scrollView;
}

-(void)setAdInfo:(BKADHomeInfo *)adInfo
{
    _adInfo = adInfo;
    self.adImages = adInfo.ad_images;
    //设置尺寸
    [self setUpFrame];
}

//设置尺寸
-(void)setUpFrame
{
    CGFloat scrollW = [UIScreen mainScreen].bounds.size.width;
    CGFloat scrollH = 200;
    //创建一个scrollView，现实所有新特性图片
    self.scrollView.frame = CGRectMake(0, 0, scrollW, scrollH);
    
    for(int i = 0; i < 4; i++){
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.width = scrollW;
        imageView.height = scrollH;
        imageView.y = 0;
        imageView.x = i * scrollW;
        imageView.image = [UIImage imageNamed:self.adImages[i]];
        [self.scrollView addSubview:imageView];
        
        if(i == 4 - 1){
            
        }
    }
    
    //设置scollView的其他属性
    //如果想要某个方向不能滚动，这个方向尺寸数值传0即可
    self.scrollView.contentSize = CGSizeMake(4 * scrollW, 0);
    self.scrollView.bounces = NO;//去除弹簧效果
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    //scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);

    //添加pageControll，展示当前内容的页数
    self.pageControl.numberOfPages = 4;
    // pageControl.backgroundColor = [UIColor redColor];
     self.pageControl.currentPageIndicatorTintColor = BKColorPink;
     self.pageControl.pageIndicatorTintColor = BKColor(189, 189, 189, 1.0);
    
    
    //UIpageControll就算没有尺寸，里面的内容还是照常显示，子控件如果超过父控件，可以显示子空间大小；
    //如果父控件没有尺寸，子控件不能交互
     self.pageControl.centerX = scrollW * 0.5;
     self.pageControl.centerY = scrollH * 0.9;
    
    //设置scrollView广告栏自动滚动
    [NSTimer scheduledTimerWithTimeInterval:6 target:self selector:@selector(scrollUpdate) userInfo:nil repeats:YES];
    
}

#pragma mark-delegate
//自动更新广告栏的滚动
-(void)scrollUpdate
{
    if(self.scrollView.contentOffset.x +  add >= self.scrollView.contentSize.width ){
        add = -self.scrollView.contentSize.width / 4;
    }
    if(self.scrollView.contentOffset.x == 0 ){
        add = self.scrollView.contentSize.width / 4;
    }
    
    CGPoint newOffset = CGPointMake(self.scrollView.contentOffset.x +  add, self.scrollView.contentOffset.y);
    [self.scrollView setContentOffset:newOffset animated:YES];
}

//广告栏滚动式pageControl的变换
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    double page = scrollView.contentOffset.x / scrollView.width;
    self.pageControl.currentPage = (int)(page + 0.5);
    
}


@end
