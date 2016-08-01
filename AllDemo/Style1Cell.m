//
//  Style1Cell.m
//  MyDemo
//
//  Created by  tsou117 on 15/4/29.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#import "Style1Cell.h"

@interface Style1Cell()

@property (nonatomic, strong, readwrite) UIImageView *cell_imgView;

@end

@implementation Style1Cell
{
    UIScrollView* scroller;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withFrame:(CGRect)frame
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //
        
        self.clipsToBounds = YES;

        
        scroller = [[UIScrollView alloc] initWithFrame:CGRectMake(5, 5, frame.size.width-10, 150)];
        scroller.backgroundColor = [UIColor clearColor];
        scroller.clipsToBounds = YES;
        scroller.layer.cornerRadius = 5;
        scroller.userInteractionEnabled = NO;
        [self.contentView addSubview:scroller];
        
        self.cell_imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, IMAGE_HEIGHT)];
        self.cell_imgView.backgroundColor = [UIColor grayColor];
        self.cell_imgView.contentMode = UIViewContentModeScaleAspectFill;
        self.cell_imgView.clipsToBounds = NO;
        self.cell_imgView.center = scroller.center;
        [scroller addSubview:self.cell_imgView];

    }
    return self;
}

- (void)setImage:(UIImage *)image{
    self.cell_imgView.image = image;
    
    [self setImageOffset:self.imageOffset];
}

- (void)setImageOffset:(CGPoint)imageOffset
{
    // Store padding value
    _imageOffset = imageOffset;
    
    // Grow image view
    CGRect frame = self.cell_imgView.bounds;
    CGRect offsetFrame = CGRectOffset(frame, _imageOffset.x, _imageOffset.y);
    self.cell_imgView.frame = offsetFrame;
}

- (void)cellViewChangeTrans:(CGFloat)ff{
    CGAffineTransform transformRotate_4 = CGAffineTransformMakeRotation(0);
    CGAffineTransform trans = CGAffineTransformScale(transformRotate_4,ff,ff);
    [scroller setTransform:trans];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
