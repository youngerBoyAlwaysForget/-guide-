//
//  XXItemsModel.h
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/8.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXBaseModel.h"

#import "XXHotModel.h"
@interface  TwoItemsModel: XXBaseModel
@property (nonatomic, retain) NSArray *items;
//@property (nonatomic, copy) NSString *next_url;
//@property (nonatomic, copy) NSString *message;

- (instancetype)initWithDic:(NSDictionary *)dic;
@end
