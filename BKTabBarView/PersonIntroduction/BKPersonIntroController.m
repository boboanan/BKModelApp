//
//  PersonIntroController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/27.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKPersonIntroController.h"
#import "BKPersonInfoController.h"
#import "BKPersonImagesController.h"
#import "UIImage+ImageEffects.h"
void *BKPersonIntroInsetObserver = &BKPersonIntroInsetObserver;

@interface BKPersonIntroController ()

@end

@implementation BKPersonIntroController

-(instancetype)init
{
    BKPersonInfoController *table = [[BKPersonInfoController alloc] init];
    BKPersonImagesController *collectionView = [[BKPersonImagesController alloc] init];
    
    
    self = [super initWithControllers:collectionView,table,nil];
    if (self) {
        // your code
        self.segmentMiniTopInset = 64;
    }
    
    return self;
}

#pragma mark - override

//-(UIView<ARSegmentPageControllerHeaderProtocol> *)customHeaderView
//{
//    UIView *view = [[UIView alloc] init];
//    view.backgroundColor = [UIColor yellowColor];
//    return view;
//}

-(UIView *)customHeaderView
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = BKColorPink;
    
    
    UIImageView *starImageView = [[UIImageView alloc] init];
    starImageView.image = [UIImage imageNamed:@"5.jpg"];
    CGFloat starImageViewWH = 100;
    starImageView.frame = CGRectMake(0, 70, starImageViewWH, starImageViewWH);
    starImageView.centerX = [UIScreen mainScreen].bounds.size.width / 2;
    starImageView.layer.cornerRadius = starImageViewWH/2;
    //图片需要裁减
    starImageView.layer.masksToBounds = YES;
    starImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    starImageView.layer.borderWidth = 5;
    [view addSubview:starImageView];
    
    return view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addObserver:self forKeyPath:@"segmentToInset" options:NSKeyValueObservingOptionNew context:BKPersonIntroInsetObserver];
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    if (context == BKPersonIntroInsetObserver) {
       // CGFloat inset = [change[NSKeyValueChangeNewKey] floatValue];
        
    }
}

-(void)dealloc
{
    [self removeObserver:self forKeyPath:@"segmentToInset"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
