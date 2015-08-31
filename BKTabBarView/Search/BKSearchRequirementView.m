//
//  BKSearchRequirementView.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/8/24.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKSearchRequirementView.h"
@implementation BKSearchRequirementView
@synthesize firstRequirements = _firstRequirements;
-(NSArray *)firstRequirements
{
    if(_firstRequirements == nil){
#warning 测试数据
        _firstRequirements = @[@"性别",@"类型",@"风格"];
    }
    return _firstRequirements;
}

-(NSArray *)secondRequirements
{
    if(_secondRequirements == nil){
#warning 测试数据
        _secondRequirements = @[@[@"男",@"女",@"未知"],@[@"平面模特",@"广告",@"演员"],@[@"清纯",@"性感",@"可爱"]];
    }
    return _secondRequirements;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        
    }
    return self;
}

-(void)setFirstRequirements:(NSArray *)firstRequirements
{
    _firstRequirements = firstRequirements;
    int count = firstRequirements.count;
    
    CGFloat btnW = [UIScreen mainScreen].bounds.size.width / count;
    CGFloat btnH = self.height;
    for(int i=0; i<count; i++){
        UIButton *btn = [[UIButton alloc] init];
        [btn setTitle:firstRequirements[i] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        btn.frame = CGRectMake(i * btnW, 0, btnH, btnH);
        [self addSubview:btn];
    }
}

@end
