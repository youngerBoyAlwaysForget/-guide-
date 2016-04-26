//
//  XXHotModel.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/7.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXHotModel.h"

@interface XXHotModel()


@end
@implementation XXHotModel


- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"description"]) {
        self.descriptions = value;
    }
}


@end
