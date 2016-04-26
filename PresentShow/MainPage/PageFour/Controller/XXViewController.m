//
//  XXViewController.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/7.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXViewController.h"
#import "CollectionViewController.h"
#import "SingleLabel.h"
#import "DKNightVersionManager.h"
#import "DKNightVersion.h"
#import "XXbutton.h"
#import "InfoViewController.h"

@interface XXViewController ()
@property (nonatomic, retain) UIVisualEffectView *effectView;

@property (nonatomic, retain) NSTimer *timer;
@property (nonatomic, retain) SingleLabel *label;

@property (nonatomic, retain) UISwitch *switvch;

@property (nonatomic, retain) UILabel *casheLabel;//显示缓存有多少m
@end

@implementation XXViewController
-(void)dealloc {
    [_switvch release];
    [_timer release];
    [_label release];
    [_effectView release];
    [_casheLabel release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"GiFi";
    [self createNavigationItem];
    // 界面的 button 以及背景
    [self createAllButton];


    
    

//    self.navigationController.navigationBar.dk_backgroundColorPicker = DKColorWithRGB(0xffffff, 0x444444);
//    self.navigationItem.leftBarButtonItem.dk_tintColorPicker = DKColorWithColors([UIColor blueColor], [UIColor whiteColor]);
//    UIBlurEffect *flour = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
//    
//    self.effectView = [[UIVisualEffectView alloc] initWithEffect:flour];
//    _effectView.frame = self.view.bounds;
//    self.effectView.alpha = .3f;
//    _effectView.backgroundColor = [UIColor magentaColor];
    // Do any additional setup after loading the view.
}

- (void)createNavigationItem {
    self.view.dk_backgroundColorPicker = DKColorWithColors([UIColor colorWithRed:173 / 255.0 green:195 /255.0 blue:192 / 255.0 alpha:1], [UIColor grayColor]);
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(createTimeLabel) userInfo:nil repeats:YES];

    

    UIBarButtonItem *setting = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"iocn"] style:UIBarButtonItemStylePlain target:self action:@selector(changeViewControllerToInfo)];
    
    self.navigationItem.rightBarButtonItems = @[setting];
    

    [setting release];


    //    [scan release];
    //    UIBarButtonItem *scan = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"scan"] style:UIBarButtonItemStylePlain target:self action:@selector(scaning:)];
}


