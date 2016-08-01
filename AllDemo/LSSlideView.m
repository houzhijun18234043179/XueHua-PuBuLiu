//
//  LSSlideView.m
//  LSdiyView
//
//  Created by  tsou117 on 15/4/30.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#import "LSSlideView.h"

static NSUInteger currentImage = 0;//记录中间图片的下标,开始总是为1

@implementation LSSlideView
{
    UIImageView* leftImgView;
    UIImageView* centerImgView;
    UIImageView* rightImgView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) [self setupImageView];
    
    return self;
}

#pragma mark - Setup Method

- (void)setupImageView{
    
    self.bounces = NO;
    self.clipsToBounds = YES;
    self.pagingEnabled = YES;
    self.delegate = self;
    
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    
    CGFloat self_w = self.bounds.size.width;
    
    self.contentSize = CGSizeMake(self_w*3, IMAGE_HEIGHT);
    
    self.contentOffset = CGPointMake(self_w, 0);

    
    leftImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self_w, IMAGE_HEIGHT)];
    [self addSubview:leftImgView];
    
    centerImgView = [[UIImageView alloc] initWithFrame:CGRectMake(self_w, 0, self_w, IMAGE_HEIGHT)];
    [self addSubview:centerImgView];
    
    rightImgView = [[UIImageView alloc] initWithFrame:CGRectMake(self_w*2, 0, self_w, IMAGE_HEIGHT)];
    [self addSubview:rightImgView];
    
    for (UIImageView* obj in self.subviews) {
        obj.userInteractionEnabled = YES;
        obj.contentMode = UIViewContentModeScaleAspectFill;
        obj.clipsToBounds = YES;
        obj.backgroundColor = [UIColor grayColor];
    }
    
    UITapGestureRecognizer* center_tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionOfScelect:)];
    [centerImgView addGestureRecognizer:center_tap];
}

- (void)setImageArr:(NSArray *)imageArr{
    
    if (imageArr.count == 0 || imageArr == nil) {
        //
        return;
    }
    
    _imageArr = imageArr;
    
    if (imageArr.count == 1)
    {
        //
        leftImgView.image = imageArr[0];
        centerImgView.image =  imageArr[0];
        rightImgView.image = imageArr[0];

    }
    else if (imageArr.count == 2)
    {
        //
        leftImgView.image = imageArr[1];
        centerImgView.image = imageArr[0];
        rightImgView.image = imageArr[1];

    }
    else
    {
        //
        leftImgView.image = imageArr[imageArr.count-1];
        centerImgView.image = imageArr[0];
        rightImgView.image = imageArr[1];
        
    }
    
}

- (void)setImageUrlArr:(NSArray *)imageUrlArr{
    
    //
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    //NSLog(@"cont.x = %f",scrollView.contentOffset.x/self.bounds.size.width);
    
    if (_imageArr.count == 0 || _imageArr == nil) {
        return;
    }
    
    if (self.contentOffset.x == 0)
    {
        //
        if (currentImage == 0) {
            //
            currentImage = _imageArr.count-1;
        }else{
            currentImage = (currentImage-1)%_imageArr.count;
        }
    }
    else if (self.contentOffset.x == self.bounds.size.width*2)
    {
        //
        currentImage = (currentImage+1)%_imageArr.count;

    }
    else
    {
        //
        return;
    }
    
    if (currentImage == 0) {
        //
        leftImgView.image = _imageArr[_imageArr.count-1];

    }else{
        leftImgView.image = _imageArr[(currentImage-1)%_imageArr.count];
    }
    
    centerImgView.image = _imageArr[currentImage%_imageArr.count];
    rightImgView.image = _imageArr[(currentImage+1)%_imageArr.count];
    
    
    self.contentOffset = CGPointMake(self.bounds.size.width, 0);
    
}

- (void)actionOfScelect:(UITapGestureRecognizer*)sender{
    if (self.selected) {
        self.selected(currentImage);
    }
}

@end
