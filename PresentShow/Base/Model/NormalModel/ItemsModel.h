//
//  ItemsModel.h
//  PresentShow
//
//  Created by zxx_ 's compu on 16/3/10.
//  Copyright © 2016年 z. All rights reserved.
//

#import "XXBaseModel.h"

@interface ItemsModel : XXBaseModel
/// 文章 Url
@property (nonatomic, copy) NSString *content_url;
@property (nonatomic, copy) NSString *cover_image_url;
@property (nonatomic, copy) NSString *cover_webp_url;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *short_title;
@property (nonatomic, retain) NSNumber *likes_count;
@property (nonatomic, copy) NSString *updated_at;
@property (nonatomic, copy) NSString *published_at;

@property (nonatomic, copy) NSString *url;
@end
