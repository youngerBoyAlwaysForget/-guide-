//
//  FirstViewController.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/22.
//  Copyright © 2016年 z. All rights reserved.
//

#import "FirstViewController.h"
#import "BeautyViewController.h"
#define MAXScreen [UIScreen mainScreen].bounds

@interface FirstViewController ()<UIScrollViewDelegate>
@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UIPageControl *page;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.scrollView = [[UIScrollView alloc] initWithFrame:MAXScreen];
    _scrollView.contentSize = CGSizeMake(WIDTH * 4, HEIGHT);
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_scrollView];
    
    for (int i = 1; i < 5; i++) {
        UIImageView *imageme = [[UIImageView alloc] initWithFrame:CGRectMake(_scrollView.bounds.size.width * (i - 1), 0, _scrollView.bounds.size.width, _scrollView.bounds.size.height)];
        imageme.contentMode = UIViewContentModeScaleAspectFill;
        
        NSString *string = [NSString stringWithFormat:@"Fotor%d%d%d%d", i, i, i, i];
        
        imageme.image = [UIImage imageNamed:string];
    

        [_scrollView addSubview:imageme];
        [imageme release];
        if (i == 4) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(WIDTH / 2 - 100, HEIGHT * 0.8, WIDTH / 2, HEIGHT * 0.06);
            button.layer.cornerRadius = 10;
            button.layer.borderWidth = 1;
            
            [button setTitle:@"欢迎体验" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            [button addTarget:self action:@selector(closeTheVC) forControlEvents:UIControlEventTouchUpInside];
            imageme.userInteractionEnabled = YES;
            [imageme addSubview:button];
  
        }
    }
    [_scrollView release];
    
    
    self.page = [[UIPageControl alloc] initWithFrame:CGRectMake(0, HEIGHT * 0.95, WIDTH, 20)];
    
    _page.numberOfPages = 4;
    _page.backgroundColor = [UIColor clearColor];
    _page.currentPage = 0;
    [self.view addSubview:_page];
    [_page release];
    
    
//    [_page addTarget:self action:@selector(pageAct:) forControlEvents:UIControlEventValueChanged];
    // Do any additional setup after loading the view.
}

- (void)pageAct:(UIPageControl *)page {
//    [_scrollView setContentOffset:CGPointMake(page.currentPage * WIDTH, 0) animated:YES];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    _page.currentPage = _scrollView.contentOffset.x / _scrollView.bounds.size.width;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)closeTheVC {
    [self.delegetee sendhahahhaahha:YES];
    NSLog(@"点击事件");
//    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
//    [center postNotificationName:@"firstLoad" object:nil userInfo:nil];
    

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
