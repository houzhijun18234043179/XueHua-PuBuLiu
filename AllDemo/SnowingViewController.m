//
//  SnowingViewController.m
//  AllDemo
//
//  Created by  tsou117 on 15-1-22.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#import "SnowingViewController.h"

@interface SnowingViewController ()

@end

@implementation SnowingViewController

- (void)viewDidLoad {
    // Do any additional setup after loading the view from its nib.
    

    UIImage* img = [UIImage imageNamed:@"snowBg.jpg"];
    
    UIImageView* bgImgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImgView.image = img;
    [self.view addSubview:bgImgView];
    
    [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(ontime) userInfo:nil repeats:YES];
    
    [super viewDidLoad];

}

- (void)ontime{
    UIImageView* img = [[UIImageView alloc] init];
    img.backgroundColor = [UIColor whiteColor];
    img.alpha = 0.75;
    
    NSInteger ww = self.view.bounds.size.width;
    NSInteger hh = self.view.bounds.size.height;
    
    int x = round(random()%ww);//随机x坐标
    int y = round(random()%ww);//移动的最后x坐标
    int s = round(random()%15)+10;//随机大小
    int sp = 1/round(random()%100)+1;//速度
    
    img.frame = CGRectMake(x, -50, s, s);
    
    img.layer.cornerRadius = s/2;
    
    [self.view addSubview:img];
    
    [UIView transitionWithView:self.view duration:10*sp options:UIViewAnimationOptionCurveEaseInOut animations:^{
                        
                        img.frame = CGRectMake(y, hh-img.bounds.size.height, s, s);//消失的坐标

                    } completion:^(BOOL ok){
                        //雪花融化...
                        [UIView animateWithDuration:10*sp animations:^{
                            img.alpha = 0;
                            img.frame = CGRectMake(y, hh, 0, 0);
                            
                        } completion:^(BOOL ok){
                            [img removeFromSuperview];
                        }];
                    }];
    
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
