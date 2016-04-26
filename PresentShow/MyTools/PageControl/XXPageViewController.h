//
//  PageViewController.h
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/14.
//  Copyright © 2016年 z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XXPageAll.h"


@protocol XXPageViewControllerDataSource <NSObject>

//the number of pages
- (NSInteger)numberOfPages;

//the title for the page
- (NSString*)titleOfPage:(NSInteger)page;

//the controller for the page
- (UIViewController*)constrollerOfPage:(NSInteger)page;

@end

@interface XXPageViewController : UIViewController

//init with tabBar style
//if you use init, initWithCoder, initWithNibName the default style is XTTabBarStyleCursorUnderline
- (instancetype)initWithTabBarStyle:(XXTabBarStyle)style;

//the data source of XTPageViewController
@property (retain, nonatomic) id<XXPageViewControllerDataSource> dataSource;

//customize the left item view of XTPageViewController, defaul will be nil
@property (retain, nonatomic) UIView *tabBarLeftItemView;

//customize the right item view of XTPageViewController, defaul will be nil
@property (retain, nonatomic) UIView *tabBarRightItemView;

//customize the tabBar title color
@property (retain, nonatomic) UIColor *tabBarTitleColorNormal;

//customize the tabBar title color when selected
@property (retain, nonatomic) UIColor *tabBarTitleColorSelected;

//customize the tabBar cursor color
@property (retain, nonatomic) UIColor *tabBarCursorColor;

//customize the tabBar height
@property (assign, nonatomic) CGFloat tabBarHeight;

//customize the tabBar background color
@property (retain, nonatomic) UIColor *tabBarBackgroundColor;

//use this property to force the tabBar items aligment left
@property (assign, nonatomic) BOOL forceLeftAligment;

@end
