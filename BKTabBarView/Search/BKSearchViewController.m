//
//  BKSearchViewController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/22.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "BKSearchViewController.h"
#import "WBSearchBar.h"
#import "BKSearchRequirementButton.h"

#define BtnMargin 0
#define BtnBtnMarginH 15
#define BtnBtnMarginV 10
@interface BKSearchViewController ()<UITabBarDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (nonatomic, weak)UIView *requireSearchView;
@property (nonatomic, weak)UIView *requirementAdd;

@property (nonatomic,weak)BKSearchRequirementButton *sexBtn;
@property (nonatomic,weak)BKSearchRequirementButton *sizeBtn;
@property (nonatomic,weak)BKSearchRequirementButton *featureBtn;
@property (nonatomic, weak)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *requirements;
@end

@implementation BKSearchViewController

-(NSMutableArray *)requirements
{
    if(!_requirements){
        _requirements = [NSMutableArray array];
    }
    return _requirements;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //设置导航栏
    [self setNav];
    
   // 设置搜索按钮
    [self setRequireSearch];
    
    //设置列表
    [self setUpTableView];
    
}

//设置列表
-(void)setUpTableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.requireSearchView.frame), self.view.bounds.size.width, self.view.bounds.size.height - CGRectGetMaxY(self.requireSearchView.frame))];
    [self.view addSubview:tableView];
    self.tableView = tableView;
}


#pragma mark tableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }

    
    return cell;
}


-(NSArray *)finalRequirements
{
    self.requirements = nil;
    if(![self.sexBtn.currentTitle isEqualToString:self.sexBtn.name]){
        self.sexBtn.selectedReqs = self.sexBtn.currentTitle;
        [self.requirements addObject:self.sexBtn.selectedReqs];
    }
    if(![self.sizeBtn.currentTitle isEqualToString:self.sizeBtn.name]){
        self.sizeBtn.selectedReqs = self.sizeBtn.currentTitle;
        [self.requirements addObject:self.sizeBtn.selectedReqs];
    }
    if(![self.featureBtn.currentTitle isEqualToString:self.featureBtn.name]){
        self.featureBtn.selectedReqs = self.featureBtn.currentTitle;
        [self.requirements addObject:self.featureBtn.selectedReqs];
    }
    return self.requirements;
}

-(void)setRequireSearch
{
    CGFloat seaW = self.view.bounds.size.width;
    CGFloat seaH = 30;
    UIView *requireSearchView = [[UIView alloc] init];
    requireSearchView.frame = CGRectMake(0, 64, seaW, seaH);
    //requireSearchView.backgroundColor = [UIColor redColor];
    [self.view addSubview:requireSearchView];
    self.requireSearchView = requireSearchView;
    
    CGFloat btnW = (seaW - 2 * BtnMargin)/3;
   
    
    
    NSArray *arraySex= @[@"男",@"女"];
    BKSearchRequirementButton *sexBtn = [self btnWithName:@"性别" array:arraySex height:seaH width:btnW positonX:0 action:@selector(addRequirement:)];
    sexBtn.tag = 1;
    self.sexBtn = sexBtn;
    

      NSArray *arraySize = @[@"平面模特",@"Cosplay",@"广告模特",@"演员",@"礼仪",@"展会模特",@"支持人",@"歌手",@"舞者",@"T台模特",@"外模",@"车展模特"];
    BKSearchRequirementButton *sizeBtn = [self btnWithName:@"类型" array:arraySize height:seaH width:btnW positonX:(BtnMargin + btnW) action:@selector(addRequirement:)];
    sizeBtn.tag = 2;
    self.sizeBtn = sizeBtn;
    
    
    NSArray *arrayFeature = @[@"清纯",@"性感",@"可爱",@"甜美",@"阳光",@"成熟",@"运动",@"时尚",@"欧美风",@"大模范",@"日韩系"];
    BKSearchRequirementButton *featureBtn = [self btnWithName:@"风格" array:arrayFeature height:seaH width:btnW positonX:2 * (BtnMargin + btnW) action:@selector(addRequirement:)];
    featureBtn.tag = 3;
    self.featureBtn = featureBtn;
}

