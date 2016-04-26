//
//  XXBaseTableView.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/22.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXBaseTableView.h"

@implementation XXBaseTableView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dk_backgroundColorPicker = DKColorWithColors([UIColor whiteColor], [UIColor darkGrayColor]);
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
