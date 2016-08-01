//
//  LSFactory.m
//  MyDemo
//
//  Created by  tsou117 on 15-4-23.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#import "LSFactory.h"

@implementation LSFactory

//计算字符串size
+ (CGSize)getStringSizeWith:(NSString*)_mystr boundingRectWithSize:(CGSize)_boundSize font:(UIFont*)font{
    
    if ([_mystr isEqual: [NSNull null]] || _mystr == nil || [_mystr isEqualToString: @""] || [_mystr isEqualToString: @"<null>"])
    {
        return CGSizeMake(_boundSize.width, 20);
    }
    
    NSDictionary *attribute = @{NSFontAttributeName: font};
    CGSize size = [_mystr  boundingRectWithSize:_boundSize options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    
//    NSDictionary *attribute1 = @{NSFontAttributeName: [UIFont systemFontOfSize:18]};
//    
//    CGSize size1 = [_mystr boundingRectWithSize:_boundSize options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    return size;
}

+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0,0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    //返回新的改变大小后的图片
    return scaledImage;
}

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
              CustomUISign:(NSString *)UIsign{
    
    int j = 0,k = 0;
    if (0 < UICount)
    {
        //
        for (int i = 0; i<UICount; i++) {
            //
            if (j > sign) {
                k++;
                j = 0;
            }
            
            //加载对应控件
            if (UIName == 0)
            {
                UIButton *UIBtnTemp = [UIButton buttonWithType:UIButtonTypeCustom];
                UIBtnTemp.frame = CGRectMake( wGapfirst + ( btnWidth + wGapNor ) * j,
                                             hGapfirst + ( btnHigh + hGapNor ) * k,
                                             btnWidth,
                                             btnHigh);
                [self addForArray:mutableArray ForView:view FromUIController:UIBtnTemp];
                //...do Button Custom
            }
            
            j++;
        }
    }
}

+(void)addForArray:(NSMutableArray *)mutableArray ForView:(UIView *)view FromUIController:(id)UIsender
{
    if (mutableArray != nil)
    {
        [mutableArray addObject:UIsender];
    }
    else
    {
        NSLog(@"No such Array to added...");
    }
    
    if (view != nil)
    {
        [view addSubview:UIsender];
    }
    else
    {
        NSLog(@"No such View to added...");
    }
}

+ (UIColor *)randomColor {
    static BOOL seeded = NO;
    if (!seeded) {
        seeded = YES;
        (time(NULL));
    }
    CGFloat red = (CGFloat)random() / (CGFloat)RAND_MAX;
    CGFloat green = (CGFloat)random() / (CGFloat)RAND_MAX;
    CGFloat blue = (CGFloat)random() / (CGFloat)RAND_MAX;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}

@end
