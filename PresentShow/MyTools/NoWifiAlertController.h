//
//  XXNoWifiAlertController.h
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/26.
//  Copyright © 2016年 z. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoWifiAlertController : UIAlertController
+ (NoWifiAlertController *)createAlert;

+ (NoWifiAlertController *)createAlertWhenCollectFinished;
+ (NoWifiAlertController *)createAlertIfNoDataSource:(NSString *)string ViewC:(UINavigationController *)nava;
@end
