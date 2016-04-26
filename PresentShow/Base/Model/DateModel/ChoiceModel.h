//
//  XXChoiceModel.h
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/8.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXBaseModel.h"

@interface ChoiceModel : XXBaseModel

@property (nonatomic, copy) NSArray *channels;

- (instancetype)initWithDic:(NSDictionary *)dic;
@end
