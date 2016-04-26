//
//  XXchannelsModel.h
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/8.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXBaseModel.h"

@interface XXSubcategoriesModel : XXBaseModel

@property (nonatomic, copy) NSString *icon_url;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, retain) NSNumber *items_count;


@property (nonatomic, retain) NSNumber *idOrder;
@end
