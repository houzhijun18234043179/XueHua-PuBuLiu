//
//  GlassViewController.m
//  MyDemo
//
//  Created by  tsou117 on 15-1-26.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#import "GlassViewController.h"
#import "FXBlurView.h"

@interface GlassViewController ()

@end

@implementation GlassViewController
{
    UIImageView* bgImgV;
    FXBlurView* fxView;
}
- (void)viewDidLoad {
    // Do any additional setup after loading the view.
    
    bgImgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test_16.png"]];
    bgImgV.userInteractionEnabled = YES;
    bgImgV.clipsToBounds = YES;
    [self.view addSubview:bgImgV];
    
    
    fxView = [[FXBlurView alloc] initWithFrame:CGRectZero];
    fxView.tintColor = [UIColor clearColor];
    [bgImgV addSubview:fxView];
    
    UIPanGestureRecognizer* pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [fxView addGestureRecognizer:pan];
    
    [super viewDidLoad];

}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    UIImage* itemImg = [UIImage imageNamed:@"test_16.png"];
    
    CGSize imgSize = itemImg.size;
    CGRect imgRect = CGRectMake(
                                0,
                                self.view.bounds.size.width/2,
                                self.view.bounds.size.width,
                                (imgSize.height*self.view.bounds.size.width)/imgSize.width);
    
    bgImgV.frame = imgRect;
    
    fxView.frame = CGRectMake(0, 0, bgImgV.bounds.size.width, bgImgV.bounds.size.height/2);
}

- (void)addAFXBlurView{

}

- (void) handlePan:(UIPanGestureRecognizer*) recognizer
{
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointZero inView:bgImgV];
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        
        CGPoint velocity = [recognizer velocityInView:self.view];
        CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
        CGFloat slideMult = magnitude / 200;
        NSLog(@"magnitude: %f, slideMult: %f", magnitude, slideMult);
        
        float slideFactor = 0.1 * slideMult; // Increase for more of a slide
        CGPoint finalPoint = CGPointMake(recognizer.view.center.x + (velocity.x * slideFactor),
                                         recognizer.view.center.y + (velocity.y * slideFactor));
        finalPoint.x = MIN(MAX(finalPoint.x, 0), self.view.bounds.size.width);
        finalPoint.y = MIN(MAX(finalPoint.y, 0), self.view.bounds.size.height);
        
//        [UIView animateWithDuration:slideFactor*2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
//            recognizer.view.center = finalPoint;
//        } completion:nil];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
