//
//  POICustomAlertActionSheet.m
//  POIActionSheet
//
//  Created by yaoning on 15/11/16.
//  Copyright © 2015年 yaoning. All rights reserved.
//

#import "POICustomAlertActionSheet.h"

@implementation POICustomAlertActionSheet

- (instancetype)init{
    if (self = [super init]) {
        [self setupView];
    }
    return self;
}

- (void)setupView{
    UIView *alert = [[UIView alloc]initWithFrame:CGRectMake((POIScreenSizeWidth - 300)/2, POIScreenSizeHeight, 300, 150)];
    alert.backgroundColor = [UIColor whiteColor];
    alert.layer.masksToBounds = YES;
    alert.layer.cornerRadius = 5.0;
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 150)];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.text = @"just alert";
    [alert addSubview:lab];
    [self setupCustomView:alert];
}


@end
