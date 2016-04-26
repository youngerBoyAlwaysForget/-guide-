//
//  SingleLabel.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/21.
//  Copyright © 2016年 z. All rights reserved.
//

#import "SingleLabel.h"
#import "DKNightVersion.h"
@implementation SingleLabel


+(SingleLabel *)singleLabel {
    static SingleLabel *singleLabel = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        singleLabel = [[SingleLabel alloc] init];
        
    });
    return singleLabel;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
//        self.dk_backgroundColorPicker = DKColorWithColors([UIColor clearColor], [UIColor clearColor]);
//        self.dk_tintColorPicker = DKColorWithColors([UIColor clearColor], [UIColor whiteColor]);
        self.dk_textColorPicker = DKColorWithColors([UIColor blackColor], [UIColor lightGrayColor]);
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
