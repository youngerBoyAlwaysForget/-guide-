//
//  XXgroupsModel.h
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/8.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXBaseModel.h"
#import "XXSubcategoriesModel.h"
@interface XXCategoriesModel : XXBaseModel

@property (nonatomic, retain) NSNumber *order;
@property (nonatomic, retain) NSArray *subcategories;
@property (nonatomic, retain) NSNumber *idNum;
@property (nonatomic, copy) NSString *name;

@property (nonatomic, retain) XXSubcategoriesModel *subcategoriesModel;

- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end
