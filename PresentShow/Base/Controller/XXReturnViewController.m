//
//  XXReturnViewController.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/14.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXReturnViewController.h"

@interface XXReturnViewController ()<UIGestureRecognizerDelegate>

@end

@implementation XXReturnViewController
-(void)dealloc {
    [_webUrl release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *left =[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"iconfont-fanhui"] style:UIBarButtonItemStylePlain target:self action:@selector(reBackLastLevel)];
    self.navigationItem.leftBarButtonItem = left;
    [left release];
    
//     获取系统自带滑动手势的target对象
    id target = self.navigationController.interactivePopGestureRecognizer.delegate;
//     创建全屏滑动手势，调用系统自带滑动手势的target的action方法
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
//     设置手势代理，拦截手势触发
    pan.delegate = self;
//     给导航控制器的view添加全屏滑动手势
    [self.view addGestureRecognizer:pan];
//     禁止使用系统自带的滑动手势
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    // Do any additional setup after loading the view.
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    // 注意：只有非根控制器才有滑动返回功能，根控制器没有。
    // 判断导航控制器是否只有一个子控制器，如果只有一个子控制器，肯定是根控制器
    if (self.childViewControllers.count == 1) {
        // 表示用户在根控制器界面，就不需要触发滑动手势，
        return NO;
    }
    return YES;
}

- (void)handleNavigationTransition:(UISwipeGestureRecognizer *)sender {
//    [sender setDirection:UISwipeGestureRecognizerDirectionLeft];
//    [[self view] addGestureRecognizer:sender];
//    [sender addTarget:self action:@selector(<#selector#>)];
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)reBackLastLevel {
    [self.navigationController popToRootViewControllerAnimated:YES];
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
