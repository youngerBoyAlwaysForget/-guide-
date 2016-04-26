//
//  ThreeViewController.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/12.
//  Copyright © 2016年 z. All rights reserved.
//

#import "ThreeViewController.h"
#import "SearchCellViewController.h"
#import "RightTableViewCell.h"

#import "XXDataModel.h"
#import "XXCategoriesModel.h"
#import "ThreeSameViewController.h"
#import "MBProgressHUD.h"
#import "MBProgressHUD+NJ.h"
#import "Reachability.h"
#import "XXBaseTableView.h"
#define Color(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface ThreeViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) UITableView *leftTableView;
@property (nonatomic, retain) XXBaseTableView *rightTableView;

@property (nonatomic, retain) NSArray *leftDataSource;
@property (nonatomic, retain) NSArray *rightDataSource;
@property (nonatomic, retain) XXDataModel *dataModel;

@property (nonatomic, assign) BOOL  NoYes;
@property BOOL Noyes;
@end

@implementation ThreeViewController
-(void)dealloc {
    _leftTableView.dataSource = nil;
    _leftTableView.delegate = nil;
    _rightTableView.dataSource = nil;
    _rightTableView.delegate = nil;
    
    [_leftTableView release];
    [_rightTableView release];
    [_leftDataSource release];
    [_rightDataSource release];
    [_dataModel release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchAct:)]autorelease];


    self.navigationItem.title = @"Class";
    
    [self GetDataWithURL];
    
    
    [self createIfWifiIsOkay];
    
//    NSLog(@"%.f %.f", self.navigationController.navigationBar.bounds.size.height, self.tabBarController.tabBar.bounds.size.height);
    // Do any additional setup after loading the view.
}
#pragma mark _根据网络请求创建 tableView 

