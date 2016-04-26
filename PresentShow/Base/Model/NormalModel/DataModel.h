//
//  DataModel.h
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/10.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXBaseModel.h"

@interface DataModel : XXBaseModel
@property (nonatomic, copy) NSDictionary *paging;
@property (nonatomic, retain) NSArray *items;

- (instancetype)initWithDic:(NSDictionary *)dic;
@end
