//
//  BaseViewController.m
//  AllDemo
//
//  Created by  tsou117 on 15-1-22.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
{
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    //    if (IsIOS7) {
    //        self.edgesForExtendedLayout = UIRectEdgeNone;
    //        self.extendedLayoutIncludesOpaqueBars = NO;
    //        self.modalPresentationCapturesStatusBarAppearance = NO;
    //        self.navigationController.navigationBar.translucent = NO;
    //        self.tabBarController.tabBar.translucent = NO;
    //    }
    //    
    //#endif
    
    self.view.backgroundColor = [UIColor colorWithRed:0.937 green:0.937 blue:0.957 alpha:1];

    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    _bottomBar = [[LSToolBar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height-50, self.view.bounds.size.width, 50)];
    _bottomBar.tintColor = [UIColor whiteColor];
    UIButton* leftBtn = [_bottomBar setLeftBtnWithTitle:@"返回"];
    [leftBtn addTarget:self action:@selector(actionOfBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_bottomBar];
    
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
//    _bottomBar.frame = CGRectMake(0, self.view.bounds.size.height-50, self.view.bounds.size.width, 50);

    
}

- (void)actionOfBack:(UIButton*)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
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