-(BKSearchRequirementButton *)btnWithName:(NSString *)name array:(NSArray *)array height:(CGFloat)height width:(CGFloat)width positonX:(CGFloat)positionX action:(SEL)action
{
    CGFloat btnH = height;
    BKSearchRequirementButton *btn = [[BKSearchRequirementButton alloc] initWithFrame:CGRectMake(positionX, 0, width, btnH)];
    btn.name = name;
    btn.reqs = array;
    btn.selectedReqs = nil;
    [btn setTitle:name forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //btn.backgroundColor = BKRandomColor;
    //btn.layer.borderColor = [UIColor grayColor].CGColor;
    //btn.layer.borderWidth = 3;
    [btn setBackgroundImage:[UIImage imageNamed:@"button_background"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"button_background_selected"] forState:UIControlStateHighlighted];
    [btn setBackgroundImage:[UIImage imageNamed:@"button_background_selected"] forState:UIControlStateSelected];
    [btn setBackgroundImage:[UIImage imageNamed:@"button_background_selected"] forState:UIControlStateReserved];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    btn.adjustsImageWhenHighlighted = NO;
    [self.requireSearchView addSubview:btn];
    

    return  btn;
}

-(void)addRequirement:(BKSearchRequirementButton *)sender
{
    if(![sender.titleLabel.text isEqualToString:sender.name])
    {
        [sender setTitle:sender.name forState:UIControlStateNormal];
        [sender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    if(sender.selected == NO){
        if(self.sexBtn.selected == YES || self.sizeBtn.selected == YES || self.featureBtn.selected == YES){
            [self.requirementAdd removeFromSuperview];
            self.sexBtn.selected = NO;
            self.sizeBtn.selected = NO;
            self.featureBtn.selected = NO;
        }
        UIView *requirementAdd = [[UIView alloc] init];
        //requirementAdd.backgroundColor = [UIColor whiteColor];
        
        requirementAdd.width = [UIScreen mainScreen].bounds.size.width;
        requirementAdd.height = 100;
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"button_background"];
        imageView.frame = requirementAdd.bounds;
        [requirementAdd addSubview:imageView];
        
        
        requirementAdd.y = CGRectGetMaxY(self.requireSearchView.frame);
        requirementAdd.x = 0;
        
        

        requirementAdd.height = [self requirementsBtnWithArray:sender.reqs superView:requirementAdd whichButton:sender];
        imageView.height = requirementAdd.height;
        [self.view addSubview:requirementAdd];
        
        self.requirementAdd = requirementAdd;
        //sender.enabled = NO;
        sender.selected = YES;
    }else{
        sender.selected = NO;
        [self.requirementAdd removeFromSuperview];
    }

}



//条件按钮
-(CGFloat)requirementsBtnWithArray:(NSArray *)array superView:(UIView *)view whichButton:(BKSearchRequirementButton *)sender
{
    CGFloat btnW = 60;
    CGFloat btnH = 20;
    int numofRow = 4;
    CGFloat requirementAddH = 0;;
    for(int i = 0;i < array.count; i++){
        int row = i / numofRow;
        int col = i % numofRow;
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake((BtnBtnMarginH + btnW) * col +BtnBtnMarginH,  (BtnBtnMarginV + btnH) * row +BtnBtnMarginV , btnW, btnH)];
        [btn setTitle:array[i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.backgroundColor = BKColorPink ;
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitleColor:BKColor(121, 188, 230, 1) forState:UIControlStateHighlighted];
        btn.tag = sender.tag;
        [btn addTarget:self action:@selector(requireBtnClick:) forControlEvents:UIControlEventTouchUpInside];
       // btn.layer.borderWidth =.5;
       // btn.layer.borderColor = [UIColor blackColor].CGColor;
        btn.layer.cornerRadius = 5;
        [view addSubview:btn];
        requirementAddH = (BtnBtnMarginV + btnH) * (row + 1) +BtnBtnMarginV *2;
    }
      BKLog(@"%lf",requirementAddH);
    return requirementAddH;
  
}

-(void)requireBtnClick:(UIButton *)sender
{
    [self.requirementAdd removeFromSuperview];
    if(self.sexBtn.tag == sender.tag){
        [self.sexBtn setTitle:sender.titleLabel.text forState:UIControlStateNormal];
        
        [self.sexBtn setTitleColor:BKColor(121, 188, 230, 1) forState:UIControlStateNormal];
        self.sexBtn.selected = NO;
    }else if(self.featureBtn.tag == sender.tag){
        [self.featureBtn setTitle:sender.titleLabel.text forState:UIControlStateNormal];
        
        [self.featureBtn setTitleColor:BKColor(121, 188, 230, 1) forState:UIControlStateNormal];
        self.featureBtn.selected = NO;
    }else if (self.sizeBtn.tag == sender.tag){
        [self.sizeBtn setTitle:sender.titleLabel.text forState:UIControlStateNormal];
        
        [self.sizeBtn setTitleColor:BKColor(121, 188, 230, 1) forState:UIControlStateNormal];
        self.sizeBtn.selected = NO;
    }
}

//设置导航栏
-(void)setNav
{
    WBSearchBar *searchBar = [WBSearchBar searchBar];
    //设置textfield代理
    searchBar.delegate = self;
    self.navigationItem.titleView = searchBar;
    
    
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"search_white"] forState:UIControlStateNormal];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"search_selected"] forState:UIControlStateHighlighted];
    [rightButton addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc ]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightBarButton;
}

//搜索按钮点击时
-(void)rightButtonClick
{
    [self.navigationItem.titleView resignFirstResponder];
    BKLog(@"%@",[self finalRequirements]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//控制键盘收回
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.navigationItem.titleView resignFirstResponder];
    [self.requirementAdd removeFromSuperview];
    self.sexBtn.selected = NO;
    self.sizeBtn.selected = NO;
    self.featureBtn.selected = NO;
}

//控制键盘收回
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
    
}

@end
