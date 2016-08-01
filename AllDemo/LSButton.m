//
//  LSButton.m
//  MyDemo
//
//  Created by  tsou117 on 15/5/8.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#import "LSButton.h"

@implementation LSButton
{
    UIImageView* bgImgView;
   // UILabel* titleLabel;
   // UIImageView* markImgView;
}

@synthesize titleLabel = _titleLabel;
@synthesize markImgView = _markImgView;

@synthesize title = _title;
@synthesize markImg = _markImg;
@synthesize backgroundImage = _backgroundImage;
@synthesize markAlignment = _markAlignment;
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
        self.frame = frame;
        self.clipsToBounds = NO;
        
        //
        bgImgView = [[UIImageView alloc] initWithFrame:self.bounds];
        bgImgView.backgroundColor = [UIColor clearColor];
        bgImgView.contentMode = UIViewContentModeScaleAspectFill;
        bgImgView.clipsToBounds = NO;
        [self addSubview:bgImgView];
        
        //
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor = [UIColor darkGrayColor];
        _titleLabel.textAlignment = 1;
        _titleLabel.font = TEXTFONT;
        [self addSubview:_titleLabel];
        
        //
        _markImgView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _markImgView.backgroundColor = [UIColor clearColor];
        _markImgView.contentMode = UIViewContentModeCenter;
        [self addSubview:_markImgView];
        
        //default is right
        self.markAlignment = 2;
        
    }
    return self;
}

#pragma mark - A

- (void)setTitle:(NSString *)title{
    _title = title;
    
    _titleLabel.text = title;
    

    switch (_markAlignment) {
        case 0:{
            //
            [self markAlignmentNone];
            break;
        }
        case 1:{
            [self markAlignmentLeft];
            break;
        }
        case 2:{
            [self markAlignmentRight];
            break;
        }
        default:
            
            break;
    }

}

- (void)setMarkImg:(UIImage *)markImg{
    _markImg = markImg;
    _markImgView.image = markImg;
    _markImgView.hidden = NO;
    
    switch (_markAlignment) {
        case 0:{
            //
            [self markAlignmentNone];
            break;
        }
        case 1:{
            [self markAlignmentLeft];
            break;
        }
        case 2:{
            [self markAlignmentRight];
            break;
        }
        default:
            
            break;
    }
}

- (void)setBackgroundImage:(UIImage *)backgroundImage{
    _backgroundImage = backgroundImage;
    bgImgView.image = backgroundImage;
}

- (void)setMarkAlignment:(LSMarkAlignment)markAlignment{
    
    _markAlignment = markAlignment;
    switch (markAlignment) {
        case 0:{
            //
            [self markAlignmentNone];
            break;
        }
        case 1:{
            [self markAlignmentLeft];
            break;
        }
        case 2:{
            [self markAlignmentRight];
            break;
        }
        default:
            break;
    }
}

- (void)markAlignmentNone{
    CGSize size = [LSFactory getStringSizeWith:_title boundingRectWithSize:CGSizeMake(self.bounds.size.width-5, self.bounds.size.height) font:TEXTFONT];
    
    CGFloat jxW = (self.bounds.size.width-size.width-5)/2;
    
    _titleLabel.frame = CGRectMake(jxW, 0, size.width, self.bounds.size.height);
    _markImgView.frame = CGRectZero;
    _markImgView.hidden = YES;
}

- (void)markAlignmentLeft{
    CGSize size = [LSFactory getStringSizeWith:_title boundingRectWithSize:CGSizeMake(self.bounds.size.width-25, self.bounds.size.height) font:TEXTFONT];
    
    CGFloat jxW = (self.bounds.size.width-size.width-25)/2;
    
    _markImgView.frame = CGRectMake(jxW, 12, 20, 20);
    _titleLabel.frame = CGRectMake(jxW+20, 0, size.width, self.bounds.size.height);

}

- (void)markAlignmentRight{
    
    CGSize size = [LSFactory getStringSizeWith:_title boundingRectWithSize:CGSizeMake(self.bounds.size.width-25, self.bounds.size.height) font:TEXTFONT];
    
    CGFloat jxW = (self.bounds.size.width-size.width-25)/2;
    
    _titleLabel.frame = CGRectMake(jxW, 0, size.width, self.bounds.size.height);
    _markImgView.frame = CGRectMake(_titleLabel.frame.origin.x+_titleLabel.frame.size.width, 12, 20, 20);
}

#pragma mark - B

- (void)settitleColor:(UIColor*)color{
    _titleLabel.textColor = color;
}

@end
