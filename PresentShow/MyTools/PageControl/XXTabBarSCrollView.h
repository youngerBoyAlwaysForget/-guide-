//
//  XXTabBarSCrollView.h
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/14.
//  Copyright © 2016年 z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XXPageAll.h"
@protocol XXTabBarScrollViewDelegate <NSObject>

@optional
- (void)willChanged:(NSInteger)preIndex nextIndex:(NSInteger)nextIndex;
- (void)didChanged:(NSInteger)preIndex nextIndex:(NSInteger)nextIndex;

@end

@interface XXTabBarScrollView : UIScrollView

- (instancetype)initWithTitles:(NSArray<NSString*>*)titles andStyle:(XXTabBarStyle)style;
- (void)moveToIndex:(NSInteger)index;

@property (assign, nonatomic) BOOL forceLeftAligment;
@property (strong, nonatomic) UIColor *titleColorNormal;
@property (strong, nonatomic) UIColor *titleColorSelected;
@property (strong, nonatomic) UIColor *cursorColor;
@property (assign, nonatomic) BOOL isAnimationEnabled;
@property (retain, nonatomic) id<XXTabBarScrollViewDelegate> tabBarScrollViewDelegate;

@end