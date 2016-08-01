//
//  NowTimeViewController.m
//  AllDemo
//
//  Created by  tsou117 on 15-1-22.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#import "NowTimeViewController.h"
#import "TimeView.h"

@interface NowTimeViewController ()

@end

@implementation NowTimeViewController
{
    TimeView* tv;
    NSTimer* _timer;
}
- (void)viewDidLoad {
    // Do any additional setup after loading the view.
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"2015.jpg"]];
    
    tv = [[NSBundle mainBundle] loadNibNamed:@"TimeView" owner:nil options:nil][0];
    [self.view addSubview:tv];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:tv selector:@selector(updateTimeLabel) userInfo:nil repeats:YES];
    
    UILabel* lb1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, self.view.bounds.size.width-40, 0)];
    lb1.backgroundColor = [UIColor orangeColor];
    lb1.textAlignment = 0;
    lb1.text = @"你为何这么叼,这个逼装的眼前一亮，你为何这么叼,这个逼装的眼前一亮，你为何这么叼,这个逼装的眼前一亮,你为何这么叼,这个逼装的眼前一亮,你为何这么叼,这个逼装的眼前一亮";
    lb1.numberOfLines = 0;
    lb1.lineBreakMode = NSLineBreakByTruncatingTail;
    [lb1 sizeToFit];
    [self.view addSubview:lb1];
    
    
    //    FXBlurView* fxv = [[FXBlurView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
//    //fxv.tintColor = [UIColor orangeColor];
//    [fxv setDynamic:YES];
//    [self.view addSubview:fxv];
    [super viewDidLoad];

    

    
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    tv.center = self.view.center;
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
