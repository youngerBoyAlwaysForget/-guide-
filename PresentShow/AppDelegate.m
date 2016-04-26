//
//  AppDelegate.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/7.
//  Copyright © 2016年 zxx. All rights reserved.
//

#import "AppDelegate.h"
//#import "One_ViewController.h"
#import "HotDoorViewController.h"
#import "ThreeViewController.h"
#import "XXViewController.h"
#import "BeautyViewController.h"

#import "MainViewController.h"
#import "FirstViewController.h"
//
//#import "UMSocial.h"
//#import "UMSocialWechatHandler.h"
@interface AppDelegate ()<sendBool>
@property (nonatomic, retain) UITabBarController *tabBar;

@property (nonatomic, assign) BOOL num;
@end

@implementation AppDelegate
-(void)dealloc {
    [_window release];
    [_tabBar release];
//    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [super dealloc];
}
//- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
//    BOOL result = [UMSocialSnsService handleOpenURL:url];
//    if (result == FALSE) {
//        //调用其他SDK，例如支付宝SDK等
//    }
//    return result;
//}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [UIApplication sharedApplication] .statusBarStyle = UIStatusBarStyleLightContent;

//    [UMSocialData setAppKey:@"56f6616fe0f55a9cd3000aef"];
//    [UMSocialWechatHandler setWXAppId:@"wxf552932b96758437" appSecret:@"bca2df900a925e1ce124ce1d75bb7243" url:nil];
//    [UMSocialConfig hiddenNotInstallPlatforms:@[UMShareToWechatTimeline, UMShareToWechatSession,UMShareToWechatFavorite,UMShareToTencent,UMShareToDouban]];
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    

    BeautyViewController *renwu = [[BeautyViewController alloc] init];
    UINavigationController *nava = [[UINavigationController alloc] initWithRootViewController:renwu];
    nava.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"South" image:[UIImage imageNamed:@"new"] selectedImage:[UIImage imageNamed:@"newred"]];
    
    HotDoorViewController *hotDoor = [[HotDoorViewController alloc] init];
    UINavigationController *nava2 = [[UINavigationController alloc] initWithRootViewController:hotDoor];
    nava2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"单品" image:[UIImage imageNamed:@"b2"  ] selectedImage: [UIImage imageNamed:@"b1"]];
    
    ThreeViewController *class = [[ThreeViewController alloc] init];
    UINavigationController *nave = [[UINavigationController alloc] initWithRootViewController:class];
    nave.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"分类" image:[UIImage imageNamed:@"c2"  ] selectedImage: [UIImage imageNamed:@"c1"]];
    
    XXViewController *xx = [[XXViewController alloc] init];
    UINavigationController *nave2 = [[UINavigationController alloc] initWithRootViewController:xx];
    nave2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"d2"  ] selectedImage: [UIImage imageNamed:@"d1"]];
    
    MainViewController *page = [[MainViewController alloc] init];
//    page.dataSource = self;
    UINavigationController *nave3 = [[UINavigationController alloc] initWithRootViewController:page];
    nave3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"指南" image:[UIImage imageNamed:@"a2"  ] selectedImage: [UIImage imageNamed:@"a1"]];
    
    
    self.tabBar = [[UITabBarController alloc] init];
    self.tabBar.viewControllers = @[nave3, nava2, nava, nave, nave2];
    self.tabBar.tabBar.tintColor = [UIColor redColor];
    self.tabBar.tabBar.barTintColor = [UIColor whiteColor];
    
    
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    if ([userDefaults objectForKey:@"FirstLoad"] == nil) {
//        [userDefaults setBool:NO forKey:@"Firstload"];
//        FirstViewController *first = [[FirstViewController alloc] init];
//        self.window.rootViewController = first;
//        NSLog(@"%@", userDefaults);
//        [first release];
//    } else {
//        self.window.rootViewController = tabBarController;
//    }
//    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunched"]) {
//        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunched"];
//        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
//    }
    NSUserDefaults *firstShowDefaults = [NSUserDefaults standardUserDefaults];
    if (![firstShowDefaults boolForKey:@"firstLaunch"]) {
        [firstShowDefaults setBool:YES forKey:@"firstLaunch"];
        
        FirstViewController *appStartController = [[FirstViewController alloc] init];
       
        appStartController.delegetee = self;
        self.num = NO;

         self.window.rootViewController = appStartController;
//        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
//        [center addObserver:self selector:@selector(setRootViewControllerrrr) name:@"firstLoad" object:nil];

        
        [appStartController release];
    }else {
        self.window.rootViewController = self.tabBar;
    }
    


    
    [renwu release];
    [nava release];
    [hotDoor release];
    [nava2 release];
    [class release];
    [nave release];
    [xx release];
    [nave2 release];
    [_tabBar release];
    
    
    [nave3.tabBarItem release];
    [nava2.tabBarItem release];
    [nave.tabBarItem release];
    [nave2.tabBarItem release];
    return YES;
}
//代理实现方法
//- (void)setRootViewControllerrrr {
//    self.window.rootViewController = self.tabBar;
//}

-(BOOL)sendhahahhaahha:(BOOL)yesNo {
    self.num = yesNo;
    self.window.rootViewController = _tabBar;
    return yesNo;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
