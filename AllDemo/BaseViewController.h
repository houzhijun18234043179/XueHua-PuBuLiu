//
//  BaseViewController.h
//  AllDemo
//
//  Created by  tsou117 on 15-1-22.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#define IsIOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)//系统版本大于7.0

#import <UIKit/UIKit.h>
#import "LSFactory.h"
#import "LSToolBar.h"
#import "LSNavBar.h"
#import "LSDebugTools.h"


@interface BaseViewController : UIViewController
<UIGestureRecognizerDelegate>

@property (nonatomic,strong) LSNavBar* navBar;
@property (nonatomic,strong) LSToolBar* bottomBar;

@end
