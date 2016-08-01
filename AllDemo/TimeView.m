//
//  TimeView.m
//  TimeShow
//
//  Created by  tsou117 on 15-1-9.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#import "TimeView.h"

@implementation TimeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)updateTimeLabel{
    NSDate* now = [NSDate date];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm:ss"];
    
    NSString* currTime = [formatter stringFromDate:now];
    
    self.currTimeLb.text = currTime;
    
    NSArray* subCArr = [currTime componentsSeparatedByString:@":"];
    NSString* c1 = subCArr[0];
    NSString* c2 = subCArr[1];
    NSString* c3 = subCArr[2];
    
    uint16_t cc1 = [c1 intValue];
    uint16_t cc2 = [c2 intValue];
    uint16_t cc3 = [c3 intValue];
    
    c1 = [self ToHex:cc1];
    c2 = [self ToHex:cc2];
    c3 = [self ToHex:cc3];
    
    self.backgroundColor = [self colorWithHexString:[NSString stringWithFormat:@"#%@%@%@",c1,c2,c3]];
    
    self.ColorLb.text = [NSString stringWithFormat:@"#%@%@%@",c1,c2,c3];


}

//将十进制转化为十六进制
- (NSString *)ToHex:(uint16_t)tmpid
{
    NSString *nLetterValue;
    NSString *str =@"";
    uint16_t ttmpig;
    for (int i = 0; i<9; i++) {
        ttmpig=tmpid%16;
        tmpid=tmpid/16;
    
        switch (ttmpig)
        {
            case 10:
                nLetterValue =@"A";break;
            case 11:
                nLetterValue =@"B";break;
            case 12:
                nLetterValue =@"C";break;
            case 13:
                nLetterValue =@"D";break;
            case 14:
                nLetterValue =@"E";break;
            case 15:
                nLetterValue =@"F";break;
            default:
                nLetterValue = [NSString stringWithFormat:@"%u",ttmpig];
                
        }

        str = [nLetterValue stringByAppendingString:str];
        if (tmpid == 0) {
            break;
        }
        
    }

    if ([str isEqualToString:@"A"]||
        [str isEqualToString:@"B"]||
        [str isEqualToString:@"C"]||
        [str isEqualToString:@"D"]||
        [str isEqualToString:@"E"]||
        [str isEqualToString:@"F"]||
        [str isEqualToString:@"0"]||
        [str isEqualToString:@"1"]||
        [str isEqualToString:@"2"]||
        [str isEqualToString:@"3"]||
        [str isEqualToString:@"4"]||
        [str isEqualToString:@"5"]||
        [str isEqualToString:@"6"]||
        [str isEqualToString:@"7"]||
        [str isEqualToString:@"8"]||
        [str isEqualToString:@"9"]
        ){
        //
        str = [NSString stringWithFormat:@"0%@",str];
    }
    
    return str;
}

//根据时间改变背景16进制颜色

- (UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

@end
