//
//  TMenuViewController.m
//  MyDemo
//
//  Created by  tsou117 on 15/5/8.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#import "TMenuViewController.h"
#import "LSSelectMenuView.h"

@interface TMenuViewController ()
<LSSelectMenuViewDelegate,LSSelectMenuViewDataSource>
@end

@implementation TMenuViewController
{
    LSSelectMenuView* menuView;
    NSArray* menuArr;
    UIView* showView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    menuArr = @[@"城市",@"全部分类",@"排序",@"其他的"];
    //选项栏
    menuView = [[LSSelectMenuView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 44)];
    menuView.backgroundColor = [UIColor colorWithRed:0.973 green:0.973 blue:0.973 alpha:1];
    menuView.delegate = self;
    menuView.dataSource = self;
    [self.view addSubview:menuView];

    //展开视图
    showView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64-50)];
    showView.backgroundColor = [UIColor colorWithRed:0.145 green:0.145 blue:0.145 alpha:0.65];
    [self.view addSubview:showView];
    
    menuView.showView = showView;
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

#pragma mark - LSSelectMenuViewDataSource

- (NSInteger)numberOfItemsInMenuView:(LSSelectMenuView *)menuview{
    return menuArr.count;
}
- (NSString*)menuView:(LSSelectMenuView *)menuview titleForItemAtIndex:(NSInteger)index{
    return menuArr[index];
}
- (CGFloat)menuView:(LSSelectMenuView *)menuview heightForCurrViewAtIndex:(NSInteger)index{
    return 200+index*50;
}

- (UIView*)menuView:(LSSelectMenuView *)menuview currViewAtIndex:(NSInteger)index{
    UIView* vv = [[UIView alloc] initWithFrame:CGRectZero];
    vv.backgroundColor = [LSFactory randomColor];
    
    return vv;
}

#pragma mark - LSSelectMenuViewDelegate

- (void)selectMenuView:(LSSelectMenuView *)selectmenuview didSelectAtIndex:(NSInteger)index{
    NSLog(@"show row = %d",index);
    
}

- (void)selectMenuView:(LSSelectMenuView *)selectmenuview didRemoveAtIndex:(NSInteger)index{
    NSLog(@"remove row = %d",index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
