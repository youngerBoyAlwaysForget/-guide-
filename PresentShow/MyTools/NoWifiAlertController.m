//
//  XXNoWifiAlertController.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/26.
//  Copyright © 2016年 z. All rights reserved.
//

#import "NoWifiAlertController.h"

@implementation NoWifiAlertController

+ (NoWifiAlertController *)createAlert {
//    static NoWifiAlertController *meme = nil;
//    static dispatch_once_t once;
//    dispatch_once(&once, ^{
//        
//    })
//    if (<#condition#>) {
//        <#statements#>
//    }
    NoWifiAlertController *alert = [NoWifiAlertController alertControllerWithTitle:@"notice" message:@"WiFi不可用" preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *act = [UIAlertAction actionWithTitle:@"return" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    [alert addAction:act];
    return alert;
}
+ (NoWifiAlertController *)createAlertWhenCollectFinished {
    NoWifiAlertController *alert = [NoWifiAlertController alertControllerWithTitle:@"notice" message:@"收藏成功" preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *act = [UIAlertAction actionWithTitle:@"return" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alert addAction:act];
    return alert;

}
+ (NoWifiAlertController *)createAlertIfNoDataSource:(NSString *)string ViewC:(UINavigationController *)nava {
    NoWifiAlertController *alert = [NoWifiAlertController alertControllerWithTitle:@"notice" message:string preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *act = [UIAlertAction actionWithTitle:@"return" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [nava popViewControllerAnimated:YES];
    }];
    [alert addAction:act];
    return alert;
    
}

@end
