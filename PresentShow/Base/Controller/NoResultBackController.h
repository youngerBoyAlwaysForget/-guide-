//
//  NoResultBackController.h
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/27.
//  Copyright © 2016年 z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XXBaseViewController.h"
@interface NoResultBackController : UIAlertController
+ (NoResultBackController *)createAlert:(BOOL)YesNo ViewController:(UINavigationController *)viewcontroller;
@end
