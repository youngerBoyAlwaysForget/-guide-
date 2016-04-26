//
//  XXCellViewController.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/10.
//  Copyright © 2016年 z. All rights reserved.
//

#import "SearchCellViewController.h"
#import "SeachManager.h"
#import "SearchCell.h"
#import "SummaryModel.h"

#import "HahahaViewController.h"
@interface SearchCellViewController ()<UISearchDisplayDelegate, UISearchBarDelegate,UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *detailArr;
@property (nonatomic, retain) NSArray *array;//
@property (nonatomic, retain) UITextField *field;
@property (nonatomic, retain) UISearchBar *searchBar;
@property (nonatomic, retain) UIVisualEffectView *effectView;

@property (nonatomic, retain) UITableView *tableCView;
@property (nonatomic, retain) NSMutableArray *dataSource;

@end

@implementation SearchCellViewController

-(void)dealloc {
    [_effectView release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(itemAct)];
    self.navigationItem.rightBarButtonItem = item;
    
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 10, 300, 30)];
    _searchBar.backgroundColor = [UIColor whiteColor];
    self.navigationItem.titleView = _searchBar;
    _searchBar.delegate = self;
    _searchBar.placeholder = @"search";
    
//    _searchBar.barStyle = UIBarStyleDefault;
//    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
//    _searchBar.keyboardType = UIKeyboardTypeDefault;
    [_searchBar resignFirstResponder];

    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor colorWithRed:101 / 255.0 green:147 /255.0 blue:74 / 255.0 alpha:1];
    _tableView.rowHeight = 40;
    [self.view addSubview:self.tableView];
    
    [self createCollectionView];
    // Do any additional setup after loading the view.
}
- (void)createCollectionView {
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
//    UICollectionViewFlowLayout *flowOut = [[UICollectionViewFlowLayout alloc] init];
//    flowOut.itemSize = CGSizeMake(width, height * 0.3);
//    flowOut.minimumInteritemSpacing = 10;
//    flowOut.minimumLineSpacing = 10;
//    flowOut.scrollDirection = UICollectionViewScrollDirectionVertical;
//    flowOut.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);

    self.tableCView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, width, height - 94)];
    _tableCView.delegate = self;
    _tableCView.dataSource = self;
    _tableCView.separatorStyle = UITableViewCellEditingStyleNone;
//    _tableCView.rowHeight = 150;
    self.tableCView.backgroundColor = [UIColor whiteColor];

    [_tableCView registerClass:[SearchCell class] forCellReuseIdentifier:@"searchCell"];
}
- (void)itemAct {
    [self.tableCView removeFromSuperview];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:NO];
    [self readNSUserDefaults];
    
}
#pragma mark _searchBar输入时的方法
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    if (searchBar.text.length > 0) {
        [SeachManager searchMemoery:searchBar.text];
        [self readNSUserDefaults];
    } else {
        NSLog(@"请输入查找内容");
    }
    [self.tableView removeFromSuperview];
    _tableView.userInteractionEnabled = NO;
    [searchBar resignFirstResponder];
    [self.view addSubview:self.tableCView];
    
    NSString *url = [NSString stringWithFormat:@"http://api.liwushuo.com/v2/search/post?sort=&limit=20&offset=0&keyword=%@", searchBar.text];

    [XXAFNetTool GETWithURL:url Body:nil HeaderFile:nil Response:responseJSON success:^(id result) {
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in [result[@"data"]objectForKey:@"posts"]) {
            SummaryModel *summary = [[SummaryModel alloc] init];
            [summary setValuesForKeysWithDictionary:dic];
            [array addObject:summary];
        }
        self.dataSource = [NSMutableArray arrayWithArray:array];
        NSLog(@"sousuogehsu  %zd", _dataSource.count);
        if (_dataSource) {
            [self.tableCView reloadData];
        }
     
    } failure:^(NSError *error) {}];
    
}


- (void)readNSUserDefaults {
    NSUserDefaults *userdefaultes = [NSUserDefaults standardUserDefaults];
    NSArray *array = [userdefaultes arrayForKey:@"zxx"];
    self.array = array;
    [_tableView reloadData];
    //    NSLog(@"%@",array);
}

