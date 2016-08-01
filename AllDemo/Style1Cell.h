//
//  Style1Cell.h
//  MyDemo
//
//  Created by  tsou117 on 15/4/29.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#import <UIKit/UIKit.h>

#define IMAGE_HEIGHT 200
#define IMAGE_OFFSET_SPEED 25

@interface Style1Cell : UITableViewCell

@property (nonatomic,strong,readwrite) UIImage* image;

@property (nonatomic, assign, readwrite) CGPoint imageOffset;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withFrame:(CGRect)frame;

- (void)cellViewChangeTrans:(CGFloat)ff;

@end