- (void)createIfWifiIsOkay {
    if ([Reachability judgeNetWork]) {

    } else {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"NoWiFi"]];
        imageView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
        [self.view addSubview:imageView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(GetDataWithURL)];
        [imageView addGestureRecognizer:tap];
        imageView.userInteractionEnabled = YES;
        [imageView release];
        
    }

}
#pragma mark _数据请求
- (void)GetDataWithURL {
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    //文字
//    hud.label.text = @"数据在加载奥";
//    hud.detailsLabel.text = @"waiting";
//    hud.margin = 20.f;
//    [hud hideAnimated:[MBProgressHUD judgeNetWork]];//判断网络状态. 如果有网,执行数据加载动画
    
    [XXAFNetTool GETWithURL:@"http://api.liwushuo.com/v2/item_categories/tree" Body:nil HeaderFile:nil Response:responseJSON success:^(id result) {
        self.dataModel = [[XXDataModel alloc] initWithDic:result[@"data"]];
        _leftDataSource = [[NSArray alloc] initWithArray:_dataModel.leftArr];
        
//        [hud hideAnimated:YES];
        
        [MBProgressHUD hideHUD];
        [self createRightTableView];
        [self createLeftTableView];
        
        //        NSLog(@"%@ sasas%@", _dataModel.categories[5], _leftDataSource[3]);
        
        [_leftTableView reloadData];
        [_rightTableView reloadData];
    } failure:^(NSError *error) {
                
    }];
    
}
/// 判断 WIfi网络状态
//- (BOOL)createmes {
//    // 判断网络的状态
//    Reachability *wifi = [Reachability reachabilityForLocalWiFi];
//    // 连接wifi
//    if ([wifi currentReachabilityStatus] != NotReachable) {
//        return YES;
//    }
//    else
//        return NO;
//}
//
- (void)createLeftTableView {
    CGRect viewBounds = CGRectMake(0, 0, self.view.bounds.size.width / 3, HEIGHT * 0.85);
    if (!_leftTableView) {
        _leftTableView = [[UITableView alloc] initWithFrame:viewBounds style:UITableViewStylePlain];
        _leftTableView.delegate = self;
        _leftTableView.dataSource = self;
        _leftTableView.showsVerticalScrollIndicator = NO;
        _leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;

        [self.view addSubview:_leftTableView];
        [_leftTableView release];
//        [_leftTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }

}
//创建右侧视图
- (void)createRightTableView {
    CGRect viewBounds = CGRectMake(self.view.bounds.size.width / 3, 0, self.view.bounds.size.width /3 * 2, HEIGHT * 0.85);
    if (!_rightTableView) {
        _rightTableView = [[XXBaseTableView alloc] initWithFrame:viewBounds style:UITableViewStyleGrouped];
        _rightTableView.delegate = self;
        _rightTableView.dataSource = self;

        
        _rightTableView.separatorStyle = UITableViewCellEditingStyleNone;
        _rightTableView.rowHeight = self.view.bounds.size.height / 15;
        [self.view addSubview:_rightTableView];
        
        [_rightTableView registerClass:[RightTableViewCell class] forCellReuseIdentifier:@"rightCell"];
        [_rightTableView release];
    }
}
#pragma mark  tableView协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == _leftTableView) {
        if (!_leftDataSource) {
            return 5;
        } else
            return _leftDataSource.count;
    }
    if (tableView == _rightTableView) {
        if (!_dataModel) {
            return 10;
        } else  {
            XXCategoriesModel *cateModel = _dataModel.categories[section];
            return cateModel.subcategories.count;
        }
    }
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView == _rightTableView) {
        if (!_dataModel.categories.count) {
            return 1;
        } else {
            return _dataModel.categories.count;
        }
    } else if (tableView == _leftTableView) {
        return 1;
    } else
        return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _leftTableView) {
        static NSString *CellIdentifier = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//        if (indexPath.row == 0) {
//            cell.backgroundColor = [UIColor whiteColor];
//        }
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell.backgroundColor = Color(210, 210, 210);
            UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
            selectedBackgroundView.backgroundColor = [UIColor whiteColor];
            cell.selectedBackgroundView = selectedBackgroundView;
            
            
            
            UIView *liner = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 6, cell.bounds.size.height)];
            liner.backgroundColor = [UIColor orangeColor];
            [selectedBackgroundView addSubview:liner];
            [selectedBackgroundView release];
            [liner release];
        }
        cell.textLabel.text = _leftDataSource[indexPath.row];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        return cell;
    }
    
    
    if (tableView == _rightTableView) {
        RightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rightCell"];
        cell.backgroundColor = [UIColor clearColor];
        XXCategoriesModel *cateModel = _dataModel.categories[indexPath.section];
        XXSubcategoriesModel *subModel = cateModel.subcategories[indexPath.row];
        cell.subModel = subModel;
        return cell;
    } else
        return nil;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (tableView == _rightTableView) {
        XXCategoriesModel *cate = _dataModel.categories[section];
        return [NSString stringWithFormat:@"%@",cate.name];
    }
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (tableView == _rightTableView) {
        
        UIView *saturday = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 40)];
        UILabel *label = [[UILabel alloc] initWithFrame:saturday.bounds];
        XXCategoriesModel *cate = _dataModel.categories[section];
        
        label.text = cate.name;
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor colorWithRed:0.1719 green:0.1719 blue:0.1719 alpha:0.0];
        [saturday addSubview:label];
        
        [label release];

        return saturday;
//        [saturday release];        
    }
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchAct:(UIBarButtonItem *)sender {
    SearchCellViewController *cell = [[SearchCellViewController alloc] init];
    [self.navigationController pushViewController:cell animated:YES];
    [cell release];
    
}
// tableView点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _leftTableView) {
        _NoYes = NO;
        [self.leftTableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
        
        [self.rightTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:indexPath.row] atScrollPosition:UITableViewScrollPositionNone animated:YES];
        
    }
    
    if (tableView == _rightTableView) {
        [self.rightTableView deselectRowAtIndexPath:indexPath animated:NO];
        XXCategoriesModel *cateModel = _dataModel.categories[indexPath.section];
        XXSubcategoriesModel *subModel = cateModel.subcategories[indexPath.row];
        
        ThreeSameViewController *three = [[ThreeSameViewController alloc] init];
        three.mememee = subModel.idOrder;
        three.title = subModel.name;
        [self.navigationController pushViewController:three animated:YES];
        
        [three release];
    }
        
}

//其他有关左右协调动画的协议方法
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    _NoYes = YES;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    if (_NoYes) {
        NSInteger topCellSection = [[[tableView indexPathsForVisibleRows] firstObject] section];
        if (tableView == _rightTableView) {
            [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:topCellSection inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
        }
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section {
    if (_NoYes) {
        NSInteger topCellSection = [[[tableView indexPathsForVisibleRows] firstObject] section];
        if (tableView == _rightTableView) {
            [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:topCellSection inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
        }
    }
  
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
