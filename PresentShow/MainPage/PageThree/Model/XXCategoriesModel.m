//
//  XXgroupsModel.m
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/8.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXCategoriesModel.h"

@implementation XXCategoriesModel

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
        
        NSMutableArray *mutable = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *doc in self.subcategories) {
            
            self.subcategoriesModel = [[XXSubcategoriesModel alloc] init];
            [self.subcategoriesModel setValuesForKeysWithDictionary:doc];
            [mutable addObject:self.subcategoriesModel];
            [self.subcategoriesModel release];
        }
        self.subcategories = [NSArray arrayWithArray:mutable];
    }
    return self;
}
@end
