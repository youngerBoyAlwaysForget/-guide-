//
//  XXbutton.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/10.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXbutton.h"

@implementation XXbutton

+ (XXbutton *)singleModeButton {
    static XXbutton *mebutton = nil;

    if (!mebutton) {
        mebutton = [[self alloc] init];
        
        return mebutton;
    } else
        return mebutton;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
