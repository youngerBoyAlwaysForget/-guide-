//
//  XXItemsModel.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/8.
//  Copyright © 2016年 z. All rights reserved.
//

#import "TwoItemsModel.h"

@implementation TwoItemsModel
- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
        
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in self.items) {
            XXHotModel *hotModel = [[XXHotModel alloc] init];
            [hotModel setValuesForKeysWithDictionary:dic[@"data"]];
            [arr addObject:hotModel];
            [hotModel release];
        }
        self.items = [NSArray arrayWithArray:arr];
    }
    return self;
}
@end
