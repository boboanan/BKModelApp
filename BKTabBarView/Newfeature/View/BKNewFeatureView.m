//
//  BKNewFeatureView.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/23.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKNewFeatureView.h"
@interface BKNewFeatureView()<UIScrollViewDelegate>
@property (strong, nonatomic)  UIScrollView *scrollView;
@property (strong, nonatomic)  UIPageControl *pageControl;
@property UIView *holeView;
@property UIView *circleView;
@property UIButton *signInButton;
@property UIButton *logInButtin;

@end
@implementation BKNewFeatureView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        
        
        UIImageView *backgroundImageView = [[UIImageView alloc] init];
        backgroundImageView.frame = [UIScreen mainScreen].bounds;
        backgroundImageView.image = [UIImage imageNamed:@"Intro_Screen_Background"];
        [self addSubview:backgroundImageView];
        
        
        self.scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
        self.scrollView.pagingEnabled = YES;
        [self addSubview:self.scrollView];
        
        self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.frame.size.height*.8, self.frame.size.width, 10)];
        self.pageControl.currentPageIndicatorTintColor = BKColor(95,150,215,1.0);
        [self addSubview:self.pageControl];
        
        [self createViewWithText:@"" Image:@"new_a" Description:@"Description for First Screen." Num:1];
        [self createViewWithText:@"DropShot" Image:@"new_b" Description:@"Description for Second Screen." Num:2];
        [self createViewWithText:@"" Image:@"new_a" Description:@"Description for Third Screen." Num:3];
        [self createViewWithText:@"Punctual" Image:@"new_b" Description:@"Description for Fourth Screen." Num:4];
        
        
        //Done Button
        
        self.signInButton = [self btnWithName:@"注册"  Color:BKColorPink Order:0 action:@selector(onFinishedIntroButtonPressed:)];
        self.logInButtin = [self btnWithName:@"登录" Color:BKColor(260, 91, 130, 1) Order:1 action:@selector(onFinishedIntroButtonPressed:)];
        
        self.pageControl.numberOfPages = 4;
        self.scrollView.contentSize = CGSizeMake(self.frame.size.width*4, self.scrollView.frame.size.height);
        
        //This is the starting point of the ScrollView
        CGPoint scrollPoint = CGPointMake(0, 0);
        [self.scrollView setContentOffset:scrollPoint animated:YES];
    }
    return self;
}

-(UIButton *)btnWithName:(NSString *)name Color:(UIColor *)color Order:(int) order action:(SEL)action
{
    CGFloat btnW = self.width / 2;
    CGFloat btnH = 60;
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(btnW * order, self.frame.size.height - btnH, btnW, btnH)];
    [btn setTintColor:[UIColor whiteColor]];
    [btn setTitle:name forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:18.0]];
    btn.backgroundColor = color;
    // btn.layer.borderColor = [UIColor colorWithRed:0.153 green:0.533 blue:0.796 alpha:1.000].CGColor;
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    //  btn.layer.borderWidth =.5;
    // btn.layer.cornerRadius = 15;
    [self addSubview:btn];
    
    return btn;
}

- (void)onFinishedIntroButtonPressed:(id)sender {
    [self.delegate onDoneButtonPressed:sender];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat pageWidth = CGRectGetWidth(self.bounds);
    CGFloat pageFraction = self.scrollView.contentOffset.x / pageWidth;
    self.pageControl.currentPage = roundf(pageFraction);
    
}


-(void)createViewWithText:(NSString *)text Image:(NSString *)image Description:(NSString *)description Num:(int) num
{
    
    CGFloat originWidth = self.frame.size.width;
    CGFloat originHeight = self.frame.size.height;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(originWidth * (num - 1), 0, originWidth, originHeight)];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height*.05, self.frame.size.width*.8, 60)];
    titleLabel.center = CGPointMake(self.center.x, self.frame.size.height*.1);
    titleLabel.text = text;
    titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:40.0];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment =  NSTextAlignmentCenter;
    titleLabel.numberOfLines = 0;
    [view addSubview:titleLabel];
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width*.1, self.frame.size.height*.1, self.frame.size.width*.8, self.frame.size.width)];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    imageview.image = [UIImage imageNamed:image];
    [view addSubview:imageview];
    
    UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width*.1, self.frame.size.height*.7, self.frame.size.width*.8, 60)];
    descriptionLabel.text = [NSString stringWithFormat:description];
    descriptionLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:18.0];
    descriptionLabel.textColor = [UIColor whiteColor];
    descriptionLabel.textAlignment =  NSTextAlignmentCenter;
    descriptionLabel.numberOfLines = 0;
    [descriptionLabel sizeToFit];
    [view addSubview:descriptionLabel];
    
    CGPoint labelCenter = CGPointMake(self.center.x, self.frame.size.height*.7);
    descriptionLabel.center = labelCenter;
    
    self.scrollView.delegate = self;
    [self.scrollView addSubview:view];
    
}



@end
