//
//  XXTabBar.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/14.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXTabBar.h"

@interface XXTabBar ()

@property (retain, nonatomic) XXTabBarScrollView *tabBarScrollView;
@property (assign, nonatomic) XXTabBarStyle tabBarStyle;
@property (retain, nonatomic) NSArray<NSString*> *titles;

@end

@implementation XXTabBar

- (instancetype)initWithTitles:(NSArray<NSString*>*)titles andStyle:(XXTabBarStyle)style {
    if (self = [super init]) {
        _tabBarStyle = style;
        _titles = titles;
        [self setup];
    }
    return self;
}

- (void)setup {
    self.backgroundColor = [UIColor whiteColor];
    self.tabBarScrollView = [[XXTabBarScrollView alloc] initWithTitles:self.titles andStyle:self.tabBarStyle];
    [self addSubview:self.tabBarScrollView];
}

- (void)moveToIndex:(NSInteger)index {
    [self.tabBarScrollView moveToIndex:index];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat left = 0;
    if (self.leftItemView) {
        self.leftItemView.frame = CGRectMake(left, 0, self.leftItemView.bounds.size.width, self.bounds.size.height);
        left += self.leftItemView.bounds.size.width;
    }
    if (self.rightItemView) {
        self.rightItemView.frame = CGRectMake(self.bounds.size.width - self.rightItemView.bounds.size.width, 0, self.rightItemView.bounds.size.width, self.bounds.size.height);
        self.tabBarScrollView.frame = CGRectMake(left, 0, self.bounds.size.width - self.rightItemView.bounds.size.width - left, self.bounds.size.height);
    } else {
        self.tabBarScrollView.frame = CGRectMake(left, 0, self.bounds.size.width - left, self.bounds.size.height);
    }
}

- (void)setLeftItemView:(UIView *)leftItemView {
    if (_leftItemView) {
        [_leftItemView removeFromSuperview];
    }
    _leftItemView = leftItemView;
    [self addSubview:_leftItemView];
}

- (void)setRightItemView:(UIView *)rightItemView {
    if (_rightItemView) {
        _rightItemView.dk_backgroundColorPicker = DKColorWithColors([UIColor darkGrayColor], [UIColor whiteColor]);
        [_rightItemView removeFromSuperview];
    }
    _rightItemView = rightItemView;
    [self addSubview:_rightItemView];
}

- (void)setTitleColorNormal:(UIColor *)titleColorNormal {
    self.tabBarScrollView.titleColorNormal = titleColorNormal;
}

- (void)setTitleColorSelected:(UIColor *)titleColorSelected {
    self.tabBarScrollView.titleColorSelected = titleColorSelected;
}

- (void)setCursorColor:(UIColor *)cursorColor {
    self.tabBarScrollView.dk_backgroundColorPicker = DKColorWithColors([UIColor darkGrayColor], [UIColor whiteColor]);
    self.tabBarScrollView.cursorColor = cursorColor;
}

- (void)setTabBarDelegate:(id<XXTabBarScrollViewDelegate>)tabBarDelegate {
    self.tabBarScrollView.tabBarScrollViewDelegate = tabBarDelegate;
}

- (id<XXTabBarScrollViewDelegate>)tabBarDelegate {
    return self.tabBarScrollView.tabBarScrollViewDelegate;
}

- (void)setForceLeftAligment:(BOOL)forceLeftAligment {
    self.tabBarScrollView.forceLeftAligment = forceLeftAligment;
}

- (BOOL)forceLeftAligment {
    return self.tabBarScrollView.forceLeftAligment;
}

@end
