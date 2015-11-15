//
//  POICustomActionSheetViewController.m
//  POIActionSheet
//
//  Created by yaoning on 15/11/15.
//  Copyright © 2015年 yaoning. All rights reserved.
//

#import "POICustomViewActionSheet.h"
#import "POICustomActionSheetViewController.h"

@implementation POICustomActionSheetViewController

- (IBAction)clickShow:(UIButton *)sender {
    POICustomViewActionSheet *custom = [[POICustomViewActionSheet alloc]init];
    [custom show];
}

@end
