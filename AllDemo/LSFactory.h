//
//  LSFactory.h
//  MyDemo
//
//  Created by  tsou117 on 15-4-23.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LSFactory : NSObject

//计算字符串size
+ (CGSize)getStringSizeWith:(NSString*)_mystr boundingRectWithSize:(CGSize)_boundSize font:(UIFont*)font;

//压缩图片
+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;

+(void)setSameUIController:(int )UIName
        UIControllerNumber:(int )UICount
             WidthGapFirst:(float )wGapfirst
              HighGapFirst:(float )hGapfirst
               WidthGapNor:(float )wGapNor
                HighGapNor:(float )hGapNor
               ButtonWidth:(float )btnWidth
                ButtonHigh:(float )btnHigh
                      Sign:(int )sign
        AddForMutableArray:(NSMutableArray *)mutableArray
                AddForView:(UIView *)view
              CustomUISign:(NSString *)UIsign;

+ (UIColor *)randomColor;

@end
