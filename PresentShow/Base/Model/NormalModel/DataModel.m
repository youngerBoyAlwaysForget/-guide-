//
//  DataModel.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/10.
//  Copyright © 2016年 z. All rights reserved.
//

#import "DataModel.h"
#import "ItemsModel.h"
@implementation DataModel

- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
        
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in _items) {
            ItemsModel *item = [[ItemsModel alloc] init];
            [item setValuesForKeysWithDictionary:dic];
            [arr addObject:item];
        }
        self.items = [NSArray arrayWithArray:arr];
    }
    return self;
}
@end