#pragma mark _tableView协议方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView == _tableView) {
        return 2;
    } else
        return 1;
    
}
//返回行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == _tableView) {
        if (section == 0) {
            if (_array.count > 0) {
                return _array.count + 2;
            } else {
                return 1;
            }
        }else {
            return 0;
        }
    }
    if (tableView == _tableCView) {
        if (!_dataSource) {
            return 1;
        }
            return self.dataSource.count;        
    }
    return 0;
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == _tableView) {
        if (indexPath.row == 0) {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"cell"];
            cell.textLabel.text = @"历史搜索";
            cell.textLabel.backgroundColor = [UIColor greenColor];
            return cell;
        } else if (indexPath.row == _array.count + 1) {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"cell"];
            cell.textLabel.text = @"清除历史记录";
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            return cell;
        } else {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"cell"];
            NSArray *reverseArr = [[_array reverseObjectEnumerator]allObjects];
            cell.textLabel.text = reverseArr[indexPath.row - 1];
            return cell;
            
        }
    }
    if (tableView == _tableCView) {
        SearchCell *cell = [_tableCView dequeueReusableCellWithIdentifier:@"searchCell"];
        cell.sumMdoel = self.dataSource[indexPath.item];
        cell.backgroundColor = [UIColor whiteColor];
        if (!_dataSource) {
            cell.name.text = @"没有相关东东";
            return cell;
        } else
            return cell;
    }
    
    else
        return nil;
    
}

//  行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _tableView) {
        if (indexPath.row == 0) {
            return 20;
        } else
            _tableView.estimatedRowHeight = 44.0f;
        return UITableViewAutomaticDimension;
    } else
        return 100;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _tableView) {
        [_tableView deselectRowAtIndexPath:indexPath animated:YES];
        NSLog(@"21212121%@",@"me");
        
        NSArray *reverseArr = [[_array reverseObjectEnumerator]allObjects];
        if (indexPath.row < reverseArr.count + 1 && indexPath.row != 0) {
            _searchBar.text = reverseArr[indexPath.row - 1];
        }
        
        if (indexPath.row == _array.count + 1) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"删除记录" message:@"" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancell = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:nil];
            UIAlertAction *delete = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [SeachManager removeAll];
                _array = nil;
                [_tableView reloadData];
            }];
            [alert addAction:cancell];
            [alert addAction:delete];
            [self presentViewController:alert animated:YES completion:^{
                
            }];
        }
        
    }
    if (tableView ==  _tableCView) {
        HahahaViewController *haha = [[HahahaViewController alloc] init];
        SummaryModel *summar = self.dataSource[indexPath.item];
        haha.url = [NSString stringWithFormat:@"http://www.liwushuo.com/posts/%@/content", summar.idNum];
        haha.titleme = summar.title;
        [self.navigationController pushViewController:haha animated:YES];
        
    }
    
}

- (void)create {
    //    self.field = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 414, 40)];
    //    _field.backgroundColor = [UIColor cyanColor];
    //    self.navigationItem.titleView = _field;
    //    _field.delegate = self;
    //    _field.returnKeyType = UIReturnKeySearch;
    //    _field.keyboardType = UIKeyboardTypeDefault;
    //    [self.view addSubview:_field];
    //    _field.clearsOnBeginEditing = YES;
    //    [_field resignFirstResponder];
    //    _field.clearButtonMode = UITextFieldViewModeWhileEditing;
    //    _field.clearsOnInsertion = YES;
    //    if (!_effectView) {
    //        UIBlurEffect *flour = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    //        self.effectView = [[UIVisualEffectView alloc] initWithEffect:flour];
    //        _effectView.frame = self.view.bounds;
    //        _effectView.alpha = .5f;
    //        _effectView.backgroundColor = [UIColor blackColor];
    //        [self.view addSubview:_effectView];
    //        self.tabBarController.tabBar.hidden = YES;
    //
    ////        UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
    ////        view.backgroundColor = [UIColor whiteColor];
    ////        view.tag = 100;
    ////        [self.view addSubview:view];
    //
    //        CGFloat width = self.view.bounds.size.width / 2;
    //        CGFloat height = self.view.bounds.size.height;
    //        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //        button.frame = CGRectMake(width, height - 50, 50, 50);
    //
    //        [button setImage:[UIImage imageNamed:@"xxx"] forState:UIControlStateNormal];
    //        [self.collectionView addSubview:button];
    //        [button addTarget:self action:@selector(removeEffectHaaAct:) forControlEvents:UIControlEventTouchDown];
    //        [_effectView addSubview:self.collectionView];
    //        [_effectView release];
    //    }
     //- (void)removeEffectHaaAct:(UIButton *)sender {
    //    UIView *view = [self.view viewWithTag:100];
    //    [view removeFromSuperview];
    //    [_effectView removeFromSuperview];
    //    
    //}
        //-(BOOL)textFieldShouldReturn:(UITextField *)textField {
//    if (textField.text.length > 0) {
//        [SeachManager searchMemoery:textField.text];
//        [self readNSUserDefaults];
//    } else {
//        NSLog(@"请输入查找内容");
//    }
//    return YES;
//}
    
    //-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    //    if (section == 0) {
    //        return 0;
    //    } else {
    //        return 10;
    //    }
    //}
}


//- (void)tableCView:(UItableCView *)tableCView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
