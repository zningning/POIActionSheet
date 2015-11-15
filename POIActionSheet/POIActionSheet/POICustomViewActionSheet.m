//
//  POICustomViewActionSheet.m
//  POIActionSheet
//
//  Created by yaoning on 15/11/15.
//  Copyright © 2015年 yaoning. All rights reserved.
//

#import "POICustomViewActionSheet.h"

@implementation POICustomViewActionSheet

- (instancetype)init{
    if (self = [super init]) {
        [self setCustomView];
    }
    return self;
}

- (void)setCustomView{
    UIView *newView = [[UIView alloc]initWithFrame:CGRectMake(0, POIScreenSizeHeight, POIScreenSizeWidth, 200)];
    newView.backgroundColor = [UIColor colorWithRed:118/255.0 green:118/255.0 blue:118/255.0 alpha:1];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, newView.frame.size.width, newView.frame.size.height)];
    label.numberOfLines = 0;
    label.text = @"这是自定义view 中的一个label , 实现自定义view  你只需要 1.继承POIBaseActionSheet 2.在init方法中 初始化自己的view 3.在初始化中调用 setupCustomView 方法 将自定义view 指定给父类";
    [newView addSubview:label];
    
    [self setupCustomView:newView];
}

@end
