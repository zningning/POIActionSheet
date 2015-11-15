//
//  POIActionSheetBaseView.h
//  wolaiSocial
//
//  Created by yaoning on 15/9/6.
//  Copyright (c) 2015年 POI. All rights reserved.
//

//屏幕尺寸获取
#define POIScreenSizeWidth [UIScreen mainScreen].bounds.size.width
#define POIScreenSizeHeight [UIScreen mainScreen].bounds.size.height

#import <UIKit/UIKit.h>

@interface POIBaseActionSheet : UIView

// 遮罩颜色 & 遮罩透明度
@property (nonatomic, strong) UIColor *shadownColor;
@property (nonatomic, assign) CGFloat shadownAlpha;

/**
 *  点击遮罩可以隐藏吗？
 *  default YES
 */
@property (nonatomic, assign) BOOL shadownCanDismiss;

/*
 * 是否是显示的
*/
@property (nonatomic, assign) BOOL isShow;

/**
 *  设置自定义的视图
 *
 *  @param view
 */
- (void)setupCustomView:(UIView *)view;

- (void)show;
- (void)dismiss;

@end
