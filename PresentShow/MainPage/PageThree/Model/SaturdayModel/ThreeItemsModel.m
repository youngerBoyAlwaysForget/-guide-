//
//  XXItemsModel.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/8.
//  Copyright © 2016年 z. All rights reserved.
//

#import "ThreeItemsModel.h"

@implementation ThreeItemsModel
- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
        
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in self.items) {
            ItemsSaturdayModel *mememmeme = [[ItemsSaturdayModel alloc] init];
            [mememmeme setValuesForKeysWithDictionary:dic];
            [arr addObject:mememmeme];
            [mememmeme release];
        }
        self.items = [NSArray arrayWithArray:arr];
    }
    return self;
}
@end
