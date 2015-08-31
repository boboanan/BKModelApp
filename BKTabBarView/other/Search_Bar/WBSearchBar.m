//
//  WBSearchBar.m
//  WB
//
//  Created by 锄禾日当午 on 15/7/6.
//  Copyright (c) 2015年 WWS. All rights reserved.
//

#import "WBSearchBar.h"
#import "WBDropDownMenu.h"
#import "DropDownViewController.h"


@implementation WBSearchBar

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
       
        
        self.font = [UIFont systemFontOfSize:15];
        self.placeholder = @"  请输入搜索条件";
        self.background = [UIImage imageNamed:@"searchbar_textfield_background"];
        self.width = 0.8*[[UIScreen mainScreen] bounds].size.width;
        self.height = 30;
//        UIButton *searchIcon = [[UIButton alloc] init];
//        [searchIcon setBackgroundImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
//        searchIcon.width = 30;
//        searchIcon.height = 30;
//        searchIcon.contentMode = UIViewContentModeCenter;
//        
//        self.leftView = searchIcon;
//        self.leftViewMode = UITextFieldViewModeAlways;
//      
        
        UIButton *searchIcon = [[UIButton alloc] init];
        [searchIcon setBackgroundImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
        searchIcon.width = 30;
        searchIcon.height = 30;
        searchIcon.contentMode = UIViewContentModeCenter;
        [searchIcon addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        self.leftView = searchIcon;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    
    return self;
}

-(void)titleClick:(UIButton *)titleButton
{
    
    WBDropDownMenu *menu = [WBDropDownMenu menu];
    
    //设置内容
    DropDownViewController *vc = [[DropDownViewController alloc] init];
    vc.view.height = 72;
    
    menu.contentController = vc;
    [menu showFrom:titleButton];
    
}


+ (instancetype)searchBar
{
    return [[self alloc] init];
}
@end
