//
//  TableStyle1ViewController.m
//  MyDemo
//
//  Created by  tsou117 on 15-2-6.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#define IsIOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)//系统版本大于7.0

#import "TableStyle1ViewController.h"
#import "Style1Cell.h"
@interface TableStyle1ViewController ()

@end

@implementation TableStyle1ViewController
{
    UITableView* myTableView;
    
    CGFloat cell_h;
    
    NSMutableArray* testImgArr;
    
    NSString* testTitleStr;
    
}

- (id)init
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
        
        testTitleStr = @"《权力的游戏》是一部中世纪史诗奇幻题材的电视连续剧，该剧以美国作家乔治·R·R·马丁的奇幻巨作《冰与火之歌》七部曲为基础改编创作。故事背景中虚构的世界，分为两片大陆：位于西面的“日落国度”维斯特洛；位于东面的类似亚欧大陆。维斯特洛大陆边境处发现远古传说中早已灭绝的生物开始，危险也渐渐在靠近这里。这片大陆的临冬城主暨北境统领艾德史塔克家族也迎来了老友兼国王劳勃·拜拉席恩的来访。国王希望艾德·史塔克（肖恩·宾 Sean Bean 饰）能担任首相一职，对抗企图夺取铁王座的叛军。危情一触即发，整个王国看似平和的表面下却是波涛暗涌。权高位重的拜拉席恩家族、勇敢善良的史塔克家族、企图谋取王位的坦格利安家族、有着不可告人秘密的兰尼斯特家族。这些家族各怀鬼胎，这个国家将会陷入一场混战.....";

    }
    return self;
}

- (void)viewDidLoad {
    // Do any additional setup after loading the view.
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    if (IsIOS7) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
        self.navigationController.navigationBar.translucent = NO;
        self.tabBarController.tabBar.translucent = NO;
    }
    
#endif
    
    
    myTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    myTableView.backgroundColor = [UIColor blackColor];
    myTableView.showsVerticalScrollIndicator = NO;
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:myTableView];
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    myTableView.frame = CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height-20);
    myTableView.contentInset = UIEdgeInsetsMake(0, 0, 50, 0);
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 12;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 160;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellID = @"style1Cell";
    Style1Cell* cell = (Style1Cell*)[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[Style1Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID withFrame:CGRectMake(0, 0, tableView.bounds.size.width, 120)];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    
    UIImage* itemImg = [UIImage imageNamed:[NSString stringWithFormat:@"test_%@.png",testImgArr[indexPath.row]]];

    
    cell.image = itemImg;
    
    CGFloat yOffset = ((myTableView.contentOffset.y - cell.frame.origin.y) / IMAGE_HEIGHT) * IMAGE_OFFSET_SPEED;
    
    cell.imageOffset = CGPointMake(0.0f, yOffset);
    
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSArray* visibleCells = [myTableView visibleCells];
    
    float ff = scrollView.contentOffset.y/(scrollView.contentSize.height+50-scrollView.bounds.size.height);

    if (ff <= 0 || ff >= 1) {
        //
        if (ff<=0.5) {
            //
            ff = 1 + ff/2;
        }else{
            ff = 1+(1-ff)/2;
        }
        
        for (Style1Cell* cell in visibleCells) {
            //
            [cell cellViewChangeTrans:ff];
        }
        
    }else{
        
    }

    for(Style1Cell *view in myTableView.visibleCells) {
        CGFloat yOffset = ((myTableView.contentOffset.y - view.frame.origin.y) / IMAGE_HEIGHT) * IMAGE_OFFSET_SPEED;
        view.imageOffset = CGPointMake(0.0f, yOffset);
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
