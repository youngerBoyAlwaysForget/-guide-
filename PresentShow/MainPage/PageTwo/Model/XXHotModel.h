//
//  XXHotModel.h
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/7.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXBaseModel.h"

@interface XXHotModel : XXBaseModel

@property (nonatomic, copy) NSString *purchase_url;
@property (nonatomic, copy) NSString *updated_at;
@property (nonatomic, copy) NSString *cover_image_url;
@property (nonatomic, copy) NSString *descriptions;
@property (nonatomic, retain) NSNumber *favorites_count;
@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, retain) NSArray *webp_urls;
@end
