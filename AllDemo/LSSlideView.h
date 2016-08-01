//
//  LSSlideView.h
//  LSdiyView
//
//  Created by  tsou117 on 15/4/30.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#import <UIKit/UIKit.h>

#define IMAGE_HEIGHT 160

@interface LSSlideView : UIScrollView
<UIScrollViewDelegate>
@property (nonatomic,strong,readwrite) NSArray* imageArr;
@property (nonatomic,strong,readwrite) NSArray* imageUrlArr;
@property (nonatomic,copy) void(^selected)(NSInteger index);
@end
