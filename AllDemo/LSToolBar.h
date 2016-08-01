//
//  LSToolBar.h
//  MyDemo
//
//  Created by  tsou117 on 15-4-22.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#import "FXBlurView.h"
#import "LSFactory.h"

@interface LSToolBar : FXBlurView

- (UIButton*)setLeftBtnWithTitle:(NSString*)title;
- (UIButton*)setRightBtnWithTitle:(NSString*)title;
@end
