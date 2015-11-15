//
//  POIActionSheet.h
//  wolaiSocial
//
//  Created by yaoning on 15/7/16.
//  Copyright (c) 2015年 POI. All rights reserved.
//

#import "POIBaseActionSheet.h"

@class POIButtonActionSheet;
@protocol POIButtonActionSheetDelegate <NSObject>

@optional
- (void)POIButtonActionSheet:(POIButtonActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;

@end

@interface POIButtonActionSheet : POIBaseActionSheet

typedef void (^clickBlock)(NSInteger index);

@property (nonatomic, assign) id <POIButtonActionSheetDelegate> delegate;

/**
 *  初始化方法
 *
 *  @param delegate               delegate
 *  @param cancelButtonTitle      取消按钮
 *  @param otherButtonTitlesArray 其他按钮数组
 *
 *  @return 实例对象
 */

- (id)initWithDelegate:(id<POIButtonActionSheetDelegate>)delegate cancleButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitlesArray;

/**

 */
/**
 *  初始化方法
 *
 *  @param cancelButtonTitle      取消按钮
 *  @param otherButtonTitlesArray 其他按钮数组
 *  @param block                  处理block
 *
 *  @return 实例对象
 */
- (id)initWithCancleButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitlesArray complete:(clickBlock)block;


@end
