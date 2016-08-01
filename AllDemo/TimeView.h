//
//  TimeView.h
//  TimeShow
//
//  Created by  tsou117 on 15-1-9.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeView : UIView
@property (strong, nonatomic) IBOutlet UILabel *currTimeLb;
@property (strong, nonatomic) IBOutlet UILabel *ColorLb;

- (void)updateTimeLabel;

@end
