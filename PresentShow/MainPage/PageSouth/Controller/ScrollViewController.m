//
//  ScrollViewController.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/19.
//  Copyright © 2016年 z. All rights reserved.
//

#import "ScrollViewController.h"
#import "ScrollCollectionViewCell.h"
#import "NanfangViewController.h"

@interface ScrollViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, retain) UICollectionView *collectionView;

@end

@implementation ScrollViewController

-(void)dealloc {
    _collectionView.delegate = nil;
    _collectionView.dataSource = nil;
    [_dateSource release];
    [_UrlPassenger release];
    [_collectionView release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"123%@",self.UrlPassenger);
    [self createCollectionView];
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    
    UIToolbar *toobar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, height * 0.93, width, height * 0.07)];
    [self.view addSubview:toobar];
    UIBarButtonItem *bar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(cacacaca:)];
    UIBarButtonItem *story = [[UIBarButtonItem alloc] initWithTitle:@"背后的故事" style:UIBarButtonItemStylePlain target:self action:@selector(hahahhaahha)];

    
    toobar.items = @[bar, story];
    [toobar release];
    [bar release];
    [story release];
//    [toobar setItems:@[sen, story] animated:YES];
    // Do any additional setup after loading the view.
}

- (void)cacacaca:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)hahahhaahha {
    NanfangViewController *threePageDetail = [[NanfangViewController alloc] init];
    
    threePageDetail.nanFangWebUrl = [self.UrlPassenger objectForKey:@"share_url"];
    if ([Reachability judgeNetWork]) {
        [self.navigationController pushViewController:threePageDetail animated:YES];//必须设置为no，动画才有效
    } else {
        NoWifiAlertController *noew = [NoWifiAlertController createAlert];
        [self.navigationController presentViewController:noew animated:YES completion:^{}];
    }
   
}
- (void)createCollectionView {
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.itemSize = CGSizeMake(width, height);
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flow.minimumInteritemSpacing = 5;
    flow.minimumLineSpacing = 0;
    flow.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flow];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    _collectionView.pagingEnabled = YES;
    [_collectionView registerClass:[ScrollCollectionViewCell class] forCellWithReuseIdentifier:@"scrollCell"];
//    _collectionView.
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dateSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ScrollCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"scrollCell" forIndexPath:indexPath];
    cell.listModel = self.dateSource[indexPath.item];
    cell.page.text = [NSString stringWithFormat:@"%ld / %lu ", indexPath.item + 1, (unsigned long)self.dateSource.count];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {

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

@end
