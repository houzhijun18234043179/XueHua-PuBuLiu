//
//  SlideViewController.m
//  MyDemo
//
//  Created by  tsou117 on 15/5/4.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#import "SlideViewController.h"
#import "LSSlideView.h"
#import "ImgZoomView.h"

@interface SlideViewController ()

@end

@implementation SlideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSArray* testArr = @[[UIImage imageNamed:@"test_1"],
                         [UIImage imageNamed:@"test_2"],
                         [UIImage imageNamed:@"test_3"],
                         [UIImage imageNamed:@"test_4"],
                         [UIImage imageNamed:@"test_5"],
                         [UIImage imageNamed:@"test_6"],
                         [UIImage imageNamed:@"test_7"],
                         [UIImage imageNamed:@"test_8"],
                         [UIImage imageNamed:@"test_9"],
                         [UIImage imageNamed:@"test_10"],
                         [UIImage imageNamed:@"test_11"],
                         [UIImage imageNamed:@"test_12"],
                         [UIImage imageNamed:@"test_13"],
                         [UIImage imageNamed:@"test_14"],
                         [UIImage imageNamed:@"test_15"],
                         [UIImage imageNamed:@"test_16"],
                         [UIImage imageNamed:@"test_17"]];
    
    LSSlideView* sliderView = [[LSSlideView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, IMAGE_HEIGHT)];
    [self.view addSubview:sliderView];
    
    sliderView.imageArr = testArr;
    
    __block LSSlideView* blockV = sliderView;
    sliderView.selected = ^(NSInteger index){
        ImgZoomView* zoomV = [[ImgZoomView alloc] initWithFirstFrame:blockV.frame];
        zoomV.currImg = testArr[index];
        [zoomV show];
        zoomV.BlockClose = ^(BOOL done){
            
        };
    };
    
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
