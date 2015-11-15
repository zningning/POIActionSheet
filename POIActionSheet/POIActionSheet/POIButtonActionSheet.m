//
//  POIActionSheet.m
//  wolaiSocial
//
//  Created by yaoning on 15/7/16.
//  Copyright (c) 2015年 POI. All rights reserved.
//

#import "POIButtonActionSheet.h"

@interface POIButtonActionSheet()

@property (nonatomic, strong) UIView *shadowView;
@property (nonatomic, strong) UIView *buttonContainer;
@property (nonatomic, strong) NSArray *otherButtonTitles;
@property (nonatomic, strong) NSString *cancleButtonTitle;
@property (nonatomic, copy) clickBlock block;

@end

@implementation POIButtonActionSheet

- (id)initWithDelegate:(id<POIButtonActionSheetDelegate>)delegate cancleButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitlesArray{
    if (self = [super init]) {
        _delegate = delegate;
        _cancleButtonTitle = cancelButtonTitle;
        _otherButtonTitles = otherButtonTitlesArray;
        [self setupViews];
    }
    return self;
}

- (id)initWithCancleButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitlesArray complete:(clickBlock)block{
    if (self = [super init]) {
        _cancleButtonTitle = cancelButtonTitle;
        _otherButtonTitles = otherButtonTitlesArray;
        _block = block;
        [self setupViews];
    }
    return self;
}

- (void)setupViews{
    NSInteger buttonContainerHeight = 55 + 49 * self.otherButtonTitles.count;
    UIView *buttonContainer = [[UIView alloc]initWithFrame:CGRectMake(0, POIScreenSizeHeight, POIScreenSizeWidth, buttonContainerHeight)];
    buttonContainer.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1];
    [self addSubview:buttonContainer];
    self.buttonContainer = buttonContainer;
    
    UIButton *cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancleBtn.frame = CGRectMake(0, self.otherButtonTitles.count * 49 + 6, self.frame.size.width, 49);
    cancleBtn.backgroundColor = [UIColor whiteColor];
    [cancleBtn setTitle:self.cancleButtonTitle forState:UIControlStateNormal];
    [cancleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancleBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonContainer addSubview:cancleBtn];
    
    for (int i = 0; i < self.otherButtonTitles.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0 + i * 48, self.frame.size.width, 48);
        btn.backgroundColor = [UIColor whiteColor];
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitle:self.otherButtonTitles[i] forState:UIControlStateNormal];
        btn.tag = i;
        
        UIView *grayLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0, btn.frame.size.width, 1)];
        grayLine.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1];
        [btn addSubview:grayLine];
        [self.buttonContainer addSubview:btn];
    }
    [self setupCustomView:self.buttonContainer];
}

- (void)clickBtn:(UIButton *)btn{
    [self dismiss];
    if ([self.delegate respondsToSelector:@selector(POIButtonActionSheet:clickedButtonAtIndex:)]) {
        [self.delegate POIButtonActionSheet:self clickedButtonAtIndex:btn.tag];
    }else{
        _block(btn.tag);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
