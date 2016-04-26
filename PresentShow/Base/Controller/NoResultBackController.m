//
//  NoResultBackController.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/27.
//  Copyright © 2016年 z. All rights reserved.
//

#import "NoResultBackController.h"

#define PopVC [self.navigationController popToRootViewControllerAnimated:YES];
@implementation NoResultBackController
+ (NoResultBackController *)createAlert:(BOOL)YesNo ViewController:(UINavigationController *)viewcontroller{
    NoResultBackController *alert = [NoResultBackController alertControllerWithTitle:@"notice" message:@"WiFi不可用" preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *act = [UIAlertAction actionWithTitle:@"return" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (YesNo) {
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [viewcontroller popViewControllerAnimated:YES];
                //放在里面纯属为了安全起见,放在外面没有什么明显的问题
               
            });
            
        }
        
    }];
    [alert addAction:act];
    return alert;
}
@end
