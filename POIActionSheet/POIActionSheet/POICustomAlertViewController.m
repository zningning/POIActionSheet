//
//  POICustomAlertViewController.m
//  POIActionSheet
//
//  Created by yaoning on 15/11/16.
//  Copyright © 2015年 yaoning. All rights reserved.
//

#import "POICustomAlertActionSheet.h"
#import "POICustomAlertViewController.h"

@implementation POICustomAlertViewController

- (IBAction)clickShow:(UIButton *)sender {
    POICustomAlertActionSheet *sheet = [[POICustomAlertActionSheet alloc]init];
    [sheet showWithPoint:CGPointMake((POIScreenSizeWidth - 300)/2, -(POIScreenSizeHeight - 150)/2)];
}

@end
