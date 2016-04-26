//
//  XXOiceModel.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/8.
//  Copyright © 2016年 z. All rights reserved.
//

#import "OiceModel.h"

@implementation OiceModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        self.idXiha = value;
    }
}
@end
