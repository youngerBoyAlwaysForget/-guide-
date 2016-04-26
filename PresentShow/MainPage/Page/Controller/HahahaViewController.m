//
//  hahahaViewController.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/15.
//  Copyright © 2016年 z. All rights reserved.
//

#import "HahahaViewController.h"
#import "XXbutton.h"
#import "DataBaseTools.h"
//#import "UMSocial.h"
#import <WebKit/WebKit.h>
@interface HahahaViewController ()<WKUIDelegate>
@property (nonatomic, retain) WKWebView *webView;

@property (nonatomic, retain) UIBarButtonItem *restoreButton;

@property (nonatomic, retain) DataBaseTools *database;
@end

@implementation HahahaViewController
-(void)dealloc {
    [_url release];
    [_titleme release];
    [_webView release];
    [_database release];
    [_restoreButton release];
    [super dealloc];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self createWebView];
    UIBarButtonItem *share = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(shareWithOthers)];
    self.restoreButton  = [[UIBarButtonItem alloc] initWithTitle:@"收藏" style:UIBarButtonItemStyleDone target:self action:@selector(addDataToDatabase)];

    self.navigationItem.rightBarButtonItems = @[self.restoreButton, share];
    
    [share release];
    [_restoreButton release];

    UIBarButtonItem *left =[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"iconfont-fanhui"] style:UIBarButtonItemStylePlain target:self action:@selector(reBackLastLevel)];
    self.navigationItem.leftBarButtonItem = left;
    [left release];

    // Do any additional setup after loading the view.
}
- (void)shareWithOthers {
//    [UMSocialSnsService presentSnsIconSheetView:self appKey:@"56f6616fe0f55a9cd3000aef" shareText:[NSString stringWithFormat:@"%@. 来自<<GiFi>> %@", _titleme, _url] shareImage:nil shareToSnsNames:[NSArray arrayWithObjects:UMShareToWechatTimeline,UMShareToWechatSession, UMShareToWechatFavorite,UMShareToSms, UMShareToDouban, nil] delegate:nil];
}
- (void)createWebView {
    self.view.backgroundColor = [UIColor purpleColor];
    CGFloat width = self.view.bounds.size.width * 1;
    CGFloat height = self.view.bounds.size.height * 1;
    self.webView = [WKWebView new];
    _webView.scrollView.showsHorizontalScrollIndicator = NO;
    self.webView.UIDelegate = self;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_url]];
    [_webView loadRequest:request];
    _webView.frame = CGRectMake(0, 0, width, height);
    _webView.scrollView.bounces = NO;
    [self.view addSubview:_webView];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)addDataToDatabase {
    self.database = [DataBaseTools databaseManager];
    [self.database openDataBase];
    [self.database createTable];
    NSLog(@"收藏点击事件触发, 正在存储数据 %@", self.titleme);
    BOOL xxx = [self.database insertDataBase:self.titleme withAge:self.url];
    [self.database closeDataBase];
    if (xxx) {
        [self.navigationController presentViewController:[NoWifiAlertController createAlertWhenCollectFinished] animated:YES completion:^{}];
    }
    

}
-(WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures {
//    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('wrapper download-banner')[0].style.display = 'NONE'"];
    [webView evaluateJavaScript:@"document.getElementsByClassName('wrapper download-banner')[0].style.display = 'NONE'" completionHandler: nil];
    return self.webView;
}
- (void)webViewDidClose:(WKWebView *)webView {
//    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('main_mu_bar')[0].style.display = 'NONE'"];

}



- (void)reBackLastLevel {
    [self.navigationController popViewControllerAnimated:YES];
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
