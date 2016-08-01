//
//  LSDebugTools.h
//  MyDemo
//
//  Created by  tsou117 on 15/5/26.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/message.h>

#define LSDEBUGTOOLS [LSDebugTools shareDebugTools]

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion ([[UIDevice currentDevice] systemVersion])
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

//use dlog to print while in debug model
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

#define LSLog(fmt) [LSDEBUGTOOLS showMSg:[NSString stringWithFormat:@"%s %@\n\n",__PRETTY_FUNCTION__,fmt]]

//#define LSLog(fmt,...) [LSDEBUGTOOLS showMSg:[NSString stringWithFormat:@"%s %@\n\n",__PRETTY_FUNCTION__,fmt]]


#if TARGET_OS_IPHONE
//iPhone Device


#endif

#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator


#endif


/*
    1,先判断设备 是模拟器 还是真机 
    if simulator ... 没有效果
    if 真机 显示 设备拥有者名称 设备类别 本地化版本当前运行系统和版本
 
 */

@interface LSDebugTools : NSObject

+ (LSDebugTools*)shareDebugTools;

- (void)creatLogView;

- (void)showMSg:(NSString*)msg;

@end