//button页面
- (void)createAllButton {
//    UIImageView *userImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dddd44"]];
//    userImage.frame = CGRectMake(0, 0, WIDTH, HEIGHT * 0.4);
//    [self.view addSubview:userImage];
    
    XXbutton *buttonCollect  = [XXbutton buttonWithType:UIButtonTypeCustom];
    buttonCollect.frame = CGRectMake(WIDTH * 0.15, HEIGHT * 0.05, WIDTH * 0.7, 0.07 * HEIGHT);
    [self.view addSubview:buttonCollect];
    buttonCollect.layer.cornerRadius = 10;
    buttonCollect.backgroundColor = [UIColor colorWithRed:0.7037 green:0.0 blue:0.0236 alpha:0.700377155172414];
    [buttonCollect setTitle:@"我的收藏" forState: UIControlStateNormal];
    [buttonCollect setTitle:@"xx收藏中" forState: UIControlStateSelected];
    [buttonCollect addTarget:self action:@selector(collectionButtonAct) forControlEvents:UIControlEventTouchUpInside];
    
/*8888888888888888888888888888888888888888888*/
    
    self.casheLabel  = [[SingleLabel alloc] init];
    _casheLabel.frame = CGRectMake(WIDTH * 0.15, 0.2 * HEIGHT, WIDTH * 0.7, 0.07 * HEIGHT);
    _casheLabel.layer.cornerRadius = 20;
    _casheLabel.layer.masksToBounds = YES;
#warning  label 创建不能在反复执行的方法里(MRC)
    //    _casheLabel.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.casheLabel];
    [_casheLabel release];
    
/*8888888888888888888888888888888888888888888*/
    
    XXbutton *buttonClear  = [XXbutton buttonWithType:UIButtonTypeCustom];
    buttonClear.frame = CGRectMake(WIDTH * 0.15, 0.3 * HEIGHT, WIDTH * 0.7, 0.07 * HEIGHT);
    [self.view addSubview:buttonClear];
    buttonClear.layer.cornerRadius = 10;
    buttonClear.backgroundColor = [UIColor colorWithRed:0.2711 green:0.7037 blue:0.3728 alpha:1.0];
    [buttonClear setTitle:@"清理缓存" forState: UIControlStateNormal];

    [buttonClear addTarget:self action:@selector(clearFile) forControlEvents:UIControlEventTouchUpInside];
/*88888888888888888888          夜间模式按钮                 88888888888888888888888*/
    
    UIButton *buttonDark  = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonDark.frame = CGRectMake(WIDTH * 0.15, 0.5 * HEIGHT, WIDTH * 0.7, 0.07 * HEIGHT);
    [self.view addSubview:buttonDark];
    buttonDark.layer.cornerRadius = 10;
//    buttonDark.titleLabel.text = @"夜间模式";
    buttonDark.dk_backgroundColorPicker = DKColorWithColors([UIColor colorWithRed:0.1093 green:0.0177 blue:0.1716 alpha:0.5296875], [UIColor lightGrayColor]);
    [buttonDark setTitle:@"夜间模式" forState:UIControlStateNormal];
//    [buttonDark addTarget:self action:@selector() forControlEvents:UIControlEventTouchUpInside];
/*888888888888888888          switch 开关           8888888888888888888888888*/
    self.switvch = [[UISwitch alloc] initWithFrame:CGRectMake(WIDTH * 0.85, 0.51 * HEIGHT, 50, 20)];
    [self.view addSubview:_switvch];
    _switvch.transform = CGAffineTransformMakeRotation(M_PI_2);
    [_switvch addTarget:self action:@selector(swith:) forControlEvents:UIControlEventValueChanged];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0.45 * HEIGHT, WIDTH, 0.07 * HEIGHT)];
    label.text = [self intervalSinceNow:nil];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    [label release];



}
- (void)swith:(UISwitch *)sender {
    DKNightVersionManager *manager = [DKNightVersionManager sharedNightVersionManager];
    if (manager.themeVersion == DKThemeVersionNormal) {
        [DKNightVersionManager nightFalling];
        
    } else
        [DKNightVersionManager dawnComing];
    NSLog(@"sass");
}
- (void)createTimeLabel {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY/MMM/dd   HH:mm:ss"];
    
    NSString *datetimeNow = [formatter stringFromDate:[NSDate date]];
//    NSLog(@"%@", datetime); 单例不许释放
    self.label = [SingleLabel singleLabel];

    self.label.frame = CGRectMake(WIDTH * 0.15, 0.6 * HEIGHT, WIDTH * 0.7, 0.07 * HEIGHT);
    self.label.text = datetimeNow;
    [self.view addSubview:self.label];
    NSString *bigSmall = [NSString stringWithFormat:@"已经缓存%.2fM", [self filePath]];
    self.casheLabel.text = bigSmall;
    self.casheLabel.textAlignment = NSTextAlignmentCenter;
    
//    NSLog(@"%@",self.label.text);
    [formatter release];

}
- (void)changeViewControllerToInfo {
    InfoViewController *info = [[InfoViewController alloc] init];
    
    [self.navigationController pushViewController:info animated:YES];
    [info release];
}

- (void)collectionButtonAct {
    CollectionViewController *cllectVC = [[CollectionViewController alloc] init];

    [self.navigationController pushViewController:cllectVC animated:YES];
    [cllectVC release];
}
- (void)scaning:(UIBarButtonItem *)sender {
    if (1) {
 
        [self.view addSubview:self.effectView];
        self.tabBarController.tabBar.hidden = YES;
        CGFloat width = self.view.bounds.size.width / 2;
        CGFloat height = self.view.bounds.size.height;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(width, height - 150, 50, 50);
        
        [button setImage:[UIImage imageNamed:@"xxx"] forState:UIControlStateNormal];
        [self.effectView addSubview:button];
        [button addTarget:self action:@selector(removeEffectHaaAct:) forControlEvents:UIControlEventTouchDown];

    

        [_effectView release];
    }
    self.tabBarController.tabBar.hidden = NO;
}

