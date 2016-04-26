//
//  DeailThreeViewController.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/13.
//  Copyright © 2016年 z. All rights reserved.
//

#import "DeailThreeViewController.h"
#import <WebKit/WebKit.h>
@interface DeailThreeViewController ()

@end

@implementation DeailThreeViewController

- (void)viewDidLoad {
  [super viewDidLoad];
    
  self.view.backgroundColor = [UIColor yellowColor];
  CGFloat width = self.view.bounds.size.width;
  CGFloat height = self.view.bounds.size.height;
  UIToolbar *toolbar = [[UIToolbar alloc]
      initWithFrame:CGRectMake(0, height - 93, width, height)];
  toolbar.backgroundColor = [UIColor yellowColor];

    WKWebView *web = [WKWebView new];
                    
    web.frame = CGRectMake(0, -width * 0.14, width, height * 1.2);
  NSURL *url = [NSURL URLWithString:_URL];
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  [web loadRequest:request];
  web.scrollView.bounces = NO;
    web.scrollView.showsHorizontalScrollIndicator = NO;
  [self.view addSubview:web];
  //    [self.view addSubview:toolbar];
  [web release];
  // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little
preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
