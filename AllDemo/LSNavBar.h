//
//  LSNavBar.h
//  MyDemo
//
//  Created by  tsou117 on 15/4/27.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "FXBlurView.h"

@interface LSNavBar : UIView

@property (nonatomic,strong) NSString* title;

- (UIButton*)setLeftBtnWithTitle:(NSString*)title;
- (UIButton*)setRightBtnWithTitle:(NSString*)title;

@end
