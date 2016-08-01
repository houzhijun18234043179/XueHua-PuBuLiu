//
//  LSDebugTools.m
//  MyDemo
//
//  Created by  tsou117 on 15/5/26.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#import "LSDebugTools.h"

static LSDebugTools* __myTools = nil;

@implementation LSDebugTools
{
    UIWindow* debugView;
    UIScrollView* rootView;
    UILabel* msgLb;
    
    NSMutableString* currlogStr;
}
+ (LSDebugTools*)shareDebugTools{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //
        __myTools = [[LSDebugTools alloc] init];
    });
    return __myTools;
}

//判断状态栏是否被隐藏
- (BOOL)isStatusBarHidden{
    
    UIApplication* app = [UIApplication sharedApplication];
    
    id statusBar = [app valueForKeyPath:@"statusBar"];
    
    if (statusBar) {
        return YES;
    }
    return NO;
    
}

//获取当前时间
- (NSString*)getCurrentTime{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString* dateTime = [formatter stringFromDate:[NSDate date]];
    return dateTime;
}

- (void)creatLogView{
    
    
    currlogStr = [NSMutableString string];
    [currlogStr setString:[NSString stringWithFormat:@"%@\n",[self getCurrentTime]]];
    
    NSString* vv = [NSString stringWithFormat:@"ios %@\n\n",CurrentSystemVersion];
    [currlogStr appendString:vv];
    
    
    debugView = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    debugView.backgroundColor = [UIColor colorWithRed:0.000 green:0.020 blue:0.059 alpha:0.85];
    debugView.windowLevel = UIWindowLevelStatusBar;
    [debugView makeKeyAndVisible];
    debugView.clipsToBounds = YES;

    rootView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 10, debugView.bounds.size.width-10, debugView.bounds.size.height-10)];
    rootView.backgroundColor = [UIColor clearColor];
    [debugView addSubview:rootView];

    msgLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, rootView.bounds.size.width, 0)];
    msgLb.textColor = [UIColor whiteColor];
    msgLb.font = [UIFont boldSystemFontOfSize:12];
    msgLb.numberOfLines = 0;
    msgLb.lineBreakMode = NSLineBreakByTruncatingTail;
    [rootView addSubview:msgLb];
    
    //
    UIButton* switchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    switchBtn.backgroundColor = [UIColor redColor];
    switchBtn.tag = 100;
    switchBtn.frame = CGRectMake(SCREEN_WIDTH-30, SCREEN_HEIGHT-100, 30, 30);
    [switchBtn addTarget:self action:@selector(actionofShowOrHide:) forControlEvents:UIControlEventTouchUpInside];
    [debugView addSubview:switchBtn];
    
}

- (void)showMSg:(NSString*)msg{
    
    
    [currlogStr appendString:msg];
    
    
    msgLb.text = currlogStr;
    [msgLb sizeToFit];
    
    rootView.contentSize = CGSizeMake(rootView.bounds.size.width, msgLb.bounds.size.height);
    
}

#pragma mark - action Method

- (void)actionofShowOrHide:(UIButton*)sender{
    
    if (sender.tag == 100)
    {
        //隐藏
        sender.tag = 101;
        
        [UIView animateWithDuration:0.35 animations:^{
            //
            debugView.frame = CGRectMake(-SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        } completion:^(BOOL finished) {
            //
            debugView.frame = CGRectMake(0, SCREEN_HEIGHT-100, 30, 30);
            sender.frame = debugView.bounds;
        }];
        
    }
    else if (sender.tag == 101)
    {
        //展示
        sender.tag = 100;
        
        debugView.frame = CGRectMake(-SCREEN_WIDTH+30, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        sender.frame = CGRectMake(SCREEN_WIDTH-30, SCREEN_HEIGHT-100, 30, 30);
        
        [UIView animateWithDuration:0.35 animations:^{
            //
            debugView.frame = [[UIScreen mainScreen] bounds];
        } completion:^(BOOL finished) {
            //

        }];
        
    }
    

}

@end
