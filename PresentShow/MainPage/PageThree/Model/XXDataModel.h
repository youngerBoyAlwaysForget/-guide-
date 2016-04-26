//
//  XXdataModel.h
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/8.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXBaseModel.h"
#import "XXCategoriesModel.h"
@interface XXDataModel : XXBaseModel

@property (nonatomic, retain) NSArray *categories;
@property (nonatomic, retain) XXCategoriesModel *categoriesModel;

@property (nonatomic, retain) NSArray *leftArr;

- (instancetype)initWithDic:(NSDictionary *)dic;
@end
