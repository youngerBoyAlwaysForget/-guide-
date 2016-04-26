//
//  XXSrollVIew.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/15.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXSrollVIew.h"

@interface XXSrollVIew()<UIScrollViewDelegate>
{
    NSInteger leftImageIndex;
    NSInteger centerImageIndex;
    NSInteger rightImageIndex;
    NSInteger pageNum;
}
@property (nonatomic, retain) UIImageView *leftImageView;
@property (nonatomic, retain) UIImageView *centerImageView;
@property (nonatomic, retain)  UIImageView *rightImageView;

@end
@implementation XXSrollVIew
#pragma amrk - 初始化
- (void)initScrollViewAndPageWithImgArray:(NSArray *)imgArray andSRect:(CGRect)scrollViewRect andPRect:(CGRect)pageRect
{
    sourceImgArray = [imgArray mutableCopy];
    
    self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 120);
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width*3, self.scrollView.frame.size.height);
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.frame.size.width, 0)];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    [self addSubview:self.scrollView];
    //给scrollview添加手势
    UITapGestureRecognizer *tapges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAction:)];
    [self.scrollView addGestureRecognizer:tapges];
    
    headImgArrayCount = sourceImgArray.count;
    //加载imgview
    [self addImgViewForScrollView];
    
    self.page = [[UIPageControl alloc] initWithFrame:pageRect];
    self.page.currentPage = 0;
    self.page.numberOfPages = sourceImgArray.count;
    self.page.pageIndicatorTintColor = [UIColor whiteColor];
    self.page.currentPageIndicatorTintColor = [UIColor orangeColor];
    [self addSubview:self.page];  //把page加载到父视图上
    
    //添加计时器
    time = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
}

#pragma mark - 加载imageview的image
- (void)addImgViewForScrollView
{
    //添加imageview到scrollview
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        self.leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        self.centerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(2*self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        
        //设置三个imgview的图片
        leftImageIndex = headImgArrayCount-1;
        centerImageIndex = 0;
        rightImageIndex = 1;
        
        [self.scrollView addSubview:_leftImageView];
        [self.scrollView addSubview:_centerImageView];
        [self.scrollView addSubview:_rightImageView];
    });
    //加载左边的imgview,显示最后一张图片
    self.leftImageView.image = [UIImage imageNamed:sourceImgArray[leftImageIndex]];
    
    //加载右边的imgview,显示第二张图片
    self.rightImageView.image = [UIImage imageNamed:sourceImgArray[rightImageIndex]];
    
    //加载中间我们能看到的imgview,加载第一张图片
    self.centerImageView.image = [UIImage imageNamed:sourceImgArray[centerImageIndex]];
    
    //重新让scrollView便宜在最中间
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.frame.size.width, 0)];
    self.scrollView.userInteractionEnabled = YES;
}

#pragma mark - NSTimer计时器触发事件
- (void)timeAction:(NSTimer *)sender
{
    //刚开始滑动时
    if (self.page.currentPage == headImgArrayCount - 2){  //倒数第二张将要滑到倒数第一张时
        self.page.currentPage = headImgArrayCount-1;
        centerImageIndex = headImgArrayCount - 1;
        rightImageIndex = 0;
        leftImageIndex = centerImageIndex - 1;
    }
    else if (self.page.currentPage == headImgArrayCount -1){   //倒数第一张将要滑到第一张时
        self.page.currentPage = 0;
        centerImageIndex = 0;
        leftImageIndex = headImgArrayCount - 1;
        rightImageIndex = centerImageIndex + 1;
    }
    else{
        self.page.currentPage += 1;
        centerImageIndex = self.page.currentPage;
        leftImageIndex = centerImageIndex - 1;
        rightImageIndex = centerImageIndex + 1;
    }
    //先让scrollView进行偏移
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.frame.size.width*2, 0) animated:YES];
    //开大scrollview的交互
    self.scrollView.userInteractionEnabled = NO;
}

#pragma mark - scrollview轮播代理
//开始拖拽视图
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
{
    //停止计时器
    [time setFireDate:[NSDate distantFuture]];
}

//当手指在scrollview上停止触碰的时候点用该方法
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //手指松开时触发
    if(decelerate){
        self.scrollView.userInteractionEnabled = NO;
    }
}

#pragma mark - 当手动滑动，scrollview停止滚动时
//scrollView完全停止，有触碰事件时
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //计算滑动停止后的偏移量
    CGFloat contentOffset = scrollView.contentOffset.x-scrollView.frame.size.width;
    //计算翻动的＋－
    int offsetPage = contentOffset/scrollView.frame.size.width;
    
    pageNum = self.page.currentPage;
    if(pageNum == 0 && offsetPage == -1){  //判断当在第1张向左滑时
        pageNum = -1;
    }
    if (pageNum == headImgArrayCount-1 && offsetPage == 1){  //判断当在最后一张向右滑时
        pageNum = headImgArrayCount;
    }
    
    //纪录当前scrollview的偏移页数
    self.page.currentPage += offsetPage;
    
    /*
     * 重新计算选取图片的下标
     */
    if (pageNum == -1) {  //如果已经滑到scrollview的最前面即取图片数组的最左边时
        
        self.page.currentPage = headImgArrayCount-1;
        centerImageIndex = headImgArrayCount-1;
        leftImageIndex = centerImageIndex-1;
        rightImageIndex = 0;
        pageNum = headImgArrayCount;
    }
    else if (pageNum == headImgArrayCount) {
        
        self.page.currentPage = 0;
        centerImageIndex = 0;
        leftImageIndex = headImgArrayCount-1;
        rightImageIndex = centerImageIndex+1;
        pageNum = 0;
    }
    else{
        centerImageIndex = self.page.currentPage;
        leftImageIndex = centerImageIndex-1;
        rightImageIndex = centerImageIndex+1;
        if (self.page.currentPage == 0) {
            leftImageIndex = headImgArrayCount-1;
        }
        if (self.page.currentPage == headImgArrayCount-1) {
            rightImageIndex = 0;
        }
    }
    [self addImgViewForScrollView];
    //重新打开交互,重启计时器
    self.scrollView.userInteractionEnabled = YES;
    time = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
}

#pragma mark - 当计时器启动，scrollview滚动结束时
//scrollview完全停止，代码写时
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView;
{
    //让imageView换取图片
    [self addImgViewForScrollView];
}

#pragma mark - 点击scrollView手势动作
- (void)clickAction:(UITapGestureRecognizer *)sender
{
    //    [self.delegate clickImageAction:sourceImgArray[self.page.currentPage]];
    
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"MMMHeadScrollView" object:nil userInfo:@{@"MMMHeadScrollView":@(self.page.currentPage)}];
}
@end
