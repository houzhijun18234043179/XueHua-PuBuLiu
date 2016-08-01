//
//  LSToolBar.m
//  MyDemo
//
//  Created by  tsou117 on 15-4-22.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#import "LSToolBar.h"

@implementation LSToolBar

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
        
        self.backgroundColor = [UIColor colorWithRed:0.973 green:0.973 blue:0.973 alpha:0.85];
        
        UIView* line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 0.5)];
        line.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:line];
        

        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
}

- (UIButton*)setLeftBtnWithTitle:(NSString*)title{
    
    UIButton* bt = [UIButton buttonWithType:UIButtonTypeCustom];
    bt.frame = CGRectMake(5, 0, 44, self.frame.size.height);
    bt.titleLabel.font = [UIFont systemFontOfSize:16];
    [bt setTitle:title forState:UIControlStateNormal];
    [bt setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self addSubview:bt];
    return bt;
}
- (UIButton*)setRightBtnWithTitle:(NSString*)title{
    
    CGSize size = [LSFactory getStringSizeWith:title boundingRectWithSize:CGSizeMake(100, self.frame.size.height) font:[UIFont systemFontOfSize:16]];
    
    UIButton* bt = [UIButton buttonWithType:UIButtonTypeCustom];
    bt.frame = CGRectMake(self.frame.size.width-size.width-5, 0, size.width, self.frame.size.height);
    bt.titleLabel.font = [UIFont systemFontOfSize:16];
    [bt setTitle:title forState:UIControlStateNormal];
    [bt setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self addSubview:bt];
    return bt;
}

@end
