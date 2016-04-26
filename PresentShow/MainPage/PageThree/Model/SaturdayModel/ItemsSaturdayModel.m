//
//  XXHotModel.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/7.
//  Copyright © 2016年 z. All rights reserved.
//

#import "ItemsSaturdayModel.h"

@interface ItemsSaturdayModel()


@end
@implementation ItemsSaturdayModel


- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"description"]) {
        self.descriptions = value;
    }
}


@end
