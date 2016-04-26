//
//  XXSrollVIew.h
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/15.
//  Copyright © 2016年 z. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XXSrollVIew : UIView
{
    NSArray *sourceImgArray;
    NSUInteger headImgArrayCount;
    NSTimer *time;
    
}

@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UIPageControl *page;

- (void)initScrollViewAndPageWithImgArray:(NSArray *)imgArray andSRect:(CGRect)scrollViewRect andPRect:(CGRect)pageRect;
@end
