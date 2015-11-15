//
//  POIActionSheetBaseView.m
//  wolaiSocial
//
//  Created by yaoning on 15/9/6.
//  Copyright (c) 2015年 POI. All rights reserved.
//

#import "POIBaseActionSheet.h"

@interface POIBaseActionSheet()

@property (nonatomic, strong) UIView *customView;
@property (nonatomic, strong) UIView *shadowView;
@property (nonatomic, strong) UIWindow *containerWindown;
@property (nonatomic, strong) UITapGestureRecognizer *dismissTap;

@end

@implementation POIBaseActionSheet

- (instancetype)init{
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup{
    _isShow = NO;
    _shadownCanDismiss = YES;
    self.frame = [UIScreen mainScreen].bounds;
    UIView *shadowView = [[UIView alloc] initWithFrame:self.frame];
    [shadowView setAlpha:0];
    [shadowView setUserInteractionEnabled:NO];
    [shadowView setFrame:self.frame];
    [shadowView setBackgroundColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1]];
    [self addSubview:shadowView];
    self.shadowView = shadowView;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    [shadowView addGestureRecognizer:tap];
    self.dismissTap = tap;
}

- (void)setupCustomView:(UIView *)view{
    self.customView = view;
    
    [self addSubview:self.customView];
    [self.containerWindown addSubview:self];
}

- (void)show{
    self.containerWindown.hidden = NO;
    [UIView animateWithDuration:0.3f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.shadowView.alpha = 0.3;
                         self.shadowView.userInteractionEnabled = YES;
                         CGRect frame = self.customView.frame;
                         frame.origin.y -= frame.size.height;
                         self.customView.frame = frame;
                     } completion:^(BOOL finished) {
                         self.isShow = YES;
                     }];
    
}

- (void)dismiss{
    [UIView animateWithDuration:0.3f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.shadowView.alpha = 0;
                         self.shadowView.userInteractionEnabled = NO;
                         self.customView.alpha = 0;
                         CGRect frame = self.customView.frame;
                         frame.origin.y += frame.size.height;
                         self.customView.frame = frame;
                     } completion:^(BOOL finished) {
                         self.isShow = NO;
                         [self removeFromSuperview];
                         self.containerWindown.hidden = YES;
                     }];
    
}

#pragma mark Geter & Seter

- (void)setShadownCanDismiss:(BOOL)shadownCanDismiss{
    _shadownCanDismiss = shadownCanDismiss;
    if (!shadownCanDismiss) {
        [self.shadowView removeGestureRecognizer:self.dismissTap];
    }
}

- (UIWindow *)containerWindown{
    if (_containerWindown == nil) {
        _containerWindown = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _containerWindown.backgroundColor = [UIColor clearColor];
        _containerWindown.windowLevel = UIWindowLevelAlert;
        _containerWindown.hidden = NO;
    }
    return _containerWindown;
}

- (void)dealloc{
    _containerWindown = nil;
}

@end
