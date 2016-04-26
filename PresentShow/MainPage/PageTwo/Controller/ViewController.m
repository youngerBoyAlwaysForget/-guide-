//
//  ViewController.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/7.
//  Copyright © 2016年 zxx. All rights reserved.
//

#import "ViewController.h"

#import <WebKit/WebKit.h>
@interface ViewController ()<WKUIDelegate, WKNavigationDelegate>
@property (nonatomic, retain) WKWebView *wenb;
@end

@implementation ViewController
-(void)dealloc {
    [_wenb release];
    [_hotModel release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBarController.tabBar.hidden = YES;
    
    [XXAFNetTool GETWithURL:@"http://api.liwushuo.com/v2/channels/preset?gender=1&generation=1" Body:nil HeaderFile:nil Response:responseJSON success:^(id result) {
        NSLog(@"ViewController%@",result[@"code"]);
        //414 * self.view.bounds.size.width
    } failure:^(NSError *error) {}];
    self.title = _hotModel.name;
    self.wenb = [WKWebView new];
    _wenb.frame = CGRectMake(0, 0, WIDTH, HEIGHT);//CGRectMake(0, -0.0815 * self.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height *1.236);
    NSLog(@"%@", _hotModel.url);
    self.wenb.navigationDelegate = self;
    NSURL *url = [NSURL URLWithString: _hotModel.url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_wenb loadRequest:request];
    _wenb.scrollView.showsVerticalScrollIndicator = NO;
    _wenb.scrollView.bounces = NO;
    [self.view addSubview:_wenb];
    [_wenb release];
    
    
//    UIBarButtonItem *message = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"message"] style:UIBarButtonItemStyleDone target:self action:nil];
//    self.navigationItem.leftBarButtonItem = message;
//    
//    [message release];
    // Do any additional setup after loading the view, typically from a nib.
}
//- (void)wxShare {
//    [WXApiRequestHandler sendLinkURL:_hotModel.url TagName:_hotModel.name Title:@"title" Description:@"zxx" ThumbImage:[UIImage imageNamed:@"11"] InScene:WXSceneSession];
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
#if 0
    [XXAFNetTool POSTWithURL:@"http://api.izhangchu.com/?appVersion=4.3.2&sysVersion=9.2.1&devModel=iPhone" Body:@"methodName=SceneHome&token=0&user_id=0&version=4.32" BodyStyle:requestBodyJSON HeaderFile:nil Response:responseJSON success:^(id result) {
        
    } failure:^(NSError *error) {
        
    }];
#endif
    // Dispose of any resources that can be recreated.
}
-(WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures {
    //    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('wrapper download-banner')[0].style.display = 'NONE'"];
//    [webView evaluateJavaScript:@"document.documentElement.getElementsByClassName('header-left')[0].style.display = 'none'" completionHandler:nil];
//    [webView evaluateJavaScript:@"document.documentElement.getElementsByClassName('wrapper download-banner')[1].style.display = 'none'" completionHandler:nil];
//   [webView evaluateJavaScript:@"document.getElementsByClassName('header-sm')[0].style.display = 'NONE'" completionHandler: nil];
    
    return webView;
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [webView evaluateJavaScript:@"document.getElementsByClassName('wrapper download-banner')[0].style.display = 'none'" completionHandler:nil];
    [webView evaluateJavaScript:@"document.getElementsByClassName('wrapper download-banner')[1].style.display = 'none'" completionHandler:nil];
}
-(void)viewDidAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden = NO;
}
@end
