//
//  LSNavBar.m
//  MyDemo
//
//  Created by  tsou117 on 15/4/27.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#import "LSNavBar.h"

@implementation LSNavBar
{
    UILabel* titleLb;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
        
        self.backgroundColor = [UIColor colorWithRed:1.000 green:1.000 blue:1.000 alpha:0.85];

        titleLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, frame.size.width, 44)];
        titleLb.textAlignment = 1;
        titleLb.backgroundColor = [UIColor clearColor];
        titleLb.font = [UIFont boldSystemFontOfSize:15];
        titleLb.textColor = [UIColor blackColor];
        [self addSubview:titleLb];
        
        UIView* line = [[UIView alloc] initWithFrame:CGRectMake(0, 63.5, frame.size.width, 0.5)];
        line.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:line];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
}

- (void)setTitle:(NSString *)title{
    titleLb.text = title;
}

- (UIButton*)setLeftBtnWithTitle:(NSString*)title{
    
    UIButton* bt = [UIButton buttonWithType:UIButtonTypeCustom];
    bt.frame = CGRectMake(5, 20, 44, self.frame.size.height);
    [bt setTitle:title forState:UIControlStateNormal];
    [bt setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self addSubview:bt];
    return bt;
}
- (UIButton*)setRightBtnWithTitle:(NSString*)title{
    
    UIButton* bt = [UIButton buttonWithType:UIButtonTypeCustom];
    bt.frame = CGRectMake(self.frame.size.width-44-5, 20, 44, self.frame.size.height);
    [bt setTitle:title forState:UIControlStateNormal];
    [self addSubview:bt];
    return bt;
}

@end
