//
//  BeautyModel.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/19.
//  Copyright © 2016年 z. All rights reserved.
//

#import "BeautyModel.h"

@implementation BeautyModel

- (instancetype)initWithArray:(NSDictionary *)array
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:array];
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
        
        for (NSDictionary *dic in self.list) {
            LIstModel *listModel = [[LIstModel alloc] init];
            [listModel setValuesForKeysWithDictionary:dic];
            [arr addObject:listModel];
            [listModel release];
        }
        self.list = [NSArray arrayWithArray:arr];
    }
//    NSLog(@"beatu%@", self.list);
    return self;
}

@end
