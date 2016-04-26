//
//  InfoViewController.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/23.
//  Copyright © 2016年 z. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self getAllStructure];
    
    
    
    // Do any additional setup after loading the view.
}


- (void)getAllStructure {
    CGRect viewFrame = self.view.bounds;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:viewFrame];
    scrollView.contentSize = CGSizeMake(WIDTH, HEIGHT * 1.3);
    [scrollView setIndicatorStyle:UIScrollViewIndicatorStyleDefault];
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    self.view.backgroundColor = [UIColor colorWithRed:255 / 255.0 green:67 / 255.0 blue:101 /  255.0 alpha:1];
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineSpacing = 10;
    paragraph.alignment = NSTextAlignmentLeft;
    paragraph.firstLineHeadIndent = 50;
    paragraph.headIndent = 10;
    
    NSString *string = @"GiFi上所有内容（包括但不限于 文字，图片等）均有版权限制，采用请注意许可。本站介绍所有软件版权归原创者所有。个人或单位 blog 引用时请遵循 “署名-非商业用途-保持一致” 的创作共用协议。我们不欢迎大规模的全站复制，并且保留所有权利。商业网站或未授权媒体不得复制本站内容。\n因为出于尊重原创版权,所以在指南, 单品, South三个栏目, 不提供更多数据.如有需求,可在搜索栏进行查找或访问原网站.\n关于 GiFi,更多信息请联系作者 email: zhangtaoyue@sina.cn";
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:string];
    [attStr addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0, [string length])];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, HEIGHT * 0.35, WIDTH, [self cellHeight:string])];
    label.attributedText = attStr;
    label.numberOfLines = 0;
    [label sizeToFit];
    [scrollView addSubview:label];
    [self.view addSubview:scrollView];
    NSLog(@"%.f,   %.1f", HEIGHT * 0.4, HEIGHT );
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Icon-83.5"]];
    imageView.frame = CGRectMake(WIDTH * 0.35, HEIGHT * 0.1, WIDTH * 0.3, WIDTH * 0.3);
    [scrollView addSubview:imageView];
    [self.view addSubview:scrollView];
}
#pragma mark 自适应高度
-(CGFloat)cellHeight:(NSString *)textString {
    
    //计算自适应 labeld 的时候, label的 行数必须为0;
    NSDictionary *fontDic = [NSDictionary dictionaryWithObject:[UIFont fontWithName:@"Zapfino" size:15] forKey:NSFontAttributeName];
    
    CGSize size = [textString boundingRectWithSize:CGSizeMake(self.view.bounds.size.width - 10 , 0) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:fontDic context:nil].size;
    
    return size.height + 1;
};
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
