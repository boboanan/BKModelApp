//
//  BKHomeController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/25.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKHomeController.h"
#import "BKSearchViewController.h"
#import "BKHomeCollectionViewController.h"
#import "BKAnounceController.h"
#import "BKAdController.h"

@interface BKHomeController ()

@property (nonatomic, strong) BKHomeCollectionViewController *starController ;
@property (nonatomic, strong) BKAnounceController *anounceController;

@end

@implementation BKHomeController


- (void)viewDidLoad {
    [super viewDidLoad];

    /**初始化自控制器*/
    [self initForChildController];
    
    //导航栏设置
    [self setNav];
}

/**初始化自控制器*/
-(void)initForChildController
{
    BKHomeCollectionViewController *collectionView = [[BKHomeCollectionViewController alloc] init];
    [self addChildViewController:collectionView];
    self.starController = collectionView;
    collectionView.view.frame = self.view.bounds;
    
    //collectionView.collectionView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    
    
    BKAnounceController *anounceController = [[BKAnounceController alloc] init];
    anounceController.view.frame = self.view.bounds;
    [self addChildViewController:anounceController];
    self.anounceController = anounceController;
    
    //一开始让通告控制器的view隐藏
    self.anounceController.view.hidden = YES;
    
     [self.view addSubview:anounceController.view];
    [self.view addSubview:collectionView.view];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**导航栏设置*/
-(void)setNav
{
    //切换按钮
    [self setSegmentControl];
    
    //更多按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ad"] style:UIBarButtonItemStyleBordered target:self action:@selector(rightButtonClick)];
//     [[UIBarButtonItem alloc] initWithTitle:@"更多" style:UIBarButtonItemStyleBordered target:self action:@selector(rightButtonClick)];

}

//切换按钮
-(void)setSegmentControl
{
    
    NSArray *segmentedData = [[NSArray alloc]initWithObjects:@"艺人",@"通告",nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedData];
    segmentedControl.frame = CGRectMake(10.0, 20.0,200.0, 30.0);
    /*
     这个是设置按下按钮时的颜色
     */
    segmentedControl.tintColor = [UIColor whiteColor];
    segmentedControl.selectedSegmentIndex = 0;//默认选中的按钮索引
    
    
    /*
     下面的代码实同正常状态和按下状态的属性控制,比如字体的大小和颜色等
     */
    
    NSDictionary* selectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:14],
                                             NSForegroundColorAttributeName: BKColorPink};
    [segmentedControl setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];//设置文字属性
    NSDictionary* unselectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:14],
                                               NSForegroundColorAttributeName: [UIColor lightTextColor]};
    [segmentedControl setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
    
    
    //设置分段控件点击相应事件
    [segmentedControl addTarget:self action:@selector(doSomethingInSegment:)forControlEvents:UIControlEventValueChanged];
    
    segmentedControl.frame = CGRectMake(0, 0, 140, 30);
    
    self.navigationItem.titleView = segmentedControl;
}

/**切入广告控制器*/
-(void)rightButtonClick
{
    BKAdController *adController = [[BKAdController alloc] init];
    [self.navigationController pushViewController:adController animated:YES];
    
}


/**UISegmentedControl切换不同控制器的view*/
-(void)doSomethingInSegment:(UISegmentedControl *)Seg
{
    
    NSInteger Index = Seg.selectedSegmentIndex;
    
    switch (Index)
    {
        case 0:
            
            self.starController.view.hidden = NO;
            self.anounceController.view.hidden = YES;
            
            break;
        case 1:
            self.starController.view.hidden = YES;
            self.anounceController.view.hidden = NO;
            break;
        default:
            break;
    }

}


@end
