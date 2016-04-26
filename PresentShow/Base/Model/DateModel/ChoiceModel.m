//
//  XXChoiceModel.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/8.
//  Copyright © 2016年 z. All rights reserved.
//

#import "ChoiceModel.h"
#import "OiceModel.h"
@implementation ChoiceModel

- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
        
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in self.channels) {
            OiceModel *oiceModel = [[OiceModel alloc] init];
            [oiceModel setValuesForKeysWithDictionary:dic];
            [array addObject:oiceModel];
        }
        self.channels = [NSArray arrayWithArray:array];
    }
    return self;
}
@end
