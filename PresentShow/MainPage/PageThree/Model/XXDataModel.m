//
//  XXdataModel.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/8.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXDataModel.h"

@implementation XXDataModel

- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
        
        NSMutableArray *mutable = [NSMutableArray arrayWithCapacity:0];
        NSMutableArray *leftarr = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in self.categories) {
            self.categoriesModel = [[[XXCategoriesModel alloc] initWithDictionary:dic] autorelease];
            [mutable addObject:self.categoriesModel];
            [leftarr addObject:_categoriesModel.name];
            
        }
        self.leftArr = [NSArray arrayWithArray:leftarr];
        self.categories = [NSArray arrayWithArray:mutable];
    }
    return self;
}
@end
