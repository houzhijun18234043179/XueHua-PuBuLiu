//
//  ImgZoomViewController.m
//  MyDemo
//
//  Created by Sen on 15/1/25.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#define cellHeight self.contentView.bounds.size.width/2

#import "ImgZoomViewController.h"
#import "ImgZoomView.h"

#import "MyCollectionViewCell.h"

@interface ImgZoomViewController ()

@end

@implementation ImgZoomViewController
{
    NSMutableArray* imgArr;
    
    UICollectionView* myCollectionView;
    LSToolBar* myToolBar;
    
    MyLayout* layout;
    NSMutableArray* testImgArr;
    
    CGFloat content_y;
    
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
    // Do any additional setup after loading the view from its nib.
    
//    self.view.backgroundColor = [UIColor colorWithRed:0.706 green:0.706 blue:0.706 alpha:1];
    
    imgArr = [NSMutableArray array];
    
    //
    layout = [[MyLayout alloc] init];
    layout.delegate = self;
    
    myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    myCollectionView.delegate = self;
    myCollectionView.dataSource = self;
    myCollectionView.scrollEnabled = YES;
    [self.view addSubview:myCollectionView];
    myCollectionView.backgroundColor = [UIColor clearColor];
    [myCollectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"MyCollectionViewCell"];
    
    
    [super viewDidLoad];
    
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    myCollectionView.frame = CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height-20);
    myCollectionView.contentInset = UIEdgeInsetsMake(0, 0, 59, 0);
    
    content_y = 0;
}

- (void)actionOfTap:(UIButton*)sender{
    
}

#pragma mark - UICollectionView delegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat cell_w = (collectionView.bounds.size.width-24)/5;

    //图片的高度
    UIImage* itemImg = [UIImage imageNamed:[NSString stringWithFormat:@"test_%@.png",testImgArr[indexPath.row]]];
    CGSize imgSize = itemImg.size;
    
    CGFloat img_h = (imgSize.height*cell_w)/imgSize.width;
    
    return CGSizeMake(cell_w, img_h);

}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0,10, 0,10);
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return testImgArr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionViews cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectionViewCell *cell = (MyCollectionViewCell *)[collectionViews dequeueReusableCellWithReuseIdentifier:@"MyCollectionViewCell" forIndexPath:indexPath];
    

    
    CGFloat cell_w = cell.bounds.size.width;
    
    //
    cell.imageview.frame = CGRectMake(0, 0, cell_w, 100);
    
    UIImage* itemImg = [UIImage imageNamed:[NSString stringWithFormat:@"test_%@.png",testImgArr[indexPath.row]]];
    
    CGSize imgSize = itemImg.size;
    CGRect imgRect = CGRectMake(
                                0,
                                0,
                                cell_w,
                                (imgSize.height*cell_w)/imgSize.width);
    
    cell.imageview.image = [LSFactory scaleToSize:itemImg size:CGSizeMake(imgRect.size.width, imgRect.size.height)];
    
    cell.imageview.frame = imgRect;
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    MyCollectionViewCell* cell = (MyCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    cell.imageview.hidden = YES;
    
    ImgZoomView* zoomV = [[ImgZoomView alloc] initWithFirstFrame:(CGRectMake(cell.frame.origin.x, cell.frame.origin.y+20-content_y, cell.frame.size.width, cell.frame.size.height))];
    zoomV.currImg = [UIImage imageNamed:[NSString stringWithFormat:@"test_%@.png",testImgArr[indexPath.row]]];
    [zoomV show];
    zoomV.BlockClose = ^(BOOL done){
        
        cell.imageview.hidden = NO;
    };
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    content_y = scrollView.contentOffset.y;
    
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
