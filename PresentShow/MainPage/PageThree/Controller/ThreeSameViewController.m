//
//  ThreeSameViewController.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/12.
//  Copyright © 2016年 z. All rights reserved.
//

#import "ThreeSameViewController.h"
#import "SaturdayCollectionCell.h"

#import "ThreeItemsModel.h"
#import "ItemsSaturdayModel.h"
#import "DeailThreeViewController.h"

#import "MJRefresh.h"
#import "NoResultBackController.h"
@interface ThreeSameViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, retain) UICollectionView *collectionView;
@property (nonatomic, retain) NSMutableArray *dataSource;
@property (nonatomic, assign) NSInteger sention;
@end

@implementation ThreeSameViewController
-(void)dealloc {
    _collectionView.dataSource = nil;
    _collectionView.delegate = nil;
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [_collectionView release];
    [_dataSource release];
    [_mememee release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.tabBar.hidden = YES;
//    self.navigationController.title = self.titleee;
    self.dataSource = [NSMutableArray arrayWithCapacity:0];
    self.sention = 0;
    [self getDataWithURL];
    

    
    
    [self createCollectionView];
    [self addheadAndFootRefresh];
    [self IfNoWifiAndCasheVCWillBeReback];
//    [self addHeader];
//    [self addFooter];
//    self.collectionView.
    // Do any additional setup after loading the view.
}
- (void)IfNoWifiAndCasheVCWillBeReback {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(create) name:@"noResult" object:nil];
}
- (void)create {
//    if ([Reachability judgeNetWork]) {
//        
//    } else {
        [self presentViewController:[NoResultBackController createAlert:YES ViewController:self.navigationController] animated:YES completion:^{}];
//    }
}
- (void)addheadAndFootRefresh {
    
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.sention = 0;
        [self getDataWithURL];
        [_collectionView.mj_header endRefreshing];
    }];
    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.sention += 20;
        [self getDataWithURL];
        [_collectionView.mj_footer endRefreshing];
    }];
//    [self.collectionView headerBeginRefreshing];
//    [self.collectionView addHeaderWithTarget:self action:@selector(getDataWithURL)];
//    //确定进入界面,是请求数据,而不是上啦刷新
//    if (_sention) {
//        [self.collectionView headerBeginRefreshing];
//    }
//    self.collectionView.headerPullToRefreshText = @"12345";
//    self.collectionView.headerRefreshingText = @"上山打老虎";
//    self.collectionView.headerReleaseToRefreshText = @"yu";
//    
//    [self.collectionView addFooterWithTarget:self action:@selector(getDataWithURL)];
//    [self.collectionView footerBeginRefreshing];
//    self.collectionView.footerPullToRefreshText = @"加载啦";
//    self.collectionView.footerRefreshingText = @"刷新";
//    self.collectionView.footerReleaseToRefreshText = @"结束刷新";
}
- (void)getDataWithURL {


    NSString *url = [NSString stringWithFormat:@"http://api.liwushuo.com/v2/item_subcategories/%@/items?limit=20&offset=%ld",_mememee, (long)self.sention];
    [XXAFNetTool GETWithURL:url Body:nil HeaderFile:nil Response:responseJSON success:^(id result) {
        ThreeItemsModel *itemsModel = [[ThreeItemsModel alloc] initWithDic:result[@"data"]];
        [self.dataSource addObjectsFromArray: itemsModel.items];
        if (!_sention) {
            [self.dataSource removeAllObjects];
            [self.dataSource addObjectsFromArray:itemsModel.items];
        }
        [_collectionView reloadData];
        
        
//        [MBProgressHUD hideHUD];
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [MBProgressHUD hideHUD];
//        });
//        [self.collectionView footerEndRefreshing];
//        [self.collectionView headerEndRefreshing];
    } failure:^(NSError *error) {
    }];

}


