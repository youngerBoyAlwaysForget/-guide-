//
//  XXTabBar.h
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/14.
//  Copyright © 2016年 z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XXPageAll.h"
#import "XXTabBarSCrollView.h"
#import "DKNightVersion.h"
@interface XXTabBar : UIView
- (instancetype)initWithTitles:(NSArray<NSString*>*)titles andStyle:(XXTabBarStyle)style;
- (void)moveToIndex:(NSInteger)index;

@property (strong, nonatomic) UIView *leftItemView;
@property (strong, nonatomic) UIView *rightItemView;

@property (strong, nonatomic) UIColor *titleColorNormal;
@property (strong, nonatomic) UIColor *titleColorSelected;
@property (strong, nonatomic) UIColor *cursorColor;
@property (assign, nonatomic) BOOL forceLeftAligment;
@property (retain, nonatomic) id<XXTabBarScrollViewDelegate> tabBarDelegate;


@end
