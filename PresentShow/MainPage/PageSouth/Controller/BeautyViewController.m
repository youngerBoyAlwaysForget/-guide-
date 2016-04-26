//
//  BeautyViewController.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/19.
//  Copyright © 2016年 z. All rights reserved.
//

#import "BeautyViewController.h"
#import "XXAFNetTool.h"
#import "BeautyModel.h"
#import "Article_urlModel.h"
#import "BeautyCell.h"
#import "ScrollViewController.h"
#import "MBProgressHUD+NJ.h"
#import "AFHTTPSessionManager.h"
#import "AFURLRequestSerialization.h"
#import "ShapeLoadingView.h"
#import "Reachability.h"
@interface BeautyViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) NSArray *dateSource;

@property (nonatomic, retain) UITableView *tableView;

@property (nonatomic, retain) BeautyModel *beautyModel;
@property (nonatomic, retain) ShapeLoadingView *shaoe;

@end

@implementation BeautyViewController

- (void)dealloc
{
    _tableView.delegate = nil;
    _tableView.dataSource = nil;
    [_beautyModel release];
    [_shaoe release];
    [_dateSource release];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [_shaoe release];
    [_beautyModel release];
    [self createTableView];
    [self getDaata]; 
    
    
//    self.view.dk_backgroundColorPicker = DKColorWithRGB(0xffffff, 0x343434);
//    self.navigationController.navigationBar.dk_tintColorPicker = DKColorWithColors([UIColor blueColor], [UIColor redColor]);
    // Do any additional setup after loading the view.
}
- (void)notificationCenter {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(showPictureIfNoWifiAndData) name:@"noResult" object:nil];
}
- (void)showPictureIfNoWifiAndData {
    self.view.backgroundColor = [UIColor colorWithRed:101 / 255.0 green:147 /255.0 blue:74 / 255.0 alpha:1];
    
    
    if (![Reachability judgeNetWork]) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wifiNo1.jpg"]];
        imageView.frame = CGRectMake(0, HEIGHT * 0.1, WIDTH, WIDTH * 9 / 16);
        [self.view addSubview:imageView];
        imageView.tag = 541;
        [imageView release];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(getDaata)];
        [self.view addGestureRecognizer:tap];
        //        imageView.center = self.view.center;
//        if (!_dateSource) {
//            self.shaoe = [[ShapeLoadingView alloc] initWithFrame:CGRectMake(0, HEIGHT * 0.5, WIDTH, 150) title:@"没有网.(╯-╰)"];
//            [self.view addSubview:_shaoe];
//            [_shaoe startAnimating];
//        }
        
    }
    if ([Reachability judgeNetWork]) {
        UIImageView *me = [self.view viewWithTag:541];
        [me removeFromSuperview];
    }
    
    
    

}
- (void)getDaata {

    
    [XXAFNetTool GETWithURL:@"http://api.nfpeople.dailypad.cn/album_xml.php?pagenum=1" Body:nil HeaderFile:nil Response:responseJSON success:^(id result) {
        
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in result) {
            self.beautyModel = [[BeautyModel alloc] initWithArray:dic];
            [array addObject:_beautyModel];
            [_beautyModel release];
          
        }
        self.dateSource = array;
        [_tableView reloadData];
//        [MBProgressHUD hideHUD];
        NSLog(@"south %ld", self.dateSource.count);
    } failure:^(NSError *error) {
//        [MBProgressHUD showError:@"中国移动很坑爹!"];
        
    }];
}

- (void)createTableView {
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, width, height - 70)];
    self.tableView.bounces = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = HEIGHT * 0.37;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.tableView.dk_backgroundColorPicker =  DKColorWithRGB(0xffffff, 0x343434);
//    self.tableView.dk_separatorColorPicker = DKColorWithRGB(0xaaaaaa, 0x313131);
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[BeautyCell class] forCellReuseIdentifier:@"southPeopleCell"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (!self.dateSource) {
        return 0;
    }
    return self.dateSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BeautyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"southPeopleCell"];
    BeautyModel *beautyModel = self.dateSource[indexPath.row];
    cell.beautModel = beautyModel;
//    cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
//    [UIView animateWithDuration:1 animations:^{
//        cell.layer.transform = CATransform3DMakeTranslation(1, 1, 1);
//    }];
    [UIView transitionWithView:cell duration:1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
    } completion:^(BOOL finished) {
    }];
    return cell;
}

#pragma mark 页面跳转 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ScrollViewController *scrollVC = [[ScrollViewController alloc] init];
    self.beautyModel = self.dateSource[indexPath.row];
    scrollVC.dateSource = self.beautyModel.list;
//    [self.delegetee sendhahahhaahha:self.beautyModel.title];
    scrollVC.UrlPassenger = self.beautyModel.article_url;
//    scrollVC.modalPresentationStyle = UIModalPresentationCurrentContext;
    [self.navigationController pushViewController:scrollVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = NO;
    [self notificationCenter];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)viewDidAppear:(BOOL)animated {
    self.navigationItem.title = @"News";
}
@end
