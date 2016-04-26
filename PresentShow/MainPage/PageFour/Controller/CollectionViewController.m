//
//  CollectionViewController.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/19.
//  Copyright © 2016年 z. All rights reserved.
//

#import "CollectionViewController.h"
#import "TableViewCell.h"

#import "DataBaseTools.h"
#import "DataBaseModel.h"

#import "hahahaViewController.h"

@interface CollectionViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) UITableView *tableViewStore;
@property (nonatomic, retain) NSMutableArray *dataSource;
@property (nonatomic, retain) NSArray *array;
@property (nonatomic, retain) DataBaseTools *dabe;
@end

@implementation CollectionViewController
- (void)dealloc {
    _tableViewStore.delegate = nil;
    _tableViewStore.dataSource = nil;
    
    [_dataSource release];
    [_tableViewStore release];
    [_array release];
    [_dabe release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.dk_backgroundColorPicker = DKColorWithRGB(0xffffff, 0x343434);
    self.navigationController.navigationBar.hidden = NO;
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIBarButtonItem *left =[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"iconfont-fanhui"] style:UIBarButtonItemStylePlain target:self action:@selector(reBackLastLevel)];
    self.navigationItem.leftBarButtonItem = left;
    [left release];

    self.dabe = [DataBaseTools databaseManager];
    [_dabe openDataBase];
    [_dabe createTable];
    self.array = [_dabe readDatabase];
    if (!_array.count) {
        [self.navigationController presentViewController:[NoWifiAlertController createAlertIfNoDataSource:@"你还没用收藏奥" ViewC: self.navigationController] animated: YES completion:^{}];
    }
    [_dabe closeDataBase];
    NSLog(@"%ld", (unsigned long)_array.count);
//    [dabe updateDateBase:@"最适合春天穿的一大波质感男鞋来袭" withNewName:@"男鞋"];
    self.dataSource = [NSMutableArray arrayWithArray:_array];
    [self createTableView];
    // Do any additional setup after loading the view.
}
- (void)createTableView {
    UIButton *button  = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, WIDTH, 0.07 * HEIGHT);
    [self.view addSubview:button];
    button.backgroundColor = [UIColor colorWithRed:0.7642 green:0.0 blue:0.0072 alpha:1.0];
    [button setTitle:@"收藏详情" forState: UIControlStateNormal];
    
    self.tableViewStore = [[UITableView alloc] initWithFrame:CGRectMake(0, 0.07 * HEIGHT, WIDTH, 0.78 *HEIGHT) style:UITableViewStylePlain];
    self.tableViewStore.backgroundColor = [UIColor redColor];
    self.tableViewStore.dataSource = self;
    self.tableViewStore.delegate = self;
    self.tableViewStore.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableViewStore];
    
    

    //    [dabe  insertDataBase:@"ssas" withAge:@"yes"];
    //    NSArray *arr = [NSArray arrayWithArray:[dabe readDatabase]];
    //    NSLog(@"%@", arr);
    [self.tableViewStore registerClass:[TableViewCell class] forCellReuseIdentifier:@"littleCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"littleCell"];
        DataBaseModel *model = self.dataSource[indexPath.row];
    cell.textLabel.text = model.dbTitle;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HahahaViewController *haha = [[HahahaViewController alloc] init];
    DataBaseModel *model = self.dataSource[indexPath.row];
    haha.url = model.dbURL;
    haha.titleme = model.dbURL;
    [self.navigationController pushViewController:haha animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark _收藏的编辑设置
//
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    
    [self.tableViewStore setEditing:editing animated:animated];
}
//  确定编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row + 1) {
        return UITableViewCellEditingStyleDelete;
    } else
        return UITableViewCellEditingStyleNone;
}
//  确定哪些 CEll编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row + 1) {
        return YES;
    } else
        return NO;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(editingStyle == UITableViewCellEditingStyleDelete) {
        [self.dataSource removeObjectAtIndex:indexPath.row];
        // 男哥小贴士：前方高能预警，请注意：
        //           在处理tableView的时候一定要先处理数据再处理视图
        DataBaseTools *data = [DataBaseTools databaseManager];
        [data openDataBase];
        [data createTable];

        DataBaseModel *model = _array[indexPath.row];
        [data deleteDataBase:model.dbTitle];
        NSLog(@"dabe %@", model.dbTitle);
        [data closeDataBase];
        [self.tableViewStore deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    }
    
}
- (void)reBackLastLevel {
    [self.navigationController popViewControllerAnimated:YES];
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