- (void)removeEffectHaaAct:(UIButton *)sender {
//    UIView *view = [self.view viewWithTag:100];
//    [view removeFromSuperview];
    if (self.effectView.superview == self.view) {
        [self.effectView removeFromSuperview];
    }
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//1:首先我们计算一下 单个文件的大小

- ( long long ) fileSizeAtPath:( NSString *) filePath{
    
    NSFileManager * manager = [ NSFileManager defaultManager ];
    
    if ([manager fileExistsAtPath :filePath]){
        
        return [[manager attributesOfItemAtPath :filePath error : nil ] fileSize ];
    }
    return 0 ;
    
}
//2: 遍历文件夹获得文件夹大小，返回多少 M（提示：你可以在工程界设置（)m）

- ( float ) folderSizeAtPath:( NSString *) folderPath{
    
    NSFileManager * manager = [ NSFileManager defaultManager ];
    
    if (![manager fileExistsAtPath :folderPath]) return 0 ;
    
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath :folderPath] objectEnumerator ];
    
    NSString * fileName;
    
    long long folderSize = 0 ;
    
    while ((fileName = [childFilesEnumerator nextObject ]) != nil ){
        
        NSString * fileAbsolutePath = [folderPath stringByAppendingPathComponent :fileName];
        
        folderSize += [ self fileSizeAtPath :fileAbsolutePath];
        
    }
    
    return folderSize/( 1024.0 * 1024.0 );
    
}

// 显示缓存大小

- ( float )filePath

{
    
    NSString * cachPath = [ NSSearchPathForDirectoriesInDomains ( NSCachesDirectory , NSUserDomainMask , YES ) firstObject ];
    
    return [ self folderSizeAtPath :cachPath];
    
}

// 清理缓存

- ( void )clearFile

{
    
    NSString * cachPath = [ NSSearchPathForDirectoriesInDomains ( NSCachesDirectory , NSUserDomainMask , YES ) firstObject ];
    
    NSArray * files = [[ NSFileManager defaultManager ] subpathsAtPath :cachPath];
    
    NSLog ( @"cachpath = %@" , cachPath);
    
    for ( NSString * p in files) {
        NSError * error = nil ;
        
        NSString * path = [cachPath stringByAppendingPathComponent :p];
        if ([[ NSFileManager defaultManager ] fileExistsAtPath :path]) {
            [[ NSFileManager defaultManager ] removeItemAtPath :path error :&error];
            
        }
    }
    [ self performSelectorOnMainThread : @selector (clearCachSuccess) withObject :nil waitUntilDone : YES ];
}

- ( void )clearCachSuccess

{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"清理完毕" message:@"YES" preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *delete = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        [SeachManager removeAll];

    }];
    [alert addAction:delete];
    [self presentViewController:alert animated:YES completion:^{

    }];
    NSLog ( @" 清理成功 " );
//    UIAlertView * alertView = [[ UIAlertView alloc ] initWithTitle : @" 提示 " message : @" 缓存清理完毕 " delegate : nil cancelButtonTitle : @" 确定 " otherButtonTitles : nil ];
//    [alertView show ];
//清理完之后重新导入数据
}


- (NSString *)intervalSinceNow: (NSString *) theDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    NSString *datee = [formatter stringFromDate:[NSDate date]];
    theDate = [NSString stringWithFormat:@"%d-1-1", datee.intValue + 1];
    
    
    NSArray *timeArray=[theDate componentsSeparatedByString:@"."];
    theDate=[timeArray objectAtIndex:0];
    
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd"];
    NSDate *d=[date dateFromString:theDate];
    
    NSTimeInterval late=[d timeIntervalSince1970]*1;
    
    NSDate* dat = [NSDate date];
    NSTimeInterval now=[dat timeIntervalSince1970]*1;
    NSString *timeString=@"";
    
    NSTimeInterval cha=late-now;
    
    if (cha/3600<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/60];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@分", timeString];
        
    }
    if (cha/3600>1&&cha/86400<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/3600];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"剩余%@小时", timeString];
    }
    if (cha/86400>1)
    {
        timeString = [NSString stringWithFormat:@"%f", cha/86400];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"剩余%@天", timeString];
        
    }
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[\u4e00-\u9fa5]" options:0 error:nil];
    NSString *string1 = [regex stringByReplacingMatchesInString:timeString options:0 range:NSMakeRange(0, timeString.length) withTemplate:@""];
    NSLog(@"%@",string1);
    int month = string1.intValue / 30;
    int day = string1.intValue % 30;
    NSString *string = [NSString stringWithFormat:@"你的%@大约还有%d个月零%d天", datee, month, day];
    return string;
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
