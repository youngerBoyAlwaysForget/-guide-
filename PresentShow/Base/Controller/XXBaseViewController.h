//
//  XXBaseViewController.h
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/7.
//  Copyright © 2016年 z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XXAFNetTool.h"
#import "DKNightVersion.h"
#import "Reachability.h"
#import "NoWifiAlertController.h"
#import "MBProgressHUD+NJ.h"
#define WIDTH [[UIScreen mainScreen] bounds].size.width
#define HEIGHT [[UIScreen mainScreen] bounds].size.height
@interface XXBaseViewController : UIViewController

- (NSString *)getCurrentTime;
@end
