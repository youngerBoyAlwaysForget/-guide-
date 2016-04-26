//
//  FirstViewController.h
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/22.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXBaseViewController.h"


@protocol sendBool <NSObject>

- (BOOL)sendhahahhaahha:(BOOL)yesNo;

@end
@interface FirstViewController : XXBaseViewController

@property (nonatomic, retain) id<sendBool> delegetee;
@end
