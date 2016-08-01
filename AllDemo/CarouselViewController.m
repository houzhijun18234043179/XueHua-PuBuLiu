//
//  CarouselViewController.m
//  MyDemo
//
//  Created by  tsou117 on 15/4/30.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#import "CarouselViewController.h"
#import "iCarousel.h"
#import "ImgZoomView.h"

@interface CarouselViewController ()
<iCarouselDelegate,iCarouselDataSource>
@end

@implementation CarouselViewController
{
    iCarousel* carouselView;
    
    NSMutableArray* testImgArr;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        //
        
        testImgArr = [NSMutableArray array];
        
        NSMutableArray* startArr = [NSMutableArray array];
        for (int i = 1; i<18; i++) {
            //
            NSString* obj = [NSString stringWithFormat:@"%d",i];
            [startArr addObject:obj];
        }
        
        NSInteger num = 14;
        for (int j = 0; j<num; j++) {
            
            int t = arc4random()%startArr.count;
            
            testImgArr[j] = startArr[t];
            
            startArr[t] = [startArr lastObject];
            [startArr removeLastObject];
            
        }
        
    }
    return self;
}

- (void)viewDidLoad {
    // Do any additional setup after loading the view.
    
    self.view.clipsToBounds = YES;
    
    carouselView = [[iCarousel alloc] initWithFrame:CGRectZero];
    carouselView.delegate = self;
    carouselView.dataSource = self;
    carouselView.type = iCarouselTypeCoverFlow;
    [self.view addSubview:carouselView];
    
    [super viewDidLoad];

    UIButton* selectBt = [self.bottomBar setRightBtnWithTitle:@"选择类型"];
    [selectBt addTarget:self action:@selector(actionOfSelect:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    carouselView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width);
}

- (void)actionOfSelect:(UIButton*)sender{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"选择类型" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"直线", @"圆圈", @"反向圆圈", @"圆桶", @"反向圆桶", @"封面展示", @"封面展示2", @"纸牌", nil];
    [sheet showInView:self.view];
}

#pragma mark -

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return testImgArr.count;
}

- (UIView*)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index{
    
    UIView* view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"test_%@.png",testImgArr[index]]]];
    view.layer.shouldRasterize = YES;
    view.userInteractionEnabled = YES;
    view.contentMode = UIViewContentModeScaleAspectFill;
    view.clipsToBounds = YES;
    view.tag = 100+index;
    UIImage* itemImg = [UIImage imageNamed:[NSString stringWithFormat:@"test_%@.png",testImgArr[index]]];
    
    CGFloat item_w = self.view.bounds.size.width/2;
    
    CGRect imgRect;
    
    //以图片本身比例显示
    CGSize imgSize = itemImg.size;
    imgRect = CGRectMake(
                                0,
                                0,
                                item_w,
                                (imgSize.height*item_w)/imgSize.width);
    
    //一样的rect
    imgRect = CGRectMake(0, 0, item_w, item_w*2/3);
    
    view.frame = imgRect;
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionOfTap:)];
    [view addGestureRecognizer:tap];
    
    return view;
}

- (void)actionOfTap:(UITapGestureRecognizer*)sender{
    ImgZoomView* zoomV = [[ImgZoomView alloc] initWithFirstFrame:CGRectMake((carouselView.bounds.size.width-sender.view.bounds.size.width)/2, (carouselView.bounds.size.height-sender.view.bounds.size.height)/2, sender.view.bounds.size.width, sender.view.bounds.size.height)];
    zoomV.currImg = [UIImage imageNamed:[NSString stringWithFormat:@"test_%@.png",testImgArr[sender.view.tag-100]]];
    [zoomV show];
    zoomV.BlockClose = ^(BOOL done){
        
    };
}

- (NSUInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel
{
    return 0;
}

- (NSUInteger)numberOfVisibleItemsInCarousel:(iCarousel *)carousel
{
    return testImgArr.count;
}

- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    return self.view.bounds.size.width/2;
}

- (CATransform3D)carousel:(iCarousel *)_carousel transformForItemView:(UIView *)view withOffset:(CGFloat)offset
{
    view.alpha = 1.0 - fminf(fmaxf(offset, 0.0), 1.0);
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = carouselView.perspective;
    transform = CATransform3DRotate(transform, M_PI / 8.0, 0, 1.0, 0);
    return CATransform3DTranslate(transform, 0.0, 0.0, offset * carouselView.itemWidth);
}

- (BOOL)carouselShouldWrap:(iCarousel *)carousel
{
    return YES;
}

#pragma mark - 

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    if (buttonIndex < 8) {
        //
        [UIView beginAnimations:nil context:nil];
        carouselView.type = (iCarouselType)buttonIndex;
        [UIView commitAnimations];
    }
    

}
- (void)actionSheetCancel:(UIActionSheet *)actionSheet{
    
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