- (void)createCollectionView {
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.itemSize = CGSizeMake(WIDTH * 0.46, 220);
    flow.scrollDirection = UICollectionViewScrollDirectionVertical;
    flow.minimumInteritemSpacing = 10;
    flow.minimumLineSpacing = 10;
    flow.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flow];
    _collectionView.backgroundColor = [UIColor colorWithRed:185 / 255.0 green:227 / 255.0 blue:217 / 255.0 alpha:1];;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[SaturdayCollectionCell class] forCellWithReuseIdentifier:@"saturday"];
    [_collectionView release];
    [flow release];
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (!_dataSource) {
        return 1;
    } else
    return _dataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SaturdayCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"saturday" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    [UIView transitionWithView:cell duration:1 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
        cell.frame = cell.frame;
    } completion:^(BOOL finished) {
        
    }];
    if (_dataSource) {
        cell.itemMdel = _dataSource[indexPath.row];
    } else {
        cell.title.text = @"没有网络";
    }
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    DeailThreeViewController *threeVC =  [[DeailThreeViewController alloc] init];
    ItemsSaturdayModel *model = _dataSource[indexPath.row];
    threeVC.URL = model.url;
    CATransition *animation = [CATransition animation];
    animation.duration = 1;
    [animation setType:@"reveal"];
    [self.navigationController.view.layer addAnimation:animation forKey:nil];
    
    //根据网络情况确定是否跳转到 webView
    if ([Reachability judgeNetWork]) {
        [self.navigationController pushViewController:threeVC animated:YES];
        [threeVC release];
    } else {
        [self presentViewController:[NoWifiAlertController createAlert] animated:YES completion:^{}];
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"没有网络" message:nil preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *act = [UIAlertAction actionWithTitle:@"return" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
//            
//        }];
//        [alert addAction:act];

    }
    
}

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
//- (void)addHeader {
//
//    __unsafe_unretained typeof(self) vc = self;
//    // 添加上拉刷新尾部控件
//    [self.collectionView addHeaderWithCallback:^{
//        // 进入刷新状态就会回调这个Block
//
//        NSLog(@"上啦 刷新");
//
//        NSString *url = [NSString stringWithFormat:@"http://api.liwushuo.com/v2/item_subcategories/%@/items?limit=20&offset=%ld",_mememee, self.sention];
//        [XXAFNetTool GETWithURL:url Body:nil HeaderFile:nil Response:responseJSON success:^(id result) {
//            ThreeItemsModel *itemsModel = [[ThreeItemsModel alloc] initWithDic:result[@"data"]];
//            [self.dataSource removeAllObjects];
//            [self.dataSource addObjectsFromArray:itemsModel.items];
//            //        NSLog(@"%@", _dataSource);
//
//        } failure:^(NSError *error) {
//        }];
//        // 模拟延迟加载数据，因此2秒后才调用）
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [vc.collectionView reloadData];
//            // 结束刷新
//            [vc.collectionView headerEndRefreshing];
//        });
//    }];
//
//}
//- (void)addFooter {
//
//    __unsafe_unretained typeof(self) vc = self;
//    // 添加下拉加载尾部控件
//    [self.collectionView addFooterWithCallback:^{
//        // 进入下拉状态就会回调这个Block
//
//        NSLog(@"刷新");
//        self.sention += 20;
//        NSString *url = [NSString stringWithFormat:@"http://api.liwushuo.com/v2/item_subcategories/%@/items?limit=20&offset=%ld",_mememee, self.sention];
//        [XXAFNetTool GETWithURL:url Body:nil HeaderFile:nil Response:responseJSON success:^(id result) {
//            ThreeItemsModel *itemsModel = [[ThreeItemsModel alloc] initWithDic:result[@"data"]];
//            [self.dataSource addObjectsFromArray:itemsModel.items];
//            //        NSLog(@"%@", _dataSource);
//            [_collectionView reloadData];
//        } failure:^(NSError *error) {
//        }];
//        // 模拟延迟加载数据，因此2秒后才调用）
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [vc.collectionView reloadData];
//            // 结束加载
//            [vc.collectionView footerEndRefreshing];
//        });
//    }];
//
//}
@end
