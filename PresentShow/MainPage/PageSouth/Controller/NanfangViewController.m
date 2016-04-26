//
//  NanfangViewController.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/19.
//  Copyright © 2016年 z. All rights reserved.
//

#import "NanfangViewController.h"

@interface NanfangViewController ()<UIWebViewDelegate>

@end

@implementation NanfangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self create];
    // Do any additional setup after loading the view.
}
- (void)create {
    CGFloat width = self.view.bounds.size.width * 1;
    CGFloat height = self.view.bounds.size.height * 1;
    
    UIWebView *web = [UIWebView new];
    web.frame = CGRectMake(0, -height * 0.125, width, height * 1.05);
    NSURL *url = [NSURL URLWithString:_nanFangWebUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [web loadRequest:request];
    web.delegate = self;
    web.scrollView.bounces = NO;
    [self.view addSubview:web];
    
    UIToolbar *toobar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, height * 0.93, width, height * 0.07)];
    [self.view addSubview:toobar];
    UIBarButtonItem *bar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(cacacaca:)];
    
    toobar.items = @[bar];
    
    //    [toobar setItems:@[sen, story] animated:YES];
    // Do any additional setup after loading the view.
}
- (void)cacacaca:(UIBarButtonItem *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}





-(void)viewDidAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)webViewDidStartLoad:(UIWebView *)webView {
    [MBProgressHUD showMessage:@""];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUD];
        
    });
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
//    [MBProgressHUD showError:@"网络错误"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUD];
        
    });
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
