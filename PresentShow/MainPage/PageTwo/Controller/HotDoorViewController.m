//
//  HotDoorViewController.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/7.
//  Copyright © 2016年 z. All rights reserved.
//

#import "HotDoorViewController.h"
#import "XXTwoCollectionViewCell.h"
#import "TwoItemsModel.h"
#import "MBProgressHUD+NJ.h"
#import "ViewController.h"
#import "Reachability.h"
#import "ShapeLoadingView.h"
@interface HotDoorViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, retain) UICollectionView *collectionView;
@property (nonatomic, retain) NSArray *dataSource;

@property (nonatomic, copy) NSString *string;
//@property (nonatomic, retain) ShapeLoadingView *shaoe;
@property (nonatomic, retain) UIButton *NOWifiButton;
@end

@implementation HotDoorViewController

-(void)dealloc {
    _collectionView.delegate = nil;
    _collectionView.dataSource = nil;
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [_NOWifiButton release];
    [_string release];
    [_collectionView release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.dk_backgroundColorPicker = DKColorWithColors(, <#UIColor *nightColor#>)
    self.navigationItem.title = @"单品";

//无论什么情况, 都需要进行数据请求
    [self GEtDataFromNetWork];

//    [self createCollectionView];
//    [self NoWifiWillCreateButton];
    
    [self NotificationCenter];
    // Do any additional setup after loading the view.
}

- (void)NotificationCenter {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(NoWifiWillCreateButton) name:@"noResult" object:nil];
}
- (void)NoWifiWillCreateButton {
    if (![Reachability judgeNetWork] && YES) {
        self.view.backgroundColor = [UIColor colorWithRed:255 / 255.0 green:67 / 255.0 blue:101 /  255.0 alpha:1];
        self.NOWifiButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.NOWifiButton.frame = CGRectMake(0, 150, WIDTH, 70);
        [self.NOWifiButton setTitle:@"没有网络!" forState:UIControlStateNormal];
        [self.view addSubview:self.NOWifiButton];
        self.NOWifiButton.dk_backgroundColorPicker = DKColorWithColors([UIColor colorWithRed:173 / 255.0 green:195 /255.0 blue:192 / 255.0 alpha:1], [UIColor colorWithRed:0.2238 green:0.1873 blue:0.6667 alpha:1.0]);
        [self.NOWifiButton addTarget:self action:@selector(wifiIsOkayWillRequestFromNet) forControlEvents:UIControlEventTouchDown];
    }
}
- (void)wifiIsOkayWillRequestFromNet {
    if ([Reachability judgeNetWork]) {
//        [MBProgressHUD showMessage:@"正在加载"];
        [self GEtDataFromNetWork];
       
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"没网还点?还点?(=@__@=)？" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *act = [UIAlertAction actionWithTitle:@"我错了" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:act];
        [self presentViewController:alert animated:YES completion:^{}];
    }
    
}
- (void)GEtDataFromNetWork {

    //   [self.collectionView reloadData];

    [XXAFNetTool GETWithURL:@"http://api.liwushuo.com/v2/items?gender=1&limit=20&offset=0&generation=1" Body:nil HeaderFile:nil Response:responseJSON success:^(id result) {
        //        NSLog(@"%@",result);
        
        TwoItemsModel *itemsModel = [[TwoItemsModel alloc] initWithDic:result[@"data"]];
        self.dataSource = [NSArray arrayWithArray: itemsModel.items];
        
        NSLog(@"pageTwo %ld", (unsigned long)self.dataSource.count);
        [itemsModel release];
        [MBProgressHUD hideHUD];
        
         [self createCollectionView];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });

    } failure:^(NSError *error) {

    }];
}
- (void)createCollectionView {
//    CGFloat  height= self.view.bounds.size.height;
//    CGFloat height = self.view.bounds.size.height * 1;
    UICollectionViewFlowLayout *layout = [[[UICollectionViewFlowLayout alloc] init]autorelease];
    
    layout.itemSize = CGSizeMake(WIDTH * 0.46, HEIGHT * 0.34);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing = 20;
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 0, 5);
    
    
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64 -49) collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor colorWithRed:0.9255 green:0.9412 blue:0.9529 alpha:1.0];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.view addSubview:self.collectionView];
    
    
    [self.collectionView registerClass:[XXTwoCollectionViewCell class] forCellWithReuseIdentifier:@"XXTwoCollectionViewCellIdentifier"];
    
    [self.collectionView release];
    [layout release];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (!_dataSource.count) {
        return 0;
    } else {
        return self.dataSource.count;
    }
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XXTwoCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"XXTwoCollectionViewCellIdentifier" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.hotModel = self.dataSource[indexPath.row];
//    NSLog(@"%@",cell.hotModel.favorites_count);
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"%ld", (long)indexPath.item);
    ViewController *vc = [[ViewController alloc] init];
    vc.hotModel = self.dataSource[indexPath.row];
    CATransition *animation = [CATransition animation];
    [animation setSubtype:kCATransitionFromTop];
    animation.duration = 1;
    if ([Reachability judgeNetWork]) {
        [self.navigationController pushViewController:vc animated:NO];//必须设置为no，动画才有效
        [self.navigationController.view.layer addAnimation:animation forKey:nil];
    } else {
        NoWifiAlertController *noew = [NoWifiAlertController createAlert];
        [self.navigationController presentViewController:noew animated:YES completion:^{}];
    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.tabBarController.tabBar.hidden = NO;
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
