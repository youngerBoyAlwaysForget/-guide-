//
//  MainViewController.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/14.
//  Copyright © 2016年 z. All rights reserved.
//

#import "MainViewController.h"
#import "XXPageViewController.h"
#import "XXTableViewController.h"
#import "ChoiceModel.h"
#import "OiceModel.h"

@interface MainViewController ()<XXPageViewControllerDataSource>
@property (nonatomic, retain) NSArray *tabBarArray;
@property (nonatomic, retain) NSArray *idNumber;
@end

@implementation MainViewController

-(void)dealloc {
    [_idNumber release];
    [_tabBarArray release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.dk_backgroundColorPicker = DKColorWithColors([UIColor whiteColor], [UIColor darkGrayColor]);
    UIImageView *bacek = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ffff"]];
    bacek.frame = self.view.frame;
    [self.view addSubview:bacek];
    self.navigationItem.hidesBackButton = YES;
    [self GetData];
    self.tabBarArray = @[@"精选", @"淘淘", @"涨姿势", @"美食", @"创意生活", @"生日", @"礼物", @"结婚", @"纪念日", @"数码", @"爱运动", @"母婴", @"家具", @"情人节", @"爱读书", @"科技范", @"送爸妈"];

    // Do any additional setup after loading the view.
}

     
-(void)viewDidAppear:(BOOL)animated {
    XXPageViewController *pageVC = [[XXPageViewController alloc] initWithTabBarStyle:XXTabBarStyleCursorUnderline];
    pageVC.dataSource = self;
    
    [self.navigationController pushViewController:pageVC animated:YES];
    [pageVC release];
}
-(NSInteger)numberOfPages {
    return _tabBarArray.count;
}

- (NSString *)titleOfPage:(NSInteger)page {
//    NSURL *url = [NSURL URLWithString:@"http://api.liwushuo.com/v2/channels/preset?gender=1&generation=1"];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];

    return _tabBarArray[page];
}
-(UIViewController *)constrollerOfPage:(NSInteger)page {
    self.idNumber = @[@"100", @"129", @"120", @"118", @"125", @"30", @"111", @"33", @"31", @"121",@"123", @"119", @"112",@"32", @"124", @"28", @"6", @"26"];
    XXTableViewController *con = [[XXTableViewController alloc] init];
    
    con.Id_URL = self.idNumber[page];
    
    return con;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)GetData {
    //    [XXAFNetTool GETWithURL:@"http://api.liwushuo.com/v2/channels/preset?gender=1&generation=1" Body:nil HeaderFile:nil Response:responseJSON success:^(id result) {
    //
    //        ChoiceModel *choice = [[ChoiceModel alloc] initWithDic:result[@"data"]];
    //        self.tabBarArray = [NSMutableArray arrayWithCapacity:0];
    //        self.idNumber = [NSMutableArray arrayWithCapacity:0];
    //        for (OiceModel *oice in choice.channels) {
    //
    //        }
    //        NSLog(@"%@",_idNumber);
    //
    //    } failure:^(NSError *error) {
    //        
    //    }];
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
