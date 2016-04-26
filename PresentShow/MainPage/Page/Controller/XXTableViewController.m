//
//  XXTableViewController.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/14.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXTableViewController.h"
#import "XXTableViewCell.h"
#import "XXAFNetTool.h"
#import "DataModel.h"

#import "MBProgressHUD+NJ.h"
#import "HahahaViewController.h"
#import "MJRefresh.h"
@interface XXTableViewController ()
@property (nonatomic, retain) NSArray *DataSource;

@property (nonatomic, assign) BOOL buttonValue;
@end

@implementation XXTableViewController
-(void)dealloc {
    [_DataSource release];
    [_Id_URL release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dk_backgroundColorPicker = DKColorWithColors([UIColor whiteColor], [UIColor darkGrayColor]);
    
    self.tableView.showsVerticalScrollIndicator = NO;
    [self getData];
    
    [self setupRefresh];
    //    [self.tableView addHeaderWithCallback:^{ [self addHeadMJrefresh];}];
    //    self.tableView.dk_backgroundColorPicker =  DKColorWithRGB(0xffffff,
    //    0x343434);
    //    self.tableView.dk_separatorColorPicker = DKColorWithRGB(0xaaaaaa,
    //    0x313131);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (void)addHeadMJrefresh {
    

    

    
    
}
- (void)setDataSource:(NSArray *)DataSource {
    if (_DataSource != DataSource) {
        [_DataSource release];
        _DataSource = [DataSource retain];
    }
}
- (void)setupTableView {
    self.tableView.rowHeight = 200;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[XXTableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}
- (void)getData {
 [self setupTableView];
//    [self.tableView headerBeginRefreshing];
    NSString *string = [NSString stringWithFormat:@"http://api.liwushuo.com/v2/channels/%@/items?ad=2&gender=1&generation=1&limit=20&offset=0",self.Id_URL];
    [XXAFNetTool GETWithURL:string Body:nil HeaderFile:nil Response:responseJSON success:^(id result) {
        DataModel *dataModel = [[DataModel alloc] initWithDic:result[@"data"]];
        self.DataSource = dataModel.items;
        
        [dataModel release];
        [MBProgressHUD hideHUD];
//       [self.tableView headerEndRefreshing];
        [self.tableView reloadData];
        
        
    } failure:^(NSError *error) {
        
    }];
    
        
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)button:(UIButton *)sender {
    
    if (_buttonValue) {
        [sender setBackgroundImage:[UIImage imageNamed:@"kongxin"] forState:UIControlStateNormal];
        _buttonValue = NO;
        NSLog(@"点击收藏");
    } else {
        [sender setBackgroundImage:[UIImage imageNamed:@"shixin2"] forState:UIControlStateNormal];
        _buttonValue = YES;
    }
    
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (!_DataSource) {
        return 0;
    } else
        return _DataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    ItemsModel *item = self.DataSource[indexPath.row];
    cell.itemModel = item;
    [UIView transitionWithView:cell duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        cell.frame = cell.frame;
    } completion:^(BOOL finished) {
        
    }];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ItemsModel *item = self.DataSource[indexPath.row];
    HahahaViewController *hahaha = [[HahahaViewController alloc] init];
    hahaha.url = item.url;
    hahaha.titleme = item.title;
    NSLog(@"22222222222222%@",hahaha.titleme);
    if ([Reachability judgeNetWork]) {
        //必须设置为no，动画才有效
        [self.navigationController pushViewController:hahaha animated:YES];
    } else {
        NoWifiAlertController *noew = [NoWifiAlertController createAlert];
        [self.navigationController presentViewController:noew animated:YES completion:^{}];
    }
    
    [hahaha release];
//    XXTableViewCell *cell = (XXTableViewCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
//    [cell.likeHeart addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchDown];
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"SASAS");
}
- (void)setupRefresh {
    
////    [self.tableView addFooterWithTarget:self action:nil];
//    self.tableView .footerPullToRefreshText = @"你要更多信息吗";
//    self.tableView.footerReleaseToRefreshText = @"即将给你要的";
//    self.tableView.footerRefreshingText = @"正在来的路上";
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
