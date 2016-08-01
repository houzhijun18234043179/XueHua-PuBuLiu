//
//  HomeTableViewController.m
//  AllDemo
//
//  Created by  tsou117 on 15-1-21.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#import "HomeTableViewController.h"

#import "SnowingViewController.h"
#import "NowTimeViewController.h"
#import "ImgZoomViewController.h"
#import "GlassViewController.h"
#import "TableStyle1ViewController.h"
#import "CarouselViewController.h"
#import "SlideViewController.h"
#import "TMenuViewController.h"

#import "LSNavBar.h"

@interface HomeTableViewController ()

@end

@implementation HomeTableViewController
{
    NSArray* infos;
    
    UITableView* myTableView;
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.navigationController.navigationBarHidden = YES;

    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    
    //
    myTableView = [[UITableView alloc] initWithFrame:CGRectZero];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [self.view addSubview:myTableView];
    
    //
    LSNavBar* navBar = [[LSNavBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    navBar.title = @"myDemo";
    [self.view addSubview:navBar];
    
    NSString* plistP = [[NSBundle mainBundle] pathForResource:@"MyPlist" ofType:@"plist"];
    NSDictionary* dic = [[NSDictionary alloc] initWithContentsOfFile:plistP];
    LSLog(dic);
    
    infos = dic[@"HomeInfo"];
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    myTableView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    myTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);

}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    
    if (self.navigationController.viewControllers.count == 1)//关闭主界面的右滑返回
    {
        return NO;
    }
    else
    {
        return YES;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return infos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellID = @"homeCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.textLabel.text = infos[indexPath.row][@"title"];
    cell.detailTextLabel.text = infos[indexPath.row][@"detail"];
    cell.detailTextLabel.textColor = [UIColor redColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
//    
//    NSString* currStr = cell.textLabel.text;
    NSString* typeid = infos[indexPath.row][@"typeID"];
    
    
    switch ([typeid intValue]) {
        case 0:{
            //飘雪效果
            SnowingViewController* snow_vc = [[SnowingViewController alloc] init];
            [self.navigationController pushViewController:snow_vc animated:YES];
            
            break;
        }
        case 1:{
            //动态时间
            NowTimeViewController* time_vc = [[NowTimeViewController alloc] init];
            [self.navigationController pushViewController:time_vc animated:YES];
            
            break;
        }
        case 2:{
            //图片缩放
            ImgZoomViewController* img_vc = [[ImgZoomViewController alloc] init];
            [self.navigationController pushViewController:img_vc animated:YES];
            break;
        }
        case 3:{
            //毛玻璃效果
            GlassViewController* glass_vc = [[GlassViewController alloc] init];
            [self.navigationController pushViewController:glass_vc animated:YES];
            break;
        }
        case 4:{
            //UITableView 样式1
            TableStyle1ViewController* table_vc = [[TableStyle1ViewController alloc] init];
            [self.navigationController pushViewController:table_vc animated:YES];
            break;
            
        }
        case 5:{
            //查看gif
            
            
            
            break;
            
        }
        case 6:{
            //cover flow视图
            
            CarouselViewController* carousel_vc = [[CarouselViewController alloc] init];
            [self.navigationController pushViewController:carousel_vc animated:YES];
            
            break;
        }
        case 7:{
            //无线循环滑动视图
            
            SlideViewController* slide_vc = [[SlideViewController alloc] init];
            [self.navigationController pushViewController:slide_vc animated:YES];
            
            break;
        }
        case 8:{
            //T型列表菜单
            TMenuViewController* tmenu_vc = [[TMenuViewController alloc] init];
            [self.navigationController pushViewController:tmenu_vc animated:YES];
            break;
        }
            
        default:
            break;
    }
    
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
