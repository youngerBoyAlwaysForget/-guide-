//
//  XXBaseViewController.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/7.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXBaseViewController.h"

@interface XXBaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation XXBaseViewController
-(void)dealloc {
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1.0 green:0.149 blue:0.2863 alpha:1.0];
    self.navigationController.navigationBar.dk_barTintColorPicker = DKColorWithColors([UIColor colorWithRed:1.0 green:0.149 blue:0.2863 alpha:1.0], [UIColor darkGrayColor]);
    self.tabBarController.tabBar.dk_tintColorPicker = DKColorWithColors([UIColor redColor], [UIColor lightGrayColor]);      //选中颜色
    self.tabBarController.tabBar.dk_barTintColorPicker = DKColorWithColors([UIColor whiteColor], [UIColor grayColor]);
    
    self.view.dk_backgroundColorPicker = DKColorWithColors([UIColor whiteColor], [UIColor grayColor]);
//    self.tabBarController.tabBar.tintAdjustmentMode = UIViewTintAdjustmentModeNormal;
//    self.navigationItem.leftBarButtonItem.dk_tintColorPicker = DKColorWithColors([UIColor blueColor], [UIColor whiteColor]);
//    self.navigationItem.rightBarButtonItem.dk_tintColorPicker = DKColorWithColors([UIColor blueColor], [UIColor whiteColor]);
//    self.tabBarController.tabBar.dk_tintColorPicker = DKColorWithColors([UIColor blueColor], [UIColor whiteColor]);
    
    // Do any additional setup after loading the view.[NSDate date]

}
- (NSString *)getCurrentTime {
    

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy - MM - dd HH:mm:ss"];
    
    NSString *dateTime = [formatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:635937696000000000]];
    return dateTime;
}
- (void)create {
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"yyyy-MM-dd"];
//    
//    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
//    
//    NSDateFormatter *form = [[NSDateFormatter alloc] init];
//    [form dateFromString:@"dd-mmm-yyyy HH:mm:ss"];
//    NSString *time = [form stringFromDate:[NSDate dateWithTimeIntervalSince1970:63593769600000]];
//        NSLog(@"dataTime---%@ -- %@",dateTime, time);
//    

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
